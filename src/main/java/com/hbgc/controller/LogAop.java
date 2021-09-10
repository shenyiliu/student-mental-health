package com.hbgc.controller;

import java.lang.reflect.Method;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.hbgc.entity.SysLog;
import com.hbgc.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;



@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private SysLogService sysLogService;

    private Date visitTime; // 开始时间

    private Class clazz; // 访问的类

    private Method method; // 访问的方法

    /**
     * 前置通知，SSM项目下的所有Controller中的方法都作为切入点 主要是获取开始时间，访问的是哪个类、哪个方法
     * 
     * @param jp
     */
    @Before("execution(* com.hbgc.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date(); // 获取当前时间，就是开始访问的时间
        clazz = jp.getTarget().getClass(); // 获取当前访问的类
        String methodName = jp.getSignature().getName(); // 获取访问方法的名称
        Object[] args = jp.getArgs();// 获取访问方法的参数

        // 获取具体执行的方法的Method对象
        if (args == null || args.length == 0) {
            method = clazz.getMethod(methodName); // 只能获取无参数的方法
        } else {
            // getMethod方法只能接受Class数组类型，因此，将args中的值转为Class[]类型
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            clazz.getMethod(methodName, classArgs); // 获取到有参的方法
        }
    }

    @After("execution(* com.hbgc.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        // 访问的时长
        long time = new Date().getTime() - visitTime.getTime();

        // 获取url
        String url = "";
        if (clazz != null && method != null && clazz != LogAop.class) {
            // 1.获取类上的@RequestMapping("XXX")
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);

            if (classAnnotation != null) {
                String[] classValue = classAnnotation.value();

                // 2.获取方法上的@RequestMapping("XXX")
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0] + methodValue[0];
                }

            }
        }

        // 获取访问的ip地址
        String ip = request.getRemoteAddr();
        String method = jp.getSignature().toString();
        url = request.getRequestURL().toString();
        // 获取操作者
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User) context.getAuthentication().getPrincipal();
        String username = user.getUsername();

        // 将日志相关信息封装到SysLog对象里
        SysLog sysLog = new SysLog();
        sysLog.setTimes(time);
        sysLog.setIp(ip);
        sysLog.setMethod(method);
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        System.out.println(method);

        Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sysLog.setVisitTime(format.format(visitTime));

        // 调用Service完成日志的记录操作
        if (!"PageInfo com.hbgc.controller.SysLogController.selectLogAllPageHelper(Integer,Integer)".equals(method)) {
            sysLogService.insertLog(sysLog);
        }
    }
}
