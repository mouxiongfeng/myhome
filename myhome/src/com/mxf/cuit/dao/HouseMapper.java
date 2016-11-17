package com.mxf.cuit.dao;

import java.util.List;
import java.util.Map;

import com.mxf.cuit.entity.House;

public interface HouseMapper {

	public List<House> getList(Map<String,Object> paramMap);
	
	public House getHouseById(String id);
	
	public Integer houseSeeTimeAddOne(String id);
	
	public Integer addHouse(House house);
	
	public Integer deleteHouse(String id);
	
	public Integer selectCount();
}
