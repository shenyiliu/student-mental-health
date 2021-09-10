package com.hbgc.service.impl;

import com.hbgc.dao.ProductDao;
import com.hbgc.entity.Permission;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import com.hbgc.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements IProductService {

    @Autowired
    private ProductDao productDao;

    //1.动态添加下拉框
    @Override
    public List<Role> selectRoleList() {
        return productDao.selectRoleList();
    }

    //2.id查询角色权限
    @Override
    public List<Permission> selectRolePermission(Integer roleID) {
        return productDao.selectRolePermission(roleID);
    }

    //3.用户-角色表搜索
    @Override
    public List<User> selectUserRole(Integer roleID) {
        return productDao.selectUserRole(roleID);
    }

    //4.解除角色授权
    @Override
    public int deleteRolePermission(Integer roleID, Integer permissionID) {
        return productDao.deleteRolePermission(roleID, permissionID);
    }

    //5.解除账号授权
    @Override
    public int deleteUserRole(Integer userID, Integer roleID) {
        return productDao.deleteUserRole(userID, roleID);
    }

    @Override
    public boolean insertUserRole(Integer[] userID, Integer roleID) {
        for (int i = 0; i < userID.length; i++) {
            productDao.insertUserRole(userID[i],roleID);
        }
        return false;

    }

    //7.根据角色id查询角色权限表并显示在角色中
    @Override
    public Role getRoleInfoDetailById(Integer id) {
        return productDao.getRoleInfoDetailById(id);
    }
}
