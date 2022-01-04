package com.araise.burgerking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araise.burgerking.mapper.CartMapper;
import com.araise.burgerking.service.CartService;
import com.araise.burgerking.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public void addCart(CartVO cartVO) throws Exception {
		
		cartMapper.addCart(cartVO);
		
	}

	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		
		return cartMapper.cartList(userId);
	}


	@Override
	public void cartDelete(CartVO cartVO) throws Exception {
		
		cartMapper.cartDelete(cartVO);
		
	}

	@Override
	public void cartClear(CartVO cartVO) throws Exception {
		
		cartMapper.cartClear(cartVO);
		
	}
	
	

}
