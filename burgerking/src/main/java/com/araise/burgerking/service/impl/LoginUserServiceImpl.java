package com.araise.burgerking.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.araise.burgerking.mapper.MemberMapper;
import com.araise.burgerking.vo.MemberVO;

public class LoginUserServiceImpl implements UserDetailsService {

	@Autowired
	MemberMapper memberMapper;
		
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUserId(username);
		
		try {
			memberVO = memberMapper.login(memberVO);
		} catch(Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException("No user with username '" + username + "' found!");
		}
		
		return memberVO;
	}
	
}
