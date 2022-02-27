package com.araise.burgerking.cmmn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.araise.burgerking.vo.MemberVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		MemberVO memberVO = (MemberVO)authentication.getPrincipal();

		memberVO.setUserPwd(null);
		
		request.getSession(true).setAttribute("member", memberVO);
			
		response.sendRedirect(request.getContextPath() + "/main.do");
	}

}
