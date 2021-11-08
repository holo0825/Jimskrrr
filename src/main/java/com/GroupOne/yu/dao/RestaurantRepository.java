package com.GroupOne.yu.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.yu.model.RestaurantBean;

public interface RestaurantRepository extends JpaRepository<RestaurantBean, Integer> {

	Optional<RestaurantBean> findByRstname(String rstName);

	void deleteByRstname(String rstName);

	

}
