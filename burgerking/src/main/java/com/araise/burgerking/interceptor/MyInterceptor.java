package com.araise.burgerking.interceptor;

import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.araise.burgerking.vo.MemberVO;

public class MyInterceptor extends HandlerInterceptorAdapter {

	private Set<String> permittedURL;
	
	public void setPermittedURL(Set<String> permittedURL) {
		this.permittedURL = permittedURL;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = false;
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		MemberVO member = (MemberVO) request.getSession().getAttribute("member");
		
		Iterator<String> it = permittedURL.iterator();
		while(it.hasNext()) {
			String permittedUrl = contextPath+it.next();
			if(permittedUrl.equals(requestURI)) {
				result = true;
				break;
			}
		}
		
		
		if(member != null) {
			result = true;
		}
		
		if(result != true) {
			request.setAttribute("message", "로그인이 필요합니다.");
			request.getRequestDispatcher("/member/loginView.do").forward(request, response);
		}
		
		return result;
	}
}
