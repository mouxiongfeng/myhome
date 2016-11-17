package com.mxf.cuit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxf.cuit.dao.AdminMapper;
import com.mxf.cuit.entity.Admin;


@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	public Admin login(Admin admin){
		return adminMapper.login(admin);
	}
}
