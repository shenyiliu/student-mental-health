package com.hbgc.service;

import com.hbgc.entity.Permission;

import java.util.List;

public interface IPremissionService {

    List<Permission> permissionSelect();

    int permissionInsert(Permission permission);

    Permission permissionSelectID(Integer id);

    int updPermissionById(Permission permission);

    int deletePermission(Integer integer);
}
