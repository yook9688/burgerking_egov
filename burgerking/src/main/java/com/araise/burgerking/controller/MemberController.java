package com.araise.burgerking.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.araise.burgerking.service.MemberService;
import com.araise.burgerking.vo.MemberVO;

import egovframework.rte.fdl.cryptography.EgovEnvCryptoService;
import egovframework.rte.fdl.cryptography.EgovPasswordEncoder;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
   /** 암호화서비스 */
    @Resource(name = "egovEnvCryptoService")
    EgovEnvCryptoService cryptoService;
    
    @Resource(name = "egovEnvPasswordEncoderService")
    EgovPasswordEncoder egovPasswordEncoder;
    /** 암호화서비스 */
	
	@RequestMapping(value = "/registerView.do")
	public String registerView(@RequestParam("email") String email, @RequestParam("socialId") String socialId, Model model) throws Exception {
		logger.info("registerView");
		
		if(email != null) {
			model.addAttribute("socialEmail", email);
			model.addAttribute("socialId", socialId);
		}
		
		return "/member/registerView";
		
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(MemberVO memberVO, HttpSession session) throws Exception {
		logger.info("post register");
		
		String userPwd = memberVO.getUserPwd();
		String userSocialId = memberVO.getUserSocialId();
		
		String cryptoPwd = cryptoService.encrypt(userPwd);
		String crytoSocialId = cryptoService.encrypt(userSocialId);
		
		memberVO.setUserPwd(cryptoPwd);
		memberVO.setUserSocialId(crytoSocialId);
		
		memberService.register(memberVO);

		session.setAttribute("member", memberVO);
		
		return "redirect:/main.do";
		
	}
	
	@RequestMapping(value = "/loginView.do")
	public String loginView() throws Exception {
		logger.info("loginView");
		return "member/loginView";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("login");
		
		HttpSession session = request.getSession();
		
		//비밀번호 암호화
		String userPwd = memberVO.getUserPwd();
		String cryptoPwd = cryptoService.encrypt(userPwd);

		memberVO.setUserPwd(cryptoPwd);
		
		MemberVO login = memberService.login(memberVO);
		
		String path = "/main.do";
				
		if(login != null) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addAttribute("msg", "error");
			path = "/member/loginView.do";
			
		}
		
		return "redirect:"+path;
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("logout");
		session.invalidate();
		
		return "redirect:/";
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
		
		memberVO.setUserPwd(cryptoService.encrypt(memberVO.getUserPwd()));
		
		memberService.update(memberVO);
		
		return "redirect:/member/updateView.do";
	}
	
	@RequestMapping(value ="/deleteView.do", method = RequestMethod.GET)
	public String deleteView() throws Exception {
		
		return "member/deleteView";
	}
	
	@RequestMapping(value ="/delete.do", method = RequestMethod.POST)
	public String delete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		//세션에 있는 member를 가져와 member 변수에 저장
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 회원정보 검색을 위한 회원 아이디
		String userId = member.getUserId();
		
		//회원정보 DB검색
		MemberVO memberInfo = memberService.searchMember(userId);
		
		//DB에 저장되어있는 비밀번호
		String memberPwd = memberInfo.getUserPwd();
		
		// memberVO로 들어오는 비밀번호	
		String voPwd = memberVO.getUserPwd();
		
		if(!(memberPwd.equals(voPwd))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/deleteView";
		}
		memberService.delete(memberVO);
		session.invalidate();
		return "redirect:/";
		
	}
		
	@RequestMapping(value="/pwdCheck.json", method = RequestMethod.POST)
	public ModelAndView pwdChk(MemberVO memberVO) throws Exception {
		logger.info("pwdCheck");
		
		ModelAndView model = new ModelAndView("jsonView");
		
		int result = memberService.pwdChk(memberVO);
		
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
		social_key = cryptoService.encrypt(social_key);
		
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
