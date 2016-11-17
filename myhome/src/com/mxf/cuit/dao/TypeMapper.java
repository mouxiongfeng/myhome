package com.mxf.cuit.dao;

import java.util.List;
import java.util.Map;

import com.mxf.cuit.entity.Type;

public interface TypeMapper {
	
	public List<Type> getList(Map<String,Object> paramMap); //得到typeList
	
	public Integer addType(Type type); //添加type
	
	public Integer deleteType(Map<String,Object> paramMap); //删除type
	
	public Integer getTypeCount(); //得到type的个数
	
	public Integer updateType(Type type);//修改type
} 
