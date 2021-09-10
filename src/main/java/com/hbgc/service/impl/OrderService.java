package com.hbgc.service.impl;

import com.hbgc.dao.OrderDao;
import com.hbgc.entity.Order;
import com.hbgc.entity.User;
import com.hbgc.service.IOrderService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService implements IOrderService {

    @Autowired
    private OrderDao orderDao;

    //1.添加订单信息
    @Override
    public int insertOrder(Order order) {
        int num=orderDao.insertOrder(order);
        int userid=order.getUser_id();
        Order order1=orderDao.selectOrderUserCode(order.getOrderCode());
        int num2=orderDao.insertOrderItem(userid,order1.getId());
        if (num>0&&num2>0){
            return 1;
        }
        return 0;

    }

    //2.根据id查询订单信息
    @Override
    public List<Order> selectOrderUserID(Integer id) {
        return orderDao.selectOrderUserID(id);
    }

    //3.根据id删除信息
    @Override
    public int deleteOrderById(Integer id) {
        return orderDao.deleteOrderById(id);
    }

    //4.批量删除
    @Override
    public boolean deleteOrders(Integer[] id) {
        for (int i = 0; i < id.length; i++) {

            orderDao.deleteOrderById(id[i]);
        }
        return false;
    }

    //5.修改订单
    @Override
    public int updateOrder(Order order) {
        return orderDao.updateOrder(order);
    }

    //6.根据订单id查询订单信息
    @Override
    public Order selectOrderUserByID(Integer id) {
        return orderDao.selectOrderUserByID(id);
    }

    //7.查询维修人员账号
    @Override
    public List<User> selectUserWX() {
        return orderDao.selectUserWX();
    }

    //查询所有订单信息
    @Override
    public List<Order> selectAll() {
        return orderDao.selectAll();
    }

    //添加用户订单信息
    @Override
    public boolean insertOrderItem(Integer userID, Integer[] ids) {
        for (int i=0;i<ids.length;i++){
            orderDao.insertOrderItem(userID,ids[i]);
            orderDao.updateOrderState(ids[i]);
        }
        return true;
    }

    //8.根据订单状态查询信息
    @Override
    public List<Order> selectOrderStatue(Integer orderStatue) {
        return orderDao.selectOrderStatue(orderStatue);
    }

    @Override
    public Order selectOrderUserCode(String orderCode) {
        return orderDao.selectOrderUserCode(orderCode);
    }

    //9.根据订单号查询信息


}
