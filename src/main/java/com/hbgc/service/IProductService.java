package com.hbgc.service;

import com.hbgc.entity.Permission;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IProductService {

    List<Role> selectRoleList();

    List<Permission> selectRolePermission(Integer roleID);

    List<User> selectUserRole(Integer roleID);

    int deleteRolePermission(Integer roleID,Integer permissionID);

    int deleteUserRole(Integer userID,Integer roleID);

    boolean insertUserRole(Integer[] userID,Integer roleID);

    Role getRoleInfoDetailById(Integer id);

}
