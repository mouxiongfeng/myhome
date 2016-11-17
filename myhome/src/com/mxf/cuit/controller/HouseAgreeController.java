package com.mxf.cuit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mxf.cuit.ChangeMethod;
import com.mxf.cuit.entity.HouseAgree;
import com.mxf.cuit.page.PagePath;
import com.mxf.cuit.service.HouseAgreeService;

@Controller
public class HouseAgreeController {
	
	@Autowired
	private HouseAgreeService houseAgreeService;
	
	@RequestMapping(value="/houseagree/getAgreeList")
	public ModelAndView getAgreeList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		List<HouseAgree> list = houseAgreeService.getAgreeList(paramMap);
		mav.addObject("houseAgreeList", list);
		mav.setViewName(PagePath.HOUSE_AGREE_LIST);
		return mav;
	}
	
	@RequestMapping(value="/houseagree/addHouseAgree")
	@ResponseBody
	public Map<String,Object> addHouseAgree(HttpServletRequest request){
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		int isSuccess = houseAgreeService.addHouseAgree(paramMap);
		paramMap.put("msg",isSuccess); //返回如果为0，申请失败，其余都是申请成功
		return paramMap;
	}
}
