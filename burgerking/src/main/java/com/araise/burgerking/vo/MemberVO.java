package com.araise.burgerking.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
//util.Date는 sql안에들어갈때 값이 안맞음 
public class MemberVO implements UserDetails {
	
	private String userId;
	private String userPwd;
	private String userName;
	private Date userBirth;
	private String userEmail;
	private String userAddress;
	private String userDetailAddress;
	private String userExtraAddress;
	private String userPhone;
	private int userType;
	private String userSocialId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getUserSocialId() {
		return userSocialId;
	}
	public void setUserSocialId(String socialId) {
		this.userSocialId = socialId;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority("ROLE_USER"));
		return authority;
	}
	@Override
	public String getPassword() {
		return userPwd;
	}
	@Override
	public String getUsername() {
		return userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	
	
}
