package com.hbgc.dao;


import com.hbgc.entity.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface PermissionDao {


    //1.查询
    @Select("select id,name,type,uri,code from permission")
    List<Permission> permissionSelectDao();

    //2.新增
    @Insert("insert into permission values(null,#{name},#{type},#{uri},#{code})")
    int permissionInsert(Permission permission);

    //3.根据id查询信息
    @Select("select id,name,type,uri,code from permission where id=#{id}")
    Permission permissionSelectID(Integer id);

    //4.id修改
    @Update("update permission set name=#{name},type=#{type},uri=#{uri},code=#{code} where id=#{id}")
    int updPermissionById(Permission permission);

    //5.id删除
    @Delete("delete from permission where id=#{id}")
    int deletePermission(Integer integer);
}
