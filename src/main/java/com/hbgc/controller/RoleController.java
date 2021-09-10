package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.aop.been.PermissionCode;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import com.hbgc.service.IRoleService;
import com.hbgc.service.impl.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.ws.Response;
import javax.xml.ws.soap.AddressingFeature;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService iRoleService;

    //1.查询角色信息
    @RequestMapping("/roleSelect")
    @PermissionCode("MNUM_role_list")
    @ResponseBody
    public PageInfo<Role> RoleSelect(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                     @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Role> list=iRoleService.selectService();
        //封装PageInfo对象
        PageInfo<Role> pageInfo=new PageInfo<Role>(list);
        return pageInfo;

    }

    //2.添加信息
    @RequestMapping("/roleInsert")
    @ResponseBody
    public int RoleInsert(Role role){
        int num=iRoleService.insertService(role);
        return num;
    }

    //3.根据id查询角色信息
    @RequestMapping("/roleSelectID")
    public ModelAndView RoleSelectID(Integer id){
        ModelAndView mv=new ModelAndView();
        mv.addObject("role",iRoleService.selectServiceID(id));
        mv.setViewName("role-edit");
        return mv;
    }

    //4.根据id修改角色信息
    @RequestMapping("/roleUpdateID")
    @ResponseBody
    public int roleUpdateID(Role role){
        return iRoleService.updateService(role);
    }

    //5.根据id删除角色信息
    @RequestMapping("/roleDeleteID")
    public ModelAndView roleDeleteID(Integer id){
        int num=iRoleService.deleteRoleService(id);
        ModelAndView mv=new ModelAndView();
        if (num>0){
            mv.setViewName("role-list");
        }
        return mv;


    }
}
