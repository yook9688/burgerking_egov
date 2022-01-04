package com.araise.burgerking.vo;

import java.sql.Date;

public class OrderVO {
	// 주문
	private String orderId;
	private String userId;
	private String userPhone;
	private String userAddress;
	private String userDetailAddress;
	private String userExtraAddress;
	private String requests;
	private Date orderDate;
	
	// 주문 상세
	private int orderDetailsNum;
	private String pCode;
	private String pName;
	private String drink1;
	private String drink2;
	private String side1;
	private String side2;
	private String price;
	
	// 상품정보(주문목록조회용)
	
	private String pUrl;
	
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserDetailAddress() {
		return userDetailAddress;
	}
	public void setUserDetailAddress(String userDetailAddress) {
		this.userDetailAddress = userDetailAddress;
	}
	public String getUserExtraAddress() {
		return userExtraAddress;
	}
	public void setUserExtraAddress(String userExtraAddress) {
		this.userExtraAddress = userExtraAddress;
	}
	public String getRequests() {
		return requests;
	}
	public void setRequests(String requests) {
		this.requests = requests;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDrink1() {
		return drink1;
	}
	public void setDrink1(String drink1) {
		this.drink1 = drink1;
	}
	public String getDrink2() {
		return drink2;
	}
	public void setDrink2(String drink2) {
		this.drink2 = drink2;
	}
	public String getSide1() {
		return side1;
	}
	public void setSide1(String side1) {
		this.side1 = side1;
	}
	public String getSide2() {
		return side2;
	}
	public void setSide2(String side2) {
		this.side2 = side2;
	}
	
}
