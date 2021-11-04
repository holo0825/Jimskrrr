package com.GroupOne.tom.seller.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.tom.seller.dao.SellerRepository;
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
}
