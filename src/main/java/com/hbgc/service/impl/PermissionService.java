package com.hbgc.service.impl;

import com.hbgc.dao.PermissionDao;
import com.hbgc.entity.Permission;
import com.hbgc.service.IPremissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionService implements IPremissionService {

    @Autowired
    private PermissionDao permissionDao;


    //1.查询所有权限信息
    @Override
    public List<Permission> permissionSelect() {
        return permissionDao.permissionSelectDao();
    }

    //2.新增
    @Override
    public int permissionInsert(Permission permission) {
        return permissionDao.permissionInsert(permission);
    }

    //3.根据id查询信息
    @Override
    public Permission permissionSelectID(Integer id) {
        return permissionDao.permissionSelectID(id);
    }

    //4.修改
    @Override
    public int updPermissionById(Permission permission) {
        return permissionDao.updPermissionById(permission);
    }

    //5.删除
    @Override
    public int deletePermission(Integer id) {
        return permissionDao.deletePermission(id);
    }


}
