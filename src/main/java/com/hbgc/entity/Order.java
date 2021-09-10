package com.hbgc.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//工单表
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    private Integer id;
    private String orderCode;
    private  String name;
    private String orderTime;
    private String phone;
    private String address;
    private Integer orderStatue;
    private Integer user_id;

}
