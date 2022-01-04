package com.araise.burgerking.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.araise.burgerking.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	//제품 목록
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productList(Model model,HttpServletRequest request) throws Exception {
		logger.info("product list");
		
		//제품 카테고리
		String pCategory = request.getParameter("cate");
		
		model.addAttribute("product", productService.productList(pCategory));
		
		return "product/productList";
	}
	
	// 제품 상세보기
	@RequestMapping(value="/productDetail.do", method = RequestMethod.GET)
	public String prodetail(Model model, HttpServletRequest request, HttpSession session) throws Exception {
		logger.info("product detail");
		
		//선택한 제품 코드
		String pCode = request.getParameter("c");

		model.addAttribute("product", productService.productDetail(pCode));
		
		return "product/productDetail";
	}
	
	
}
