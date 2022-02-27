package com.araise.burgerking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.araise.burgerking.service.MemberService;
import com.araise.burgerking.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
       	
	@RequestMapping(value = "/registerView.do")
	public String registerView(HttpServletRequest request, Model model) throws Exception {
		logger.info("registerView");
		
		String email = request.getParameter("email");
		String socialId = request.getParameter("socialId");
		
		
		if(email != null) {
			model.addAttribute("socialEmail", email);
			model.addAttribute("socialId", socialId);
		}
		
		return "member/registerView";
		
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(MemberVO memberVO, HttpSession session) throws Exception {
		logger.info("post register");
		
		String userPwd = memberVO.getUserPwd();
		String userSocialId = memberVO.getUserSocialId();
		
		String cryptoPwd = passwordEncoder.encode(userPwd);
		
		memberVO.setUserPwd(cryptoPwd);
		
		if(userSocialId != null) {
			String crytoSocialId = passwordEncoder.encode(userSocialId);
			memberVO.setUserSocialId(crytoSocialId);
		}
		
		memberService.register(memberVO);

		session.setAttribute("member", memberVO);
		
		return "redirect:/main.do";
		
	}
	
	@RequestMapping(value = "/loginView.do")
	public String loginView() throws Exception {
		logger.info("loginView");
		
		return "member/loginView";
	}
	
	@RequestMapping(value = "/updateView.do", method = RequestMethod.GET)
	public String updateView(MemberVO memberVO,HttpServletRequest request, Model model) throws Exception {
		logger.info("updateView");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		MemberVO memberInfo = memberService.searchMember(member.getUserId());
		model.addAttribute("memberInfo",memberInfo);
		
		return "member/updateView";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(MemberVO memberVO) throws Exception {
		logger.info("member update");
		
		memberVO.setUserPwd(passwordEncoder.encode(memberVO.getUserPwd()));
		
		memberService.update(memberVO);
		
		return "redirect:/member/updateView.do";
	}
	
	@RequestMapping(value ="/deleteView.do", method = RequestMethod.GET)
	public String deleteView() throws Exception {
		
		return "member/deleteView";
	}
	
	@RequestMapping(value ="/delete.do", method = RequestMethod.POST)
	public String delete(MemberVO memberVO, HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception {
		//세션에 있는 member를 가져와 member 변수에 저장
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 회원정보 검색을 위한 회원 아이디
		String userId = member.getUserId();
		
		member = memberService.searchMember(userId);
		
		String userPwd = request.getParameter("userPwd");
	
		
		if(passwordEncoder.matches(userPwd, member.getUserPwd())) {
			memberService.delete(memberVO);
			session.invalidate();
			return "redirect:/main.do";
		}
		
		rttr.addFlashAttribute("msg", false);
		return "redirect:/member/deleteView.do";
		
	}
		
	@RequestMapping(value="/pwdCheck.json", method = RequestMethod.POST)
	public ModelAndView pwdChk(MemberVO memberVO) throws Exception {
		logger.info("pwdCheck");
		
		ModelAndView model = new ModelAndView("jsonView");
		
		String userPwd = memberVO.getUserPwd();
				
		MemberVO member = memberService.pwdChk(memberVO);
		
		String result = "N";
		
		if(passwordEncoder.matches(userPwd, member.getUserPwd())) {
			result = "Y";
		}
		
		model.addObject("result", result);
		
		return model;
	}
	
	@RequestMapping(value="/idCheck.json", method = RequestMethod.POST)
	public ModelAndView idChk(MemberVO memberVO) throws Exception {
		logger.info("idCkech");
		
		ModelAndView model = new ModelAndView("jsonView");
		
		int result = memberService.idChk(memberVO);
		
		model.addObject("result", result);
		
		return model;
		
	}
	
	@RequestMapping(value = "/kakaoLogin.json")
	public ModelAndView kakaoLoginView(HttpServletRequest request, MemberVO memberVO) throws Exception {
		logger.info("kakao login");
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		
		String social_key = request.getParameter("id");
		social_key = passwordEncoder.encode(social_key);
		
		int socialCheck = memberService.socialCheck(social_key);
		
		mav.addObject("result", socialCheck);
		
		if(socialCheck > 0) {
			MemberVO socialLogin = memberService.socialLogin(social_key);
			if(socialLogin != null) {
				session.setAttribute("member", socialLogin);
				mav.addObject("code", "200");
			} else {
				mav.addObject("code", "501");
			}
		}
		
		return mav;
	}
			
	
}
