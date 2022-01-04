package com.araise.burgerking.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.araise.burgerking.service.CartService;
import com.araise.burgerking.service.OrderService;
import com.araise.burgerking.vo.MemberVO;
import com.araise.burgerking.vo.OrderVO;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value = "/orderView.do", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model ) throws Exception {
		logger.info("orderView");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
			
		model.addAttribute("cartList", cartService.cartList(userId));
		
		return "order/orderView";
	}
	
	
	@RequestMapping(value="/order.do", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO orderVO) throws Exception {
		logger.info("order");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		// orderId 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ymd = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=1; i<=8; i++) {
			subNum += (int)(Math.random() * 10);
		}
		String orderId = ymd+"-"+subNum;
		
		orderVO.setOrderId(orderId);
		orderVO.setUserId(userId);
		
		orderService.addOrder(orderVO);
		orderService.addOrderDetail(orderVO);
		
		orderService.cartClear(userId);
		
		return "redirect:/order/orderList.do";
		
	}
	
	@RequestMapping(value="/orderList.do", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) throws Exception {
		logger.info("orderList");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		model.addAttribute("orderList", orderService.orderList(userId));
		
		return "order/orderList";
	}
	
	@RequestMapping(value="/orderDetail.do", method = RequestMethod.GET)
	public String orderDetail(HttpSession session, HttpServletRequest request, OrderVO orderVO, Model model) throws Exception {
		logger.info("orderDetail");
		
		String orderId = request.getParameter("oId");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		orderVO.setUserId(userId);
		orderVO.setOrderId(orderId);
		
		model.addAttribute("orderDetailList", orderService.orderDetail(orderVO));
		
		return "order/orderDetail";
		
	}
}
