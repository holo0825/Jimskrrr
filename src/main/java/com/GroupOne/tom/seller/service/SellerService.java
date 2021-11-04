package com.GroupOne.tom.seller.service;

import java.util.List;

import com.GroupOne.tom.model.SellerProductBean;

public interface SellerService {
	SellerProductBean insertProduct(SellerProductBean seller);
	
	SellerProductBean updateProduct(SellerProductBean seller);
	
	void deleteProduct(Integer id);
	
	List<SellerProductBean> findAll();
}