package com.GroupOne.yu.services;

import java.util.List;
import java.util.Optional;

import com.GroupOne.yu.model.MenuBean;

public interface MenuService {

	// 查詢所有菜單
	List<MenuBean> findAll();

	// 更新菜單
	void updateMenu(MenuBean menuBean);
	
	// 查詢單筆菜色
	MenuBean findByProductName(String productName);

	// 新增菜色
	MenuBean addProduct(MenuBean menuBean);	
	
	//刪除菜色
	void DeleteMenu(String productName);



	




}
