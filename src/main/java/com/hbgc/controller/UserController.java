package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.aop.been.PermissionCode;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import com.hbgc.service.IUserService;
import com.hbgc.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    //1.查询所有用户信息
    @RequestMapping("/userSelect")
    @ResponseBody
    public PageInfo<User> userSelect(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                     @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<User> list=userService.selectUser();
        //封装PageInfo对象
        PageInfo<User> pageInfo=new PageInfo<User>(list);
        return pageInfo;

    }

    //2.添加用户信息
    @RequestMapping("/userInsert")
    @ResponseBody
    public int userInsert(User user){
        int num=userService.insertUser(user);
        return num;
    }

    //3.删除单个信息
    @RequestMapping("/userDelete")
    @ResponseBody
    public Integer userDelete(Integer id){
        int num=userService.deleteUser(id);
        return num;
    }

    //4.批量刪除信息
    @RequestMapping("/userDeleteIDs")
    @ResponseBody
    public boolean userDeleteIDs(Integer[] ids){
        return userService.deleteUserIDs(ids);
    }

    //5.根據id查詢信息
    @RequestMapping("userSelectID")
    public ModelAndView userSelectID(Integer id){
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",userService.selectUserID(id));
        mv.setViewName("user-edit");
        return mv;
    }

    //6.根据id修改信息
    @RequestMapping("/userUpdate")
    @ResponseBody
    public int userUpdate(User user){
        int num=userService.updateUserInfo(user);
        return num;
    }

    //7.根据电话号码查询信息
    @RequestMapping("/userSelectMobile")
    @ResponseBody
    public List<User> userSelectMobile(String mobile){
        List<User> list=userService.selectUserMobile(mobile);
        return list;

    }

    //8.登录
    @RequestMapping("/userSelectLoginA")
    @ResponseBody
    public User userSelectLogin(String name, HttpServletRequest request){
        //查询账号密码登录
        User user1=userService.selectUserLogin(name);
        HttpSession session=request.getSession(true);
        session.setAttribute("userInfo",user1);
        return user1;
    }

    //9.注册
    @RequestMapping("/userSelectRegister")
    @ResponseBody
    public int userSelectRegister(User user){
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

    //10.获取用户id
    @RequestMapping("/userSelectLoginID")
    @ResponseBody
    public ModelAndView userSelectLoginID(String name, HttpServletRequest request){
        //查询账号密码登录
        User user1=userService.selectUserLogin(name);
        Role roleItem=userService.selectRole(user1.getId());

        HttpSession session=request.getSession(true);
        session.setAttribute("userInfo",user1);
        session.setAttribute("roleInfo",roleItem);
        ModelAndView mv=new ModelAndView("main");
        return mv;
    }
}
