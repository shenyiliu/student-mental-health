package com.hbgc.controller;

import com.hbgc.entity.User;
import com.hbgc.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/register")
public class registController {

    @Autowired
    private IUserService userService;

    //7.根据电话号码查询信息
    @RequestMapping("/userSelectMobile")
    @ResponseBody
    private List<User> userSelectMobile(String mobile){
        List<User> list=userService.selectUserMobile(mobile);
        return list;

    }

    //8.登录
    @RequestMapping("/userSelectLoginA")
    @ResponseBody
    private User userSelectLogin(String name, HttpServletRequest request){
        //查询账号密码登录
        User user1=userService.selectUserLogin(name);
        HttpSession session=request.getSession(true);
        session.setAttribute("userInfo",user1);
        return user1;
    }

    //9.注册
    @RequestMapping("/userSelectRegister")
    @ResponseBody
    private int userSelectRegister(User user){
        int num=userService.insertUserRegister(user);
        User user1=userService.selectUserLogin(user.getName());
        System.out.println(user1);
        int num1=userService.insertUserRole(user1.getId(),3);
        if (num>0 && num1>0){
            return num;
        }else{
            return 0;
        }

    }

}
