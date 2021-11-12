package com.GroupOne.tom.seller.service;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.tom.model.SellerProductBean;

public interface SellerService {
	SellerProductBean insertProduct(SellerProductBean seller);
	
	SellerProductBean updateProduct(SellerProductBean seller);
	
	void deleteProduct(Integer id);
	
	List<SellerProductBean> findAll();
	
	public Optional<SellerProductBean> findById(int id);
	
	
}