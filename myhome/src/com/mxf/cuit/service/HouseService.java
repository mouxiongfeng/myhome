package com.mxf.cuit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxf.cuit.dao.HouseMapper;
import com.mxf.cuit.entity.House;

@Service
public class HouseService {

	@Autowired
	private HouseMapper houseMapper;
	
	public List<House> getList(Map<String,Object> paramMap){
		if(paramMap.get("province") != null && paramMap.get("city") != null && paramMap.get("county") != null){
			String province = (String)paramMap.get("province");
			String city = (String)paramMap.get("city");
			String county = (String)paramMap.get("county");
			String houseAddress = province + '-' + city + '-' + county;
			if(!"省-市-区、县".equals(houseAddress)){
				paramMap.put("houseAddress", houseAddress);
			}
			
		}
		if(paramMap.get("currentPage") != null){
			Integer currentPage = Integer.parseInt((String)paramMap.get("currentPage")) - 1;
			paramMap.put("pageBegin", currentPage * 16);
		}else{
			paramMap.put("pageBegin", 0);
		}
		return houseMapper.getList(paramMap);
	}
	
	public House getHouseById(String id){
		return houseMapper.getHouseById(id);
	}
	
	public Integer houseSeeTimeAddOne(String id){
		return houseMapper.houseSeeTimeAddOne(id);
	}
	
	public Integer addHouse(House house){
		return houseMapper.addHouse(house);
	}
	
	public Integer deleteHouse(String id){
		return houseMapper.deleteHouse(id);
	}
	
	public Integer selectCount(){
		return houseMapper.selectCount();
	}
	
 }