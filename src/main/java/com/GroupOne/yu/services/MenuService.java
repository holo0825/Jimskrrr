package com.GroupOne.yu.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;

public interface MenuService {

	//賣家&消費者  查詢所有菜單
	List<MenuBean> findAll();

	//賣家 更新菜單
	void updateMenu(MenuBean menuBean);
	//void updateMenu(MenuBean menuBean, MultipartFile coverImage);
	
	//管理員 強迫下架菜色 (更新一個欄位，避免全部強制更新)
	//@Modifying
	//@Query(value="Update menu set offshelf=? where rstName=?1, productName=?2 ", nativeQuery=true)
	//想要如何再SQL做更新就如何寫
	void updateMenuByAdmin(String offshelf, String rstName, String productName);
		
	//賣家&消費者  查詢單筆菜色
	MenuBean findByProductName(String productName);
	//Optional<MenuBean> findByProduct(String productName);
	//MenuBean findById(Integer id);
		
	//賣家 根據餐廳名稱查詢自家菜單
	//MenuBean findByMyRstName(String rstName);
	
	//被下架的就不會是空的，所以只會顯示空的出來
	List<MenuBean> findByRstName(String rstName);
	//List<MenuBean> findByRstNameAndOffshelfIsNull(String rstName);

	//賣家 新增菜色
	MenuBean addProduct(MenuBean menuBean);
	//void addProducts(MenuBean menuBean, MultipartFile coverImage);
	
	//買家 新增&修改 存照片
	//void addPicture(MenuBean menuBean);
	
	//賣家 刪除菜色
	void deleteByProductName(String productName);






	




}
