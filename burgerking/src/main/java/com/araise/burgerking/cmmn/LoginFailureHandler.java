package com.araise.burgerking.cmmn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.araise.burgerking.mapper.MemberMapper;
import com.araise.burgerking.vo.MemberVO;

public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		try{
			 
			String loginId = request.getParameter("userId");
			
			MemberVO memberVO = new MemberVO();
			memberVO.setUserId(loginId);

			MemberVO resultVO = new MemberVO();
			resultVO = memberMapper.login(memberVO);
			
			String message = "";
			
			if(resultVO == null){
				message = "존재하지 않는 사용자 입니다.";
			}else{
				message = "비밀번호가 일치하지 않습니다.";
			}
			
			request.setAttribute("msg", message);
			
			request.getRequestDispatcher("/member/loginView.do").forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}
