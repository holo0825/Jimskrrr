package com.GroupOne.yu.services;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.GroupOne.yu.dao.RestaurantRepository;
import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;

@Repository
@Transactional
public class RestaurantServiceImpl implements RestaurantService {
	RestaurantRepository restaurantRepository;

	@Autowired
	public RestaurantServiceImpl(RestaurantRepository restaurantRepository) {
		this.restaurantRepository = restaurantRepository;
		
	}

	//管理者 查詢所有餐廳 find
	@Transactional
	@Override
	public List<RestaurantBean> findAllRestaurant() {
		return restaurantRepository.findAll();
	}

	//賣家 更新 save
	@Transactional
	@Override
	public RestaurantBean updateRestaurant(RestaurantBean restaurantBean) {
		return restaurantRepository.save(restaurantBean);
	}
	
	//管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
	@Override
	public void updateRestaurantByAdmin(String offshelf, String userName, String rstName) {
		restaurantRepository.updateRestaurantByAdmin(offshelf, userName, rstName);
		//restaurantRepository.flush();
	}

	//賣家 依照餐廳名稱 搜尋單一餐廳 find
	@Override
	public RestaurantBean findByRstName(String rstName) {
		return restaurantRepository.findByRstName(rstName);
		
	}
	
	//管理員 查單筆
		@Transactional
		@Override
		public RestaurantBean findByUserName(String userName) {
			return restaurantRepository.findByUserName(userName);			
		}
	

	//賣家 新增餐廳 save
	@Transactional
	@Override
	public RestaurantBean addRestaurant(RestaurantBean restaurantBean) {		
			System.out.println(restaurantBean);
			System.out.println(restaurantBean.getImage());			
			restaurantBean.setRstImage(restaurantBean.getRstImage());		
		return restaurantRepository.save(restaurantBean);
	}

	//賣家 刪除餐廳
	@Override
	@Transactional
	public void deleteByRstName(String rstName){
		restaurantRepository.deleteByRstName(rstName);
	}

	
	

}
