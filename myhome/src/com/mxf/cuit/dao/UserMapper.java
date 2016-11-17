package com.mxf.cuit.dao;

import java.util.List;
import java.util.Map;

import com.mxf.cuit.entity.User;

public interface UserMapper {
	//登录
	User userLogin(Map<String,Object> paramMap);
	//注册
	Integer userRegister(User user);
	//用户列表
	List<User> getUserList(Map<String,Object> paramMap);
	//删除用户
	Integer deleteUserById(String id);
	//修改用户信息
	Integer updateUser(Map<String,Object> paramMap);
}
