package com.mxf.cuit.page;

public interface PagePath {
	/** 首页  */
	public static final String INDEX_WELCOME = "/index/welcome";
	/**
	 * 
	 * --------  用户  -------------------
	 */
	/** 用户登录界面  */
	public static final String USER_LOGIN = "/user/login1";
	/** 用户列表  */
	public static final String USER_LIST = "/user/operate/userList";
	/** 注册 */
	public static final String USER_REGISTER = "/user/register";
	/** 后台  */
	public static final String USER_DETAIL = "/user/detail/info"; 
	/** 用户左边节点  */
	public static final String USER_NODE = "/user/detail/node"; 
	/** 右边页面  */
	public static final String USER_RIGHT = "/user/detail/right"; 
	/** 顶部页面  */
	public static final String USER_TOP = "/user/detail/top";
	/** 用户信息页面  */
	public static final String USER_INFORMATION = "/user/operate/information";
	/** 用户信息页面  */
	public static final String USER_UPDATEIMG = "/user/operate/updateImg";
	/**
	 * 
	 * --------  房间  -------------------
	 */
	/** 房间显示 */
	public static final String HOUSE_LIST = "/house/houseList1";
	/** 房间列表 */
	public static final String HOUSE_MANAGE_LIST = "/house/houselist/houselist";
	/** 房间详情 */
	public static final String HOUSE_DETAIL = "/house/houseDetail";
	/** 添加房间 */
	public static final String HOUSE_ADD = "/house/houseadd";
	/**
	 * 
	 * --------  房间类型  -------------------
	 */
	/** 类型列表 */
	public static final String TYPE_LIST = "/type/typeList";
	/** 添加类型 */
	public static final String TYPE_ADD = "/type/add";
	/**
	 * 
	 * --- 后台管理 ------
	 * 
	 */
	/** 后台  */
	public static final String ADMIN_DETAIL = "/admin/detail/info"; 
	/** 用户左边节点  */
	public static final String ADMIN_NODE = "/admin/detail/node"; 
	/** 右边页面  */
	public static final String ADMIN_RIGHT = "/admin/detail/right"; 
	/** 顶部页面  */
	public static final String ADMIN_TOP = "/admin/detail/top";
	/** 管理员登录 */
	public static final String Admin_LOGIN = "/admin/adminlogin";
	/**
	 * ---- 房间申请 ----
	 */
	/** 房间申请列表  */
	public static final String HOUSE_APPLY_LIST = "/houseapply/list";
	/**
	 * ------ 房间同意 -----
	 */
	public static final String HOUSE_AGREE_LIST = "/houseagree/list";
}
