package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.aop.been.PermissionCode;
import com.hbgc.entity.Order;
import com.hbgc.entity.Permission;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import com.hbgc.service.IProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    //1.动态添加下拉框
    @RequestMapping("/selectRoleList")
    @PermissionCode("MNUM_product_list")
    @ResponseBody
    public List<Role> selectRoleList(){
        List<Role> roleList=productService.selectRoleList();
        return roleList;
    }

    //2.查询角色-权限表
    @RequestMapping("/selectRolePermission")
    @ResponseBody
    public PageInfo<Permission> selectRolePermission(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                     @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                                     Integer roleID){
        PageHelper.startPage(pageNum,pageSize);

        List<Permission> lists=productService.selectRolePermission(roleID);

        PageInfo<Permission> pageInfo=new PageInfo<>(lists);

        return pageInfo;
    }

    //3.查询用户-角色表
    @RequestMapping("/selectUserRole")
    @ResponseBody
    public PageInfo<User> selectUserRole(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                     @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                     Integer roleID){
        PageHelper.startPage(pageNum,pageSize);

        List<User> lists=productService.selectUserRole(roleID);

        PageInfo<User> pageInfo=new PageInfo<>(lists);

        return pageInfo;
    }

    //4.根据id删除角色权限表id
    @RequestMapping("/deleteRolePermission")
    @ResponseBody
    public int  deleteRolePermission(@RequestParam(name = "roleID") Integer roleID,@RequestParam(name = "permissionID") Integer permissionID){
        int num= productService.deleteRolePermission(roleID, permissionID);
        return num;
    }

    //5.解除账号授权
    @RequestMapping("/deleteUserRole")
    @ResponseBody
    public int deleteUserRole(@RequestParam(name = "userID") Integer userID,@RequestParam(name = "roleID") Integer roleID){
        int num= productService.deleteUserRole(userID, roleID);
        return num;
    }

    //6.批量授权
    @RequestMapping("/insertUserRole")
    @ResponseBody
    public boolean insertUserRole(@RequestParam(value = "ids") Integer[] ids,@RequestParam(value = "roleID") Integer roleID){
        return productService.insertUserRole(ids, roleID);
    }

    //7.角色权限树
    @RequestMapping("/getRoleInfoDetailById")
    public ModelAndView getRoleInfoDetailById(Integer userID){
        ModelAndView mv=new ModelAndView();
        Role role=productService.getRoleInfoDetailById(userID);
        mv.addObject("role",role);
        mv.setViewName("product-detail");
        return mv;
    }
}
