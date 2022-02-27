package com.araise.burgerking.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araise.burgerking.mapper.MemberMapper;
import com.araise.burgerking.service.MemberService;
import com.araise.burgerking.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberMapper memberMapper;

	@Override
	public void register(MemberVO memberVO) throws Exception {
		
		memberMapper.register(memberVO);
		
	}

	@Override
	public MemberVO socialLogin(String userSocialId) throws Exception {

		return memberMapper.socialLogin(userSocialId);
	}

	@Override
	public MemberVO searchMember(String userId) throws Exception {
	
		return memberMapper.searchMember(userId);
	}

	@Override
	public void update(MemberVO memberVO) throws Exception {
		
		memberMapper.update(memberVO);
		
	}

	@Override
	public void delete(MemberVO memberVO) throws Exception {
		
		memberMapper.delete(memberVO);
		
	}

	@Override
	public MemberVO pwdChk(MemberVO memberVO) throws Exception {
		
		MemberVO result = memberMapper.pwdChk(memberVO);
		return result;
	}

	@Override
	public int idChk(MemberVO memberVO) throws Exception {
		
		int result = memberMapper.idChk(memberVO);
		
		return result;
	}

	@Override
	public int socialCheck(String social_key) throws Exception {
		
		int result = memberMapper.socialCheck(social_key);
		
		return result;
	}
	

	
}
