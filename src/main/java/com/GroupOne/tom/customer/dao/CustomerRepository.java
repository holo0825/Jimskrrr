package com.GroupOne.tom.customer.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.tom.model.SellerProductBean;

public interface CustomerRepository 
					extends JpaRepository<SellerProductBean, Integer> {
}
