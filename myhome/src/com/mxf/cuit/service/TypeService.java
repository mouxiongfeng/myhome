package com.mxf.cuit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mxf.cuit.dao.TypeMapper;
import com.mxf.cuit.entity.Type;

@Service
public class TypeService {

	@Autowired
	private TypeMapper typeMapper;

	//list
	public List<Type> getList(Map<String,Object> paramMap){
		return typeMapper.getList(paramMap);
	}
	//添加
	public Integer addType(Type type){
		return typeMapper.addType(type);
	}
	
	//删除
	public Integer deleteType(Map<String,Object> paramMap){
		return typeMapper.deleteType(paramMap);
	}
	//修改
	public Integer updateType(Type type){
		return typeMapper.updateType(type);
	}
	//得到type的个数
	public Integer getTypeCount(){
		return typeMapper.getTypeCount();
	}
	
}
