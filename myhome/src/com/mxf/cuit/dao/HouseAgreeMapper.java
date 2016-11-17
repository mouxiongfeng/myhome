package com.mxf.cuit.dao;

import java.util.List;
import java.util.Map;

import com.mxf.cuit.entity.HouseAgree;

public interface HouseAgreeMapper {

	public Integer addHouseAgree(Map<String,Object> paramMap);
	
	public List<HouseAgree> getAgreeList(Map<String,Object> paramMap);
}
