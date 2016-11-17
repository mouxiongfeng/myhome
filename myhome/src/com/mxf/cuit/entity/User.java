package com.mxf.cuit.entity;

public class User {

	private int id;
	private String userLoginName;
	private String userName;
	private String userPassword;
	private String phone;
	private String userImg;
	private String isLandlord;
	private String isApplyOwner;
	
	public String getIsLandlord() {
		return isLandlord;
	}
	public void setIsLandlord(String isLandlord) {
		this.isLandlord = isLandlord;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserLoginName() {
		return userLoginName;
	}
	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getIsApplyOwner() {
		return isApplyOwner;
	}
	public void setIsApplyOwner(String isApplyOwner) {
		this.isApplyOwner = isApplyOwner;
	}
	
}
