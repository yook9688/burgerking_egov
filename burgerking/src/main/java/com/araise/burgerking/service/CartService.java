package com.araise.burgerking.service;

import java.util.List;

import com.araise.burgerking.vo.CartVO;

public interface CartService {

	public void addCart(CartVO cartVO) throws Exception;
	
	public List<CartVO> cartList(String userId) throws Exception;
	
	public void cartDelete(CartVO cartVO) throws Exception;
	
	public void cartClear(CartVO cartVO) throws Exception;
}
