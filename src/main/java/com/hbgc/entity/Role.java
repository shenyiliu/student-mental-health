package com.hbgc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
//角色表
public class Role {

    private Integer id;
    private String name;
    private String intro;//角色描述
    private List<Permission> permissionList;
    private List<User> users;

}
