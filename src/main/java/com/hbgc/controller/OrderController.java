package com.hbgc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hbgc.aop.been.PermissionCode;
import com.hbgc.entity.Order;
import com.hbgc.entity.User;
import com.hbgc.service.IOrderService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.ibatis.annotations.Param;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    //1.添加订单信息
    @RequestMapping("/insertOrder")
    @ResponseBody
    public int insertOrder(Order order){
        return orderService.insertOrder(order);
    }

    //2.根据用户id查询订单
    @RequestMapping("/selectOrderUserID")
    @ResponseBody
    public PageInfo<Order> selectOrderUserID(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                     @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                             Integer user_id){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Order> lists=orderService.selectOrderUserID(user_id);
        System.out.println(lists);
        //封装PageInfo对象
        PageInfo<Order> pageInfo=new PageInfo<Order>(lists);
        return pageInfo;

    }

    //3.id删除deleteOrderById
    @RequestMapping("/deleteOrderById")
    @ResponseBody
    public int deleteOrderById(Integer id){
        return orderService.deleteOrderById(id);
    }

    //4.批量删除deleteOrders
    @RequestMapping("/deleteOrders")
    @ResponseBody
    public boolean deleteOrders(Integer[] ids){
        return orderService.deleteOrders(ids);
    }

    //5.修改订单updateOrder
    @RequestMapping("/updateOrder")
    @ResponseBody
    public int updateOrder(Order order){
        return orderService.updateOrder(order);
    }

    //6.根据订单id查询订单信息
    @RequestMapping("/selectOrderUserByID")
    @ResponseBody
    public ModelAndView selectOrderUserByID(Integer id){
        ModelAndView mv=new ModelAndView();
        Order order=orderService.selectOrderUserByID(id);
        mv.addObject("order",order);
        mv.setViewName("order-update");
        return mv;
    }

    //7.查询维修人员账号selectUserWX
    @RequestMapping("/selectUserWX")
    @ResponseBody
    public PageInfo<User> selectUserWX(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                             @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<User> lists=orderService.selectUserWX();
        //封装PageInfo对象
        PageInfo<User> pageInfo=new PageInfo<User>(lists);
        return pageInfo;
    }

    //8.查询所有订单信息
    @RequestMapping("/selectAll")
    @ResponseBody
    public PageInfo<Order> selectAll(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                       @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Order> lists=orderService.selectAll();
        //封装PageInfo对象
        PageInfo<Order> pageInfo=new PageInfo<Order>(lists);
        return pageInfo;
    }

    //9.添加信息
    @RequestMapping("/insertOrderItem")
    @ResponseBody
    public boolean insertOrderItem(@RequestParam(name = "userWxID") Integer userWxID,@RequestParam(name = "ids")Integer[] ids){
        return orderService.insertOrderItem(userWxID,ids);
    }


    //8.查询所有订单信息
    @RequestMapping("/selectOrderStatue")
    @ResponseBody
    public PageInfo<Order> selectOrderStatue(@RequestParam(name = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                             @RequestParam(name = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                             Integer orderStatue){
        //1.开启分页
        PageHelper.startPage(pageNum,pageSize);
        //2.执行查询语句
        List<Order> lists=orderService.selectOrderStatue(orderStatue);
        //封装PageInfo对象
        PageInfo<Order> pageInfo=new PageInfo<Order>(lists);
        return pageInfo;
    }

    //8.根据订单号查询所有订单信息
    @RequestMapping("/selectOrderUserCode")
    @ResponseBody
    public Order selectOrderUserCode(String orderCode){
        return orderService.selectOrderUserCode(orderCode);
    }
}
