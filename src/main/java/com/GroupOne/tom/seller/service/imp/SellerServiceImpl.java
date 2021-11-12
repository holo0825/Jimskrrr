package com.GroupOne.tom.seller.service.imp;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.tom.seller.dao.SellerRepository;
import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.tom.model.SellerProductBean;
import com.GroupOne.tom.seller.service.SellerService;

@Repository
@Transactional
public class SellerServiceImpl implements SellerService {
	
	SellerRepository sellerRepository;
	
	@Autowired
	public SellerServiceImpl(SellerRepository sellerRepository) {
		this.sellerRepository = sellerRepository;
	}

	@Override
	public SellerProductBean insertProduct(SellerProductBean seller) {
		try {
			System.out.println("2ok");
			seller.setPicture(seller.getProductImage().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sellerRepository.save(seller);
	}

	@Override
	public SellerProductBean updateProduct(SellerProductBean seller) {
		return sellerRepository.save(seller);
	}

	@Override
	public void deleteProduct(Integer id) {
		sellerRepository.deleteById(id);
	}
	
	@Override
	public List<SellerProductBean> findAll() {
		return sellerRepository.findAll();
	}
	
	@Override
	public Optional<SellerProductBean> findById(int id) {
		return sellerRepository.findById(id);
	}
}
