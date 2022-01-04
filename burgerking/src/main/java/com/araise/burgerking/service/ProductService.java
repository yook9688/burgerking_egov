package com.araise.burgerking.service;

import java.util.List;

import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.ProductVO;

public interface ProductService {
	
	//제품 목록
	public List<ProductVO> productList(String pCategory) throws Exception;
	
	//제품 상세보기
	public ProductVO productDetail(String pCode) throws Exception;
	
	public void addCart(CartVO cartVO) throws Exception;
	
}
