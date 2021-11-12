package com.GroupOne.yu.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.yu.model.RestaurantBean;

public interface RestaurantService {

	//管理者 查詢所有資料
	List<RestaurantBean> findAllRestaurant();
			

	 //賣家 更新資料(管理者部分強制下架)
	RestaurantBean updateRestaurant(RestaurantBean restaurantBean);
	
	//管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
	//@Modifying
	//@Query(value="Update restaurant set offshelf=?1 where userName=?2, rstName=?3", nativeQuery=true)
	//想要如何再SQL做更新就如何寫
	void updateRestaurantByAdmin(String offshelf, String userName, String rstName);
	
	//消費者 以餐廳名稱 查單筆
	RestaurantBean findByRstName(String rstName);
	
	//管理員 用帳號 查單筆
	RestaurantBean findByUserName(String userName);
	
	//賣家 新增餐廳
	RestaurantBean addRestaurant(RestaurantBean restaurantBean);

	//賣家 刪除餐廳
	void deleteByRstName(String rstName);
	//void DeleteRestaurant(RestaurantBean restaurant);



}
