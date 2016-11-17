package com.mxf.cuit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxf.cuit.dao.HouseAgreeMapper;
import com.mxf.cuit.dao.HouseApplyMapper;
import com.mxf.cuit.entity.HouseApply;

@Service
public class HouseApplyService {

	@Autowired
	private HouseApplyMapper houseApplyMapper;
	@Autowired
	private HouseAgreeMapper houseAgreeMapper;
	
	public Integer addUserApply(Map<String,Object> paramMap){
		return houseApplyMapper.addUserApply(paramMap);
	}
	
	public List<HouseApply> getIsApplyList(Map<String,Object> paramMap){
		return houseApplyMapper.getIsApplyList(paramMap);
	}
	public Integer changeIsPass(String id){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("houseApplyId", id);
		int count = houseAgreeMapper.addHouseAgree(map);
		count = count + houseApplyMapper.changeIsPass(id);
		return count;
	}
}
