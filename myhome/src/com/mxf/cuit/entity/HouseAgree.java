package com.mxf.cuit.entity;

public class HouseAgree {

	private int id;
	private int houseApplyId;
	private String agreeDate;
	private String isAgree;
	private String isDelete;
	private String isSee;
	private String userName;
	private String phone;
	private House house;
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHouseApplyId() {
		return houseApplyId;
	}
	public void setHouseApplyId(int houseApplyId) {
		this.houseApplyId = houseApplyId;
	}
	public String getAgreeDate() {
		return agreeDate;
	}
	public void setAgreeDate(String agreeDate) {
		this.agreeDate = agreeDate;
	}
	public String getIsAgree() {
		return isAgree;
	}
	public void setIsAgree(String isAgree) {
		this.isAgree = isAgree;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getIsSee() {
		return isSee;
	}
	public void setIsSee(String isSee) {
		this.isSee = isSee;
	}
	
}
