package com.araise.burgerking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.araise.burgerking.mapper.ProductMapper;
import com.araise.burgerking.service.ProductService;
import com.araise.burgerking.vo.CartVO;
import com.araise.burgerking.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<ProductVO> productList(String pCategory) throws Exception {
		
		return productMapper.productList(pCategory);
	}

	@Override
	public ProductVO productDetail(String pCode) throws Exception {
		
		return productMapper.productDetail(pCode);
	}

	@Override
	public void addCart(CartVO cartVO) throws Exception {
		
		productMapper.addCart(cartVO);
		
	}
	
}
