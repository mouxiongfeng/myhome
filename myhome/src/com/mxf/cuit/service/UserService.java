package com.mxf.cuit.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxf.cuit.dao.UserMapper;
import com.mxf.cuit.entity.User;


@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	//登录
	public User userLogin(User user){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userLoginName", user.getUserLoginName());
		paramMap.put("userPassword",user.getUserPassword());
		return userMapper.userLogin(paramMap);
	}
	//注册
	public Integer userRegister(User user){
		return userMapper.userRegister(user);
	}
	//用户列表
	public List<User> getUserList(Map<String,Object> paramMap){
		return userMapper.getUserList(paramMap);
	}
	//删除用户
	public Integer deleteUserById(String id){
		return userMapper.deleteUserById(id);
	}
	//修改用户信息
	public Integer updateUser(Map<String,Object> paramMap){
		return userMapper.updateUser(paramMap);
	}
}
