package com.araise.burgerking.mapper;

import com.araise.burgerking.vo.MemberVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("memberMapper")
public interface MemberMapper {

	// 회원 가입
	public void register(MemberVO memberVO) throws Exception;
	
	// 회원 로그인
	public MemberVO login(MemberVO memberVO) throws Exception;
	
	// 소셜 로그인
	public MemberVO socialLogin(String userSocialId) throws Exception;
	
	// 회원 조회
	public MemberVO searchMember(String userId) throws Exception;
	
	// 회원 정보수정
	public void update(MemberVO memberVO) throws Exception;
	
	// 회원 탈퇴
	public void delete(MemberVO memberVO) throws Exception;
	
	// 패스워드 체크
	public int pwdChk(MemberVO memberVO) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO memberVO) throws Exception;
	
	// 소셜 회원 가입체크
	public int socialCheck(String social_key) throws Exception;
}

