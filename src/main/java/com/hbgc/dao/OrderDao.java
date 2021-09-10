package com.hbgc.dao;

import com.hbgc.entity.Order;
import com.hbgc.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface OrderDao {
    //1.添加订单信息
    @Insert("insert into `order` values(null,#{orderCode},#{name},#{orderTime},#{phone},#{address},0)")
    int insertOrder(Order order);

    //1.添加订单信息
    @Insert("insert into user_order values(null,#{userID},#{orderID})")
    int insertOrderItem(@Param("userID") Integer userID, @Param("orderID")Integer orderID);

    //2.根据用户id查询订单
    @Select("select id,name,orderTime,phone,address,orderStatue from `order` where id in(select orderID from user_order where userID=#{id})")
    List<Order> selectOrderUserID(Integer id);

    //3.id删除订单
    @Delete("delete from `order` where id=#{id}")
    int deleteOrderById(Integer id);

    //4.修改订单
    @Update("update `order` set orderStatue=#{orderStatue} where id=#{id}")
    int updateOrder(Order order);

    //5.根据订单id查询订单信息
    @Select("select id,name,orderTime,phone,address,orderStatue from `order` where id=#{id}")
    Order selectOrderUserByID(Integer id);

    //5.根据订单号查询订单信息
    @Select("select id,orderCode,name,orderTime,phone,address,orderStatue from `order` where orderCode= #{orderCode}")
    Order selectOrderUserCode(String orderCode);

    //6.查询维修人员信息
    @Select("select id,state,name,mobile,password,address from user where id in (select userID from user_role where roleID=2)")
    List<User> selectUserWX();

    //7.查询所有订单信息
    @Select("select id,orderCode,name,orderTime,phone,address,orderStatue from `order`")
    List<Order> selectAll();

    //8.根据订单状态查询信息
    @Select("select id,orderCode,name,orderTime,phone,address,orderStatue from `order` where orderStatue=#{orderStatue}")
    List<Order> selectOrderStatue(Integer orderStatue);

    //4.修改订单状态信息
    @Update("update `order` set orderStatue=1 where id=#{id}")
    int updateOrderState(Integer id);



}
