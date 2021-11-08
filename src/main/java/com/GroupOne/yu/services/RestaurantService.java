package com.GroupOne.yu.services;

import java.util.List;
import java.util.Optional;

import com.GroupOne.yu.model.RestaurantBean;

public interface RestaurantService {

	// 查詢所有資料
	List<RestaurantBean> findAllRestaurant();

	// 更新資料
	RestaurantBean updateRestaurant(RestaurantBean restaurantBean);
	
	// 查詢單筆資料
	Optional<RestaurantBean> findRestaurantByRstName(String rstName);

	// 新增餐廳
	RestaurantBean addRestaurant(RestaurantBean restaurantBean);

	//刪除餐廳
	void DeleteRestaurant(String rstName);
	//void DeleteRestaurant(RestaurantBean restaurant);



}
