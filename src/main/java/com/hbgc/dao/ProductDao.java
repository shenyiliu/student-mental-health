package com.hbgc.dao;

import com.hbgc.entity.Permission;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ProductDao {

    //1.动态添加角色下拉框
    @Select("select id,name,intro from role")
    List<Role> selectRoleList();

    //2.角色-权限表搜索
    @Select("select id,name,type,uri,code from permission where id in(select permissionID from role_permission where roleID=#{roleID})")
    List<Permission> selectRolePermission(Integer roleID);

    //3.用户-角色表搜索
    @Select("select b.id,b.state,b.name,b.mobile,b.password,b.address from user_role a,user b where a.userID=b.id and a.roleID=#{roleID}")
    List<User> selectUserRole(Integer roleID);

    //4.解除角色授权
    @Delete("delete from role_permission where roleID=#{roleID} and permissionID=#{permissionID}")
    int deleteRolePermission(@Param("roleID") Integer roleID,@Param("permissionID") Integer permissionID);

    //5.解除账号授权
    @Delete("delete from user_role where  userID=#{userID} and roleID=#{roleID}")
    int deleteUserRole(@Param("userID")Integer userID,@Param("roleID")Integer roleID);

    //6.根据id添加用户角色表信息
    @Insert("insert into user_role values(null,#{userID},#{roleID})")
    int insertUserRole(@Param("userID")Integer userID,@Param("roleID")Integer roleID);

    //7.根据角色id查询角色权限表并显示在角色中
    @Results({
            @Result(column = "id",property = "id"),
            @Result(column = "id",property = "permissionList",javaType = java.util.List.class,many = @Many(select = "com.hbgc.dao.ProductDao.selectRolePermission")),
    })
    @Select("select id,name,intro from role where id=#{id}")
    Role getRoleInfoDetailById(Integer id);

}
