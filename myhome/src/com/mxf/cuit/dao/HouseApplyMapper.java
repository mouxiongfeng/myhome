package com.mxf.cuit.dao;

import java.util.Map;
import java.util.List;

import com.mxf.cuit.entity.HouseApply;

public interface HouseApplyMapper {

	public Integer addUserApply(Map<String,Object> paramMap);
	
	public List<HouseApply> getIsApplyList(Map<String,Object> paramMap);
	
	public Integer changeIsPass(String id);
}
