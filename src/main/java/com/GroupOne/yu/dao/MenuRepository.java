package com.GroupOne.yu.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.yu.model.MenuBean;

public interface MenuRepository 
					extends JpaRepository<MenuBean, Integer> {

	MenuBean findByProductName(String productName);

	void deleteByProductName(String productName);

	
}

