package com.hbgc.dao;

import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RoleDao {
    //1.查询角色
    @Select("select id,name,intro from role")
    List<Role> selectRoleDao();

    //2.添加角色
    @Insert("insert into role values(null,#{name},#{intro})")
    int insertRoleDao(Role role);

    //3.根据id查询角色
    @Select("select id,name,intro from role where id=#{id}")
    Role selectRoleDaoID(Integer id);

    //4.根据id修改角色
    @Update("update role set name=#{name},intro=#{intro} where id=#{id}")
    int updateRoleDao(Role role);

    //5.根据id删除角色信息
    @Delete("delete from role where id=#{id}")
    int deleteRoleDao(Integer id);
}
