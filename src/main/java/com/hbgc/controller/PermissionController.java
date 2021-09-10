package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.aop.been.PermissionCode;
import com.hbgc.entity.Order;
import com.hbgc.entity.Permission;
import com.hbgc.service.IPremissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPremissionService premissionService;

    //1.查询权限信息
    @RequestMapping("/permissionSelect")
    @ResponseBody
    public PageInfo<Permission> permissionSelect(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                  @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Permission> lists=premissionService.permissionSelect();
        //封装PageInfo对象
        PageInfo<Permission> pageInfo=new PageInfo<Permission>(lists);
        return pageInfo;

    }

    //2.新增
    @RequestMapping("/permissionInsert")
    @ResponseBody
    public int permissionInsert(Permission permission){
        int num=premissionService.permissionInsert(permission);
        System.out.println(num);
        return num;
    }

    //3.id查询
    @RequestMapping("/permissionSelectID")
    @ResponseBody
    public ModelAndView permissionSelectID(Integer id){
        ModelAndView mv=new ModelAndView();
        Permission list= premissionService.permissionSelectID(id);
        mv.setViewName("permission-edit");
        mv.addObject("list",list);
        return mv;
    }

    //4.id修改updPermissionById
    @RequestMapping("/updPermissionById")
    public ModelAndView updPermissionById(Permission permission){
        ModelAndView mv=new ModelAndView();
        int num= premissionService.updPermissionById(permission);
        if(num>0){
            mv.setViewName("permission-list");
        }
        return mv;
    }

    //5.删除
    @RequestMapping("/deletePermission")
    public ModelAndView deletePermission(Integer id){
        ModelAndView mv=new ModelAndView();
        int num= premissionService.deletePermission(id);
        if (num>0){
            mv.setViewName("permission-list");
        }
        return mv;
    }

}
