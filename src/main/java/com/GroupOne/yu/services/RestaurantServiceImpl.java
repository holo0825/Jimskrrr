package com.GroupOne.yu.services;

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

	// 查詢所有餐廳 find
	@Transactional
	@Override
	public List<RestaurantBean> findAllRestaurant() {
		return restaurantRepository.findAll();
	}

	// 更新 save
	@Transactional
	@Override
	public RestaurantBean updateRestaurant(RestaurantBean restaurantBean) {
		return restaurantRepository.save(restaurantBean);
	}
	

	// 依照餐廳名稱搜尋餐廳 find
	@Transactional
	@Override
	public Optional<RestaurantBean> findRestaurantByRstName(String rstName) {
		return restaurantRepository.findByRstname(rstName);
		
	}

	// 新增餐廳 save
	@Transactional
	@Override
	public RestaurantBean addRestaurant(RestaurantBean restaurantBean) {
		return restaurantRepository.save(restaurantBean);
	}

	//刪除餐廳S
	@Override
	@Transactional
	public void DeleteRestaurant(String rstName){
		restaurantRepository.deleteByRstname(rstName);
	}
	

}
