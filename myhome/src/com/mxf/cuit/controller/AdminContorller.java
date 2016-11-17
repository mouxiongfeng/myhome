package com.mxf.cuit.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mxf.cuit.entity.Admin;
import com.mxf.cuit.entity.Type;
import com.mxf.cuit.entity.User;
import com.mxf.cuit.page.PagePath;
import com.mxf.cuit.service.AdminService;
import com.mxf.cuit.service.TypeService;

@Controller
public class AdminContorller {

	@Autowired
	private TypeService typeService;
	@Autowired
	private AdminService adminService;
	
	//管理员登录管理界面
	@RequestMapping(value="/admin/detail",method=RequestMethod.GET)
	public String toBeOwen(){
		return PagePath.ADMIN_DETAIL;
	}
	//管理员登录左侧节点
	@RequestMapping(value="/admin/node",method=RequestMethod.GET)
	public String toNode(Map<String,Object> model){
		List<Type> typeList = typeService.getList(null);
		model.put("typeList", typeList);
		return PagePath.ADMIN_NODE;
	}
	//管理右边界面
	@RequestMapping(value="/admin/right",method=RequestMethod.GET)
	public String toRight(){
		return PagePath.ADMIN_RIGHT;
	}
	//管理顶部界面
	@RequestMapping(value="/admin/top",method=RequestMethod.GET)
	public String toTop(){
		return PagePath.ADMIN_TOP;
	}
	//管理员登录界面
	@RequestMapping(value="/admin/login",method=RequestMethod.GET)
	public String toAdminLogin(){
		return PagePath.Admin_LOGIN;
	}
	//登录
	@RequestMapping(value="/admin/loginAdmin",method=RequestMethod.POST)
	public ModelAndView login(Admin admin,HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		admin = adminService.login(admin);
		if(admin == null){
			 mav.addObject("error", "error");
			 mav.setViewName(PagePath.Admin_LOGIN);
		}else{
			request.getSession().setAttribute("admin", admin);
			mav.setViewName(PagePath.ADMIN_DETAIL);
		}
		return mav;
	}
	//登出
	//退出登录
	@RequestMapping(value="/admin/logout",method=RequestMethod.GET)
	public String userLogout(HttpServletRequest request){
		request.getSession().removeAttribute("admin");
		return "redirect:/admin/login";
	}
}
