package com.GroupOne.yu.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.yu.model.RestaurantBean;

public interface RestaurantRepository extends JpaRepository<RestaurantBean, Integer> {
	
		//管理者 查詢所有資料
		//List<RestaurantBean> findAll();
	
		//買家 查單一餐廳
		RestaurantBean findByRstName(String rstName);		
	
		//消費者 查某餐廳菜單
		RestaurantBean findByRstNameAndOffshelfIsNull(String rstName);

		//管理員查單筆
		RestaurantBean findByUserName(String userName);

		//賣家 刪除餐廳
		void deleteByRstName(String rstName);
		//void DeleteRestaurant(RestaurantBean restaurant);
		
		//賣家更新資料
		//RestaurantBean save(RestaurantBean restaurantBean);
		
		//管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
		@Modifying
		@Query(value="Update restaurant set offshelf=?1 where userName=?2 and rstName=?3", nativeQuery=true)
		//想要如何再SQL做更新就如何寫
		void updateRestaurantByAdmin(String offshelf, String userName, String rstName);
		
		//賣家 新增餐廳
		//RestaurantBean save(RestaurantBean restaurantBean);


	

}
