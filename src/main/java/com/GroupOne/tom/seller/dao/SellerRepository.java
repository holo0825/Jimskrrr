package com.GroupOne.tom.seller.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.tom.model.SellerProductBean;

public interface SellerRepository 
					extends JpaRepository<SellerProductBean, Integer> {
}
