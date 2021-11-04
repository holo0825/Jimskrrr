package com.GroupOne.tom.customer.service;

import java.util.List;

import com.GroupOne.tom.model.CartBean;
import com.GroupOne.tom.model.SellerProductBean;

public interface CustomerService {
	List<SellerProductBean> findAll();
	
	CartBean getCustomerById(int id);
}