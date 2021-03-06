package com.hbgc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

//ๆ้่กจ
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Permission {

    private Integer id;
    private String name;
    private Integer type;
    private String  uri;
    private String code;
    private List<Role> roles;


}
