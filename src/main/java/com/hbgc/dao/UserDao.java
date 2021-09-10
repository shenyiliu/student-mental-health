package com.hbgc.dao;


import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import com.hbgc.entity.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface UserDao {

    //1.查询用户信息
    @Select("select id,state,name,mobile,password,address from `user`")
    List<User> selectUser();

    //2.添加用户信息
    @Insert("insert into user values(null,#{state},#{name},#{mobile},#{password},#{address})")
    int insertUser(User user);

    //3.删除单个信息
    @Delete("delete from user where id=#{id}")
    int deleteUser(Integer id);

    //4.根據id查詢用戶信息
    @Select("select id,name,mobile,password,address,state from user where id=#{id}")
    User selectUserID(Integer id);


    //5.根據id修改用戶信息
    @Update("update user set state=#{state},name=#{name},mobile=#{mobile},password=#{password},address=#{address} where id=#{id}")
    int updateUserInfo(User user);

    //6.根据电话号码查询信息
    @Select("select id,state,name,mobile,password,address from user where mobile = #{mobile}")
    List<User> selectUserMobile(String mobile);

    //7.登录
    @Select("select id,name,state,mobile,password from user where mobile=#{mobile} and password=#{password}")
    User selectUserLogin(User user);

    //8.注册
    @Insert("insert into user values(null,0,#{name},#{mobile},#{password},#{address})")
    int insertUserRegister(User user);

    //9.获取权限信息
    @Select("select code from permission where id in (select permissionID from role_permission where roleID in(select roleID from user_role where userID=#{id}))")
    Set<String> getUserPermissionCodeByUserID(Integer id);

    //10.根据用户名查询信息
    @Select("select id,name,state,mobile,password,address from user where name=#{name}")
    User selectUserLoginMobile(String name);

    //11.根据id添加用户角色表信息
    @Insert("insert into user_role values(null,#{userID},#{roleID})")
    int insertUserRole(@Param("userID")Integer userID, @Param("roleID")Integer roleID);

    //12.查询用户拥有的角色
    @Select("select * from role where id in (select roleID from user_role where userID =#{userID})")
    Role selectRole(Integer userID);

}
