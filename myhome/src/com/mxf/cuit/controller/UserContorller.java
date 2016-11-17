package com.mxf.cuit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.mxf.cuit.ChangeMethod;
import com.mxf.cuit.entity.House;
import com.mxf.cuit.entity.Type;
import com.mxf.cuit.entity.User;
import com.mxf.cuit.page.PagePath;
import com.mxf.cuit.service.TypeService;
import com.mxf.cuit.service.UserService;

@Controller
@RequestMapping("/user")
public class UserContorller {

	@Autowired
	private TypeService typeService; 
	@Autowired
	private UserService userService;
	
	//登录页面
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String toLogin(){
		return PagePath.USER_LOGIN;
	}
	//注册页面
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String toRegister(){
		return PagePath.USER_REGISTER;
	}
	//管理页面
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String toBeOwen(){
		return PagePath.USER_DETAIL;
	}
	//节点
	@RequestMapping(value="/node",method=RequestMethod.GET)
	public String toNode(Map<String,Object> model){
		List<Type> typeList = typeService.getList(null);
		model.put("typeList", typeList);
		return PagePath.USER_NODE;
	}
	//管理界面右边页面
	@RequestMapping(value="/right",method=RequestMethod.GET)
	public String toRight(){
		return PagePath.USER_RIGHT;
	}
	//管理界面顶部页面
	@RequestMapping(value="/top",method=RequestMethod.GET)
	public String toTop(){
		return PagePath.USER_TOP;
	}
	//用户信息页面
	@RequestMapping(value="/information",method=RequestMethod.GET)
	public String toInformation(){
		return PagePath.USER_INFORMATION;
	}
	//用户更改头像
	@RequestMapping(value="/toUpdatImg",method=RequestMethod.GET)
	public String toUpdateImg(){
		return PagePath.USER_UPDATEIMG;
	}
	
	//登录
	@RequestMapping(value="/loginUser",method=RequestMethod.POST)
	public ModelAndView login(User user,HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		user=userService.userLogin(user);
		if(user == null){
			 mav.addObject("error", "error");
			 mav.setViewName(PagePath.USER_LOGIN);
		}else{
			request.getSession().setAttribute("user", user);
			mav.setViewName("redirect:/index/welcome");
		}
		return mav;
	}
	//注册
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String userRegister(User user,HttpServletRequest request){
		user.setUserImg("/myhome/images/5.jpg");
		userService.userRegister(user);
		return PagePath.USER_LOGIN;
	}
	
	//列表
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView getUserList(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		List<User> userList =userService.getUserList(paramMap);
		mav.addObject("userList", userList);
		mav.addObject("applyOwner", paramMap.get("isApplyOwner"));
		mav.setViewName(PagePath.USER_LIST);
		return mav;
	}
	//退出登录
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String userLogout(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return PagePath.INDEX_WELCOME;
	}
	//修改用户信息
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest request){
		Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
		ModelAndView mav = new ModelAndView();
		int isSuccess = userService.updateUser(paramMap);
		if(isSuccess == 0){ //修改失败，返回以前的页面
			mav.addObject("error", "修改失败");
			mav.setViewName(PagePath.USER_INFORMATION);
		}else{ //修改成功，重新登录
			mav.setViewName(PagePath.USER_LOGIN);
		}
		return mav;
		
	} 
	//删除
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public ModelAndView getHouseById(@RequestParam("id") String id){
		ModelAndView mav=new ModelAndView();
		int isSuccess = userService.deleteUserById(id);
		if(isSuccess == 0){
			mav.addObject("error","删除失败");
		}else{
			mav.addObject("success","删除成功");
		}
		mav.setViewName("redirect:/user/list");
		return mav;
	}
	//修改头像
	@RequestMapping("/updateImg")
	 public String fileUpload(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest request) {
	        Map<String,Object> paramMap = ChangeMethod.getRequestParams(request);
	        
	        //获得原始文件名
	        String fileName = file.getOriginalFilename();
	        //新文件名
	        String newFileName = UUID.randomUUID()+fileName;
	        //上传到什么地方
	        String path = request.getSession().getServletContext().getRealPath("/")+"images/";
	        String userImg = "/myhome/images/" + newFileName;
	        paramMap.put("userImg", userImg);
	        File f = new File(path);
	        if(!f.exists())f.mkdirs(); //文件夹是空,则穿创建
	        if(!file.isEmpty()){
	            try {
	                FileOutputStream fos = new FileOutputStream(path+newFileName);
	                InputStream in = file.getInputStream();
	                int b = 0;
	                while((b=in.read())!=-1){
	                    fos.write(b);
	                }
	                fos.close();
	                in.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        userService.updateUser(paramMap);
	        //保存文件地址，用于JSP页面回显
	        request.setAttribute("fileUrl", userImg);
	        ((User)request.getSession().getAttribute("user")).setUserImg(userImg); //重新设置session中的userImg
	        return PagePath.USER_UPDATEIMG;
	    } 
	
	//用户申请成为房主
	@RequestMapping(value="/applyOwner")
	@ResponseBody
	public Map<String,Object> applyOwner(@RequestParam("id") String id,HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isApplyOwner", 1);
		map.put("id", id);
		Integer isSuccess = userService.updateUser(map);
		if(isSuccess == 0){
			map.put("msg", 0);
		}else{
			((User)request.getSession().getAttribute("user")).setIsApplyOwner("1");
			map.put("msg", 1);
		}
		return map;
	}
	//管理员同意用户申请成为房主
	@RequestMapping(value="/agreeUser")
	@ResponseBody
	public Map<String,Object> AgreeUserToOwner(@RequestParam("id") String id,HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isApplyOwner", 0);
		map.put("id", id);
		map.put("isLandlord", 1);
		Integer isSuccess = userService.updateUser(map);
		if(isSuccess == 0){
			map.put("msg", 0);
		}else{
			map.put("msg", 1);
		}
		return map;
	}
}
