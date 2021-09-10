package com.hbgc.service;

import com.hbgc.entity.Role;
import com.hbgc.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Set;


public interface IUserService extends UserDetailsService {

    List<User> selectUser();

    int insertUser(User user);

    int deleteUser(Integer id);

    boolean deleteUserIDs(Integer[] ids);

    User selectUserID(Integer id);

    int updateUserInfo(User user);

    List<User> selectUserMobile(String mobile);

    User selectUserLogin(String name);

    int insertUserRegister(User user);

    Set<String> getUserPermissionCodeByUserID(Integer id);

    int insertUserRole(Integer userID,Integer roleID);

    Role selectRole(Integer userID);
}
