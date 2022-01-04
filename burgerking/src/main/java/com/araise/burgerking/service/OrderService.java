package com.araise.burgerking.service;

import java.util.List;

import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.OrderVO;

public interface OrderService {
	
	public void addOrder(OrderVO orderVO) throws Exception;
	
	public void addOrderDetail(OrderVO orderVO) throws Exception;
	
	public void cartClear(String userId) throws Exception;
	
	public List<OrderVO> orderList(String userId) throws Exception;
	
	public List<OrderVO> orderDetail(OrderVO orderVO) throws Exception;
}
