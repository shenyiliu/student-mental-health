package com.hbgc.service.impl;

import com.hbgc.dao.MainDao;
import com.hbgc.entity.Notice;
import com.hbgc.service.IMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainService implements IMainService {

    @Autowired
    private MainDao mainDao;

    //1.查询用户数量
    @Override
    public int selectUserIndex() {
        return mainDao.selectUserIndex();
    }
    //2.查询角色数量
    @Override
    public int selectRoleIndex() {
        return mainDao.selectRoleIndex();
    }
    //3.查询权限数量
    @Override
    public int selectPermissionIndex() {
        return mainDao.selectPermissionIndex();
    }
    //4.查询语料库数量
    @Override
    public int selectYwIndex() {
        return mainDao.selectYwIndex();
    }

    @Override
    public List<Notice> selectNoticeAll() {
        return mainDao.selectNoticeAll();
    }

    @Override
    public Notice selectNoticeContext(Integer id) {
        return mainDao.selectNoticeContext(id);
    }
}
