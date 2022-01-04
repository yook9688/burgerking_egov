package com.araise.burgerking.mapper;

import java.util.List;

import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.ProductVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("productMapper")
public interface ProductMapper {

	public List<ProductVO> productList(String pCategory) throws Exception;
	
	public ProductVO productDetail(String pCode) throws Exception;
	
	//장바구니 담기
	public void addCart(CartVO cartVO) throws Exception;
	
}
