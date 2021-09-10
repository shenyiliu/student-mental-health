package com.hbgc.aop.impl;


import com.hbgc.aop.been.PermissionCode;
import com.hbgc.entity.User;
import com.sun.javafx.binding.LongConstant;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.Set;

@Aspect
@Component
public class PermissionCodeAop {

    @Autowired
    private HttpSession session;


    @Around("@annotation(permissionCode)") //权限判断只能使用@Around
    public Object hanlder(ProceedingJoinPoint point, PermissionCode permissionCode){

        Object result=null;

        //1.获取权限
        User user=(User) session.getAttribute("userSession");
        Set<String> permissionSet= user.getPersissionSet();
        System.out.println(permissionSet);

        //2.获取用户访问方法的权限
        String pcode= permissionCode.value();

        //3.判断是否包含pcode权限
        if (permissionSet.contains(pcode)){
            try {
                //有权限，继续执行
                //调用controller

                result=point.proceed(point.getArgs());
            }catch (Throwable e){
                e.printStackTrace();
            }
        }else{
            System.out.println("你没有相应权限");
        }


        return result;
    }

}
