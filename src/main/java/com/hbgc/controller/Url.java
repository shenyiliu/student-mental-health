package com.hbgc.controller;

import com.hbgc.aop.been.PermissionCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/url")
public class Url {

    //菜单跳转
    //main.jsp
    @RequestMapping("/main")
    @ResponseBody
    public ModelAndView urlMain(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;
    }

    //1.0 user-list.jsp 用户管理
    @RequestMapping("/user-list")
    @ResponseBody
    public ModelAndView url_user_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("user-list");
        return mv;
    }

    //1.1 user-add.jsp
    @RequestMapping("/user-add")
    @ResponseBody
    public ModelAndView url_user_add(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("user-add");
        return mv;
    }

//########################################################
    //2.0 role-list.jsp 角色管理
    @RequestMapping("/role-list")
    @ResponseBody
    public ModelAndView url_role_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("role-list");
        return mv;
    }
    //2.1 role-add.jsp 添加
    @RequestMapping("/role-add")
    @ResponseBody
    public ModelAndView url_role_add(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("role-add");
        return mv;
    }
    //2.1 role-add.jsp 修改
    @RequestMapping("/role-edit")
    @ResponseBody
    public ModelAndView url_role_edit(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("role-edit");
        return mv;
    }

//########################################################
    //3.0permission-list.jsp 权限管理
    @RequestMapping("/permission-list")
    @ResponseBody
    public ModelAndView url_permission_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("permission-list");
        return mv;
    }

    //3.1 permission-add.jsp
    @RequestMapping("/permission-add")
    @ResponseBody
    public ModelAndView url_permission_add(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("permission-add");
        return mv;
    }

//########################################################
    //4.0order-list.jsp 订单管理
    @RequestMapping("/order-list")
    @ResponseBody
    public ModelAndView url_order_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("order-list");
        return mv;
    }

    //4.1order-add.jsp 订单管理
    @RequestMapping("/order-add")
    @ResponseBody
    public ModelAndView url_order_add(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("order-add");
        return mv;
    }

//4.1order-update.jsp 订单管理
    @RequestMapping("/order-update")
    @ResponseBody
    public ModelAndView url_order_update(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("order-update");
        return mv;
    }

    //5.1 order-page-list.jsp 订单管理
    @RequestMapping("/order-page-list")
    @ResponseBody
    public ModelAndView url_order_page_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("order-page-list");
        return mv;
    }

    //5.1 order-page-list.jsp 订单管理
    @RequestMapping("/order-show")
    @ResponseBody
    public ModelAndView url_order_show(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("order-show");
        return mv;
    }
    //########################################################

    //5.product-list.jsp 授权管理
    @RequestMapping("/product-list")
    @ResponseBody
    public ModelAndView url_product_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("product-list");
        return mv;
    }

    //5.1 product-add.jsp 账号授权
    @RequestMapping("/product-add")
    @ResponseBody
    public ModelAndView url_product_add(Integer user){
        ModelAndView mv=new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("product-add");
        return mv;
    }

    //5.2.product-detail.jsp 角色授权
    @RequestMapping("/product-detail")
    @ResponseBody
    public ModelAndView url_product_detail(Integer user){
        ModelAndView mv=new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("product-detail");
        return mv;
    }

    //================================================
    @RequestMapping("/yj-list")
    @ResponseBody
    public ModelAndView url_yj_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("yj-list");
        return mv;
    }

    @RequestMapping("/yj-add")
    @ResponseBody
    public ModelAndView url_yj_add(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("yj-add");
        return mv;
    }

    @RequestMapping("/yj-edit")
    @ResponseBody
    public ModelAndView url_yj_edit(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("yj-edit");
        return mv;
    }
    //==========================================
    @RequestMapping("/tb-list")
    @ResponseBody
    public ModelAndView url_tb_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("tb-list");
        return mv;
    }

    //==========================================
    @RequestMapping("/gg-list")
    @ResponseBody
    public ModelAndView url_gg_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("gg-list");
        return mv;
    }

    @RequestMapping("/gg-add")
    @ResponseBody
    public ModelAndView url_gg_add(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("gg-add");
        return mv;
    }

    @RequestMapping("/gg-edit")
    @ResponseBody
    public ModelAndView url_gg_edit(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("gg-edit");
        return mv;
    }
    //======================================

    //syslog-list
    @RequestMapping("/syslog-list")
    @ResponseBody
    public ModelAndView url_syslog_list(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("syslog-list");
        return mv;
    }
}
