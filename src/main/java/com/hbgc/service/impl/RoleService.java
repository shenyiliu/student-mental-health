package com.hbgc.service.impl;

import com.hbgc.dao.RoleDao;
import com.hbgc.entity.Role;
import com.hbgc.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService implements IRoleService {

    @Autowired
    private RoleDao roleDao;

    //1.查询角色信息
    @Override
    public List<Role> selectService() {
        return roleDao.selectRoleDao();
    }

    //添加角色信息
    @Override
    public int insertService(Role role) {
        return roleDao.insertRoleDao(role);
    }

    //根据id查询
    @Override
    public Role selectServiceID(Integer id) {
        return roleDao.selectRoleDaoID(id);
    }

    //修改角色信息
    @Override
    public int updateService(Role role) {
        return roleDao.updateRoleDao(role);
    }


    //根据id删除角色
    @Override
    public int deleteRoleService(Integer id) {
        return roleDao.deleteRoleDao(id);
    }
}
