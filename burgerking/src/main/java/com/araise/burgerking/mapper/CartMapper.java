package com.araise.burgerking.mapper;

import java.util.List;

import com.araise.burgerking.vo.CartVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("cartMapper")
public interface CartMapper {

	public void addCart(CartVO cartVO) throws Exception;
	
	public List<CartVO> cartList(String userId)  throws Exception;
	
	public void cartDelete(CartVO cartVO) throws Exception;
	
	public void cartClear(CartVO cartVO) throws Exception;
}
