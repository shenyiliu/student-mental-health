package com.hbgc.service;

import com.hbgc.entity.Notice;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IMainService {
    //1.查询用户数量
    int selectUserIndex();

    //2.查询角色数量
    int selectRoleIndex();

    //3.查询权限数量
    int selectPermissionIndex();

    //4.查询语料库数量
    int selectYwIndex();

    List<Notice> selectNoticeAll();

    Notice selectNoticeContext(Integer id);
}
