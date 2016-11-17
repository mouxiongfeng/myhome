package com.mxf.cuit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mxf.cuit.page.PagePath;
import com.mxf.cuit.service.HouseService;
import com.mxf.cuit.service.TypeService;
import com.mxf.cuit.entity.House;
import com.mxf.cuit.entity.Type;

@Controller
public class TypeController {
	
	@Autowired
	private TypeService typeService;
	@Autowired
	private HouseService houseService;
	
	//添加页面
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toTypeAdd(){
		return PagePath.TYPE_ADD;
	}
	//查询list
	@RequestMapping(value="/type/list")
	public ModelAndView getList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> paramMap = new HashMap<String,Object>();
		List<Type> typeList = typeService.getList(paramMap);
		mav.addObject("typeList", typeList);
		mav.setViewName(PagePath.TYPE_LIST);
		return mav;
	}
	
	//添加
	@RequestMapping(value="/type/add")
	@ResponseBody
	public Map<String,Object> addType(Type type){
		Map<String,Object> map = new HashMap<String,Object>();
		int count = typeService.getTypeCount();
		if(count < 10){
			int issuccess = typeService.addType(type);
			if(issuccess == 1){ //添加成功
				map.put("msg", 1);
			}else{ //添加失败
				map.put("msg",0);
			}
		}else{
			map.put("msg",2); //type的数量超过10
		}
		return map;
	}
	//删除
	@RequestMapping(value="/type/deleteType")
	@ResponseBody
	public Map<String,Object> deleteType(@RequestParam("id") String id){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("typeId", id);
		List<House> houseList = houseService.getList(map); //得到此类型下的房屋
		if(houseList.size() == 0){ //此类型下没有房屋
			Integer isSuccess = typeService.deleteType(map); //删除类型
			if(isSuccess == 0){ //删除失败
				map.put("msg", 0);
			}else{ //删除成功
				map.put("msg", 1);
			}
		}else{
			map.put("msg",2); //此类型下存在房屋，不能删除
		}
		return map;
	}
	//修改
	@RequestMapping(value="/type/updateType")
	@ResponseBody
	public Map<String,Object> updateType(Type type){
		Map<String,Object> map = new HashMap<String,Object>();
		Integer isSuccess = typeService.updateType(type); //删除类型
		if(isSuccess == 0){ //修改失败
			map.put("msg", 0);
		}else{ //修改成功
			map.put("msg", 1);
		}
		return map;
	}
}
