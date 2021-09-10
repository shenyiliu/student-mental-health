package com.hbgc.dao;


import com.hbgc.entity.Notice;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MainDao {

    //查询  用户  角色   权限  语料库数量

    //1.查询用户数量
    @Select("select count(1) from user")
    int selectUserIndex();

    //2.查询角色数量
    @Select("select count(1) from role")
    int selectRoleIndex();

    //3.查询权限数量
    @Select("select count(1) from permission")
    int selectPermissionIndex();

    //4.查询语料库数量
    @Select("select count(1) from yw_xljk")
    int selectYwIndex();

    //5.搜索公告栏
    @Select("select id,title,name,noticeTime,context from notice")
    List<Notice> selectNoticeAll();

    //6.根据id查询公告内容
    @Select("select id,title,name,noticeTime,context from notice where id=#{id}")
    Notice selectNoticeContext(Integer id);
}
