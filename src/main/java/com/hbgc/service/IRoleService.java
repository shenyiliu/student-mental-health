package com.hbgc.service;

import com.hbgc.entity.Role;

import java.util.List;

public interface IRoleService {

    List<Role> selectService();

    int insertService(Role role);

    Role selectServiceID(Integer id);

    int updateService(Role role);

    int deleteRoleService(Integer id);
}
