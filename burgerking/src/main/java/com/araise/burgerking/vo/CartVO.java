package com.araise.burgerking.vo;

import java.sql.Date;

public class CartVO {

	private int cartNum;	//	카트번호
	private String userId;	// 회원ID
	private String pCode;	// 상품코드
	private Date addDate;	// 추가일
	private String drink1;	// 음료1
	private String drink2;	// 음료2
	private String side1;	// 사이드메뉴1
	private String side2;	// 사이드메뉴2
	private String pOption;	// 상품옵션
	private String pName;	// 상품명
	private int price;		// 상품가격
	private String pUrl;	// 상품이미지URL
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
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
	public String getpOption() {
		return pOption;
	}
	public void setpOption(String pOption) {
		this.pOption = pOption;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	
	
	
	
}
