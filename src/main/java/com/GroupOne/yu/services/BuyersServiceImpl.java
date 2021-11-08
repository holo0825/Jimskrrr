//package com.GroupOne.yu.services;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.GroupOne.yu.dao.BuyersRepostitory;
//import com.GroupOne.yu.model.RestaurantCartBean;
//
//@Repository
//@Transactional
//public class BuyersServiceImpl implements BuyersService {
//	
//	BuyersRepostitory buyers;
//	
//	@Autowired
//	public BuyersServiceImpl(BuyersRepostitory buyers) {
//		this.buyers = buyers;
//	}
//	
//	@Override
//	public List<RestaurantCartBean> findAll() {
//		return buyers.findAll();
//	}
//
//	@Override
//	public RestaurantCartBean findById(String id) {
//		RestaurantCartBean sellerBean = buyers.findById(id);
//		
//		RestaurantCartBean cart = new RestaurantCartBean();
//		cart.setId(sellerBean.getId());
//		cart.setProductName(sellerBean.getProductName());
//		cart.setPrice(sellerBean.getPrice());
//		cart.setCategory("f");
//		
//		return cart;
//	}
//
//}
