package com.hbgc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Set;

//用户表
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer id;
    private Integer state;
    private String name;
    private String mobile;
    private String password;
    private String address;




    private List<Role> roles;
    private Set<String> persissionSet;//权限码

}
