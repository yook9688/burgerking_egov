package com.araise.burgerking.service;

import com.araise.burgerking.vo.MemberVO;

public interface MemberService {

	//회원 가입
	public void register(MemberVO memberVO) throws Exception;
		
	//소셜 회원 로그인
	public MemberVO socialLogin(String userSocialId) throws Exception;
	
	//회원 조회
	public MemberVO searchMember(String userId) throws Exception;
	
	//회원 정보수정
	public void update(MemberVO memberVO) throws Exception;
	
	//회원 탈퇴
	public void delete(MemberVO memberVO) throws Exception;
	
	//비밀번호 체크
	public MemberVO pwdChk(MemberVO memberVO) throws Exception;
	
	//아이디 중복 체크
	public int idChk(MemberVO memberVO) throws Exception;
	
	// 소셜회원 가입 체크
	public int socialCheck(String social_key) throws Exception; 
}
