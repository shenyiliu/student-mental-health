package com.hbgc.service.impl;

import com.hbgc.dao.UserDao;
import com.hbgc.entity.Permission;
import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import com.hbgc.entity.UserInfo;
import com.hbgc.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service("userService")
public class UserService implements IUserService {

    @Autowired
    private UserDao userDao;

    //1.查询用户信息
    @Override
    public List<User> selectUser() {

        return userDao.selectUser();

    }

    //2.添加用户信息
    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    //3.删除单个信息
    @Override
    public int deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }

    //4.批量刪除信息
    @Override
    public boolean deleteUserIDs(Integer[] ids) {
        for (int i = 0; i < ids.length ; i++) {
            userDao.deleteUser(ids[i]);
        }
        return false;
    }

    //5.根據id查詢信息
    @Override
    public User selectUserID(Integer id) {
        return userDao.selectUserID(id);
    }

    //6.根据id修改信息
    @Override
    public int updateUserInfo(User user) {
        return userDao.updateUserInfo(user);
    }

    //7.根据电话号码查询信息
    @Override
    public List<User> selectUserMobile(String mobile) {
        return userDao.selectUserMobile(mobile);
    }

    //8.登录
    @Override
    public User selectUserLogin(String name) {
        return userDao.selectUserLoginMobile(name);
    }

    //9.注册
    @Override
    public int insertUserRegister(User user) {
        return userDao.insertUserRegister(user);
    }


    //10.获取用户权限信息
    @Override
    public Set<String> getUserPermissionCodeByUserID(Integer id) {
        return userDao.getUserPermissionCodeByUserID(id);
    }

    //11.根据id添加用户角色表信息
    @Override
    public int insertUserRole(Integer userID, Integer roleID) {
        return userDao.insertUserRole(userID,roleID);
    }

    @Override
    public Role selectRole(Integer userID) {
        return userDao.selectRole(userID);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User userInfo=userDao.selectUserLoginMobile(username);
        Set<String> set=userDao.getUserPermissionCodeByUserID(userInfo.getId());
        userInfo.setPersissionSet(set);
        org.springframework.security.core.userdetails.User user=new org.springframework.security.core.userdetails.User(userInfo.getName(),"{noop}"+userInfo.getPassword(),userInfo.getState()==0?true:false,true, true, true,getAuthority(userInfo));
        return user;
    }

    //返回一个list集合，装载角色描述
    public List<SimpleGrantedAuthority> getAuthority(User userInfo){
        List<SimpleGrantedAuthority> list=new ArrayList<>();

        for (String permission: userInfo.getPersissionSet()){
            list.add(new SimpleGrantedAuthority("ROLE_"+permission));
        }
        System.out.println(list);
        return list;
    }
}

