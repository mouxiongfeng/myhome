package com.mxf.cuit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxf.cuit.dao.HouseAgreeMapper;
import com.mxf.cuit.entity.HouseAgree;

@Service
public class HouseAgreeService {

	@Autowired
	private HouseAgreeMapper houseAgreeMapper;
	
	//添加
	public Integer addHouseAgree(Map<String,Object> paramMap){
		return houseAgreeMapper.addHouseAgree(paramMap);
	}
	//得到列表
	public List<HouseAgree> getAgreeList(Map<String,Object> paramMap){
		return houseAgreeMapper.getAgreeList(paramMap);
	}
}
