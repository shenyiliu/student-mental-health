package com.hbgc.service;


import com.hbgc.entity.Order;
import com.hbgc.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IOrderService {

    int insertOrder(Order order);

    List<Order> selectOrderUserID(Integer id);

    int deleteOrderById(Integer id);

    boolean deleteOrders(Integer[] id);

    int updateOrder(Order order);

    Order selectOrderUserByID(Integer id);

    List<User> selectUserWX();

    List<Order> selectAll();

    boolean insertOrderItem(Integer userID,Integer[] ids);

    List<Order> selectOrderStatue(Integer orderStatue);

    Order selectOrderUserCode(String orderCode);
}
