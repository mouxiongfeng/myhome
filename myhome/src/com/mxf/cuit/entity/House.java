package com.mxf.cuit.entity;

import java.util.List;

public class House {

	private int id;
	private String typeId;
	private String typeName;
	private String houseAddress;
	private String addressName;
	private String houseOwner;
	private String houseOwnerName;
	private String houseIntroduce;
	private String ischeck;
	private String description;
	private Integer housePrice;
	private String seeTime;
	private List<HouseImg> houseImgList;
	
	public List<HouseImg> getHouseImgList() {
		return houseImgList;
	}
	public void setHouseImgList(List<HouseImg> houseImgList) {
		this.houseImgList = houseImgList;
	}
	
	public String getHouseOwnerName() {
		return houseOwnerName;
	}
	public void setHouseOwnerName(String houseOwnerName) {
		this.houseOwnerName = houseOwnerName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getHouseAddress() {
		return houseAddress;
	}
	public void setHouseAddress(String houseAddress) {
		this.houseAddress = houseAddress;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getHouseOwner() {
		return houseOwner;
	}
	public void setHouseOwner(String houseOwner) {
		this.houseOwner = houseOwner;
	}
	public String getHouseIntroduce() {
		return houseIntroduce;
	}
	public void setHouseIntroduce(String houseIntroduce) {
		this.houseIntroduce = houseIntroduce;
	}
	public String getIscheck() {
		return ischeck;
	}
	public void setIscheck(String ischeck) {
		this.ischeck = ischeck;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getHousePrice() {
		return housePrice;
	}
	public void setHousePrice(Integer housePrice) {
		this.housePrice = housePrice;
	}
	public String getSeeTime() {
		return seeTime;
	}
	public void setSeeTime(String seeTime) {
		this.seeTime = seeTime;
	}
	
	
}