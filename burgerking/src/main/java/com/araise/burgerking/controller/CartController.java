package com.araise.burgerking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.araise.burgerking.service.CartService;
import com.araise.burgerking.service.ProductService;
import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.MemberVO;
import com.araise.burgerking.vo.ProductVO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@PostMapping("addCart.do")
	public String addCart(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("add cart");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cartVO.setUserId(member.getUserId());
		
		cartService.addCart(cartVO);
		
		
		return "redirect:/cart/cartList.do";
	}
	
	// addCart1과 addCart2 통합
	/*@RequestMapping(value = "/addCart1", method = RequestMethod.POST)
	public String addCart1(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("add cart1");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cartVO.setUserId(member.getUserId());
		
		cartService.addCart1(cartVO);
		
		
		return "redirect:/cart/prolist?cate=ss";
		
	}
	
	@RequestMapping(value = "/addCart2", method = RequestMethod.POST)
	public String addCart2(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("add cart2");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cartVO.setUserId(member.getUserId());
		
		cartService.addCart2(cartVO);
		
		
		return "redirect:/cart/prolist?cate=ss";
		
	}*/
	
	//제품 목록
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(Model model,@RequestParam("cate") String pCategory) throws Exception {
		logger.info("product list");
		
		model.addAttribute("product", productService.productList(pCategory));
		
		return "cart/productList";
	}
	
	// 제품 상세보기
	@RequestMapping(value="/productDetail.do", method = RequestMethod.GET)
	public String prodetail(Model model, HttpServletRequest request) throws Exception {
		logger.info("product detail");
		
		String pCode = request.getParameter("c");
		
		ProductVO result = productService.productDetail(pCode);
		
		String category_code = result.getpCategory();
		String category_title = "";
		switch(category_code) {
			case "ss" : category_title = "스페셜&할인팩"; break;
			case "p" : category_title = "프리미엄"; break;
			case "w" : category_title = "와퍼"; break;
			case "jb" : category_title = "주니어&버거"; break;
			case "a" : category_title = "올데이킹&치킨버거"; break;
			case "s" : category_title = "사이드"; break;
			case "d" : category_title = "음료&디저트"; break;
			default : category_title = "아침메뉴";
		}
		model.addAttribute("product", result);
		model.addAttribute("category_title", category_title);
		
		return "cart/productDetail";
	}
	
	
	@RequestMapping(value = "/cartList.do", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model ) throws Exception {
		logger.info("cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
			
		model.addAttribute("cartList", cartService.cartList(userId));
		
		return "cart/cartList";
	}

	
	@RequestMapping(value = "/cartDelete.do", method = RequestMethod.POST)
	public String cartDelete(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("delete cart");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cartVO.setUserId(member.getUserId());
		
		cartService.cartDelete(cartVO);
		return "redirect:/cart/cartList.do";
	}
	
	
}
