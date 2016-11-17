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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mxf.cuit.ChangeMethod;
import com.mxf.cuit.entity.House;
import com.mxf.cuit.entity.User;
import com.mxf.cuit.page.PageCountToToatal;
import com.mxf.cuit.page.PagePath;
import com.mxf.cuit.service.HouseImgService;
import com.mxf.cuit.service.HouseService;
import com.mxf.cuit.service.TypeService;
import com.mxf.cuit.entity.Type;

@Controller
public class HouseController {
	@Autowired
	private HouseService houseService;
	@Autowired
	private HouseImgService houseImgService;
	@Autowired
	private TypeService typeService; 
	
	@RequestMapping(value="/house/add")
	public ModelAndView toHouseAdd(){
		ModelAndView mav = new ModelAndView();
		Map<String,Object> model = new HashMap<String,Object>();
		List<Type> typeList = typeService.getList(model);
		mav.addObject("typeList", typeList);
		mav.setViewName(PagePath.HOUSE_ADD);
		return mav;
	}
	
	//首页跳转，查询房屋信息
	@SuppressWarnings("unused")
	@RequestMapping(value="/house/getHouseList")
	private ModelAndView getHouseList(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		List<House> houseList = houseService.getList(paramMap);
		List<Type> typeList = typeService.getList(null);
		int pageCount = houseService.selectCount();
		int totalPage=PageCountToToatal.getTotalPage(pageCount, 16);
		mav.addObject("totalPage", totalPage);
		mav.addObject("PageCount", pageCount);
		mav.addObject("currentPage", paramMap.get("currentPage") == null?1:paramMap.get("currentPage"));
		mav.addObject("houseList", houseList);
		mav.addObject("typeList",typeList);
		mav.setViewName(PagePath.HOUSE_LIST);
		return mav;
	}
	//后台管理house表
	@SuppressWarnings("unused")
	@RequestMapping(value="/house/manageHouseList")
	private ModelAndView manageHouseList(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		List<House> houseList = houseService.getList(paramMap);
		mav.addObject("houseList", houseList);
		mav.setViewName(PagePath.HOUSE_MANAGE_LIST);
		return mav;
	}
	//根据id获取房屋信息
	@RequestMapping(value="/house/getHouseById",method=RequestMethod.GET)
	public ModelAndView getHouseById(@RequestParam("id") String id){
		ModelAndView mav=new ModelAndView();
		House house = houseService.getHouseById(id); //得到房屋信息
		houseService.houseSeeTimeAddOne(id); //点击房屋信息时，次数增加
		mav.addObject("house",house);
		mav.setViewName(PagePath.HOUSE_DETAIL);
		return mav;
	}
	//根据id删除房屋
		@RequestMapping(value="/house/deleteHouse")
		@ResponseBody
		public Map<String,Object> deleteHouse(@RequestParam("id") String id){
			Map<String,Object> map = new HashMap<String,Object>();
			Integer isSuccess = houseService.deleteHouse(id); //得到房屋信息
			if(isSuccess == 0){
				map.put("msg", 0);
			}else{
				map.put("msg", 1);
			}
			return map;
		}
		
		@RequestMapping(value="/house/addHouse")
		public ModelAndView addHouse(House house,MultipartHttpServletRequest request,HttpServletRequest req){
			ModelAndView mav = new ModelAndView();
			String province = (String)req.getParameter("province");
			String city = (String)req.getParameter("city");
			String county = (String)req.getParameter("county");
			String houseAddress = province + '-' + city + '-' + county;
			house.setHouseAddress(houseAddress);
			User houseOwner = (User) req.getSession().getAttribute("user");
			house.setHouseOwner(houseOwner.getId()+"");
			int issuccess = houseService.addHouse(house);
			int imgUploadSuccess = houseImgService.adddHouseImg(request,house.getId());
			if(issuccess != 0 || imgUploadSuccess !=0){ //添加失败，重新跳转到添加页面
				mav.addObject("success", "添加成功");
				mav.setViewName("redirect:/house/manageHouseList?owner="+house.getHouseOwner()); //返回房主house查看页面
			}else{ //添加成功，跳转到list页面
				mav.addObject("error", "添加失败");
				mav.setViewName(PagePath.TYPE_ADD);
			}
			return mav;
		}
	
}
