package com.araise.burgerking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araise.burgerking.mapper.OrderMapper;
import com.araise.burgerking.service.OrderService;
import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public void addOrder(OrderVO orderVO) throws Exception {
		
		orderMapper.addOrder(orderVO);
		
	}
	

	@Override
	public void addOrderDetail(OrderVO orderVO) throws Exception {
		
		orderMapper.addOrderDetail(orderVO);
	}



	@Override
	public void cartClear(String userId) throws Exception {
		
		orderMapper.cartClear(userId);
		
	}

	@Override
	public List<OrderVO> orderList(String userId) throws Exception {
		
		return orderMapper.orderList(userId);
	}

	@Override
	public List<OrderVO> orderDetail(OrderVO orderVO) throws Exception {

		return orderMapper.orderDetail(orderVO);
	}
	
	
	
	
	
	
	
}
