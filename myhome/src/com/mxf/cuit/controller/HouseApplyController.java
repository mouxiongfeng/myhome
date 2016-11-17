package com.mxf.cuit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mxf.cuit.ChangeMethod;
import com.mxf.cuit.entity.HouseApply;
import com.mxf.cuit.page.PagePath;
import com.mxf.cuit.service.HouseApplyService;

@Controller
public class HouseApplyController {
	
	@Autowired
	private HouseApplyService houseApplyService;
	
	//添加申请
	@RequestMapping(value="/houseapply/userapply")
	@ResponseBody
	public Map<String,Object> addUserApply(HttpServletRequest request){
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		int isSuccess = houseApplyService.addUserApply(paramMap);
		paramMap.put("msg",isSuccess); //返回如果为0，申请失败，其余都是申请成功
		return paramMap;
	}
	//申请列表
	@RequestMapping(value="/houseapply/getIsApplyList")
	public ModelAndView getIsApplyList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		List<HouseApply> list = houseApplyService.getIsApplyList(paramMap);
		mav.addObject("houseApplyList", list);
		mav.setViewName(PagePath.HOUSE_APPLY_LIST);
		return mav;
		
	}
	//房主同意用户申请
	@RequestMapping(value="/houseapply/applyAgree")
	@ResponseBody
	public Map<String,Object> changeIsPass(@RequestParam("id") String id){
		Map<String,Object> map = new HashMap<String,Object>();
		int isSuccess = houseApplyService.changeIsPass(id);
		map.put("msg", isSuccess);
		return map;
	}
}
