package com.araise.burgerking.mapper;

import java.util.List;

import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.OrderVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("orderMapper")
public interface OrderMapper {
	
	public void addOrder(OrderVO orderVO) throws Exception;
	
	public void addOrderDetail(OrderVO orderVO) throws Exception;
	
	public void cartClear(String userId) throws Exception;
	
	public List<OrderVO> orderList(String userId) throws Exception;
	
	public List<OrderVO> orderDetail(OrderVO orderVO) throws Exception;
}
