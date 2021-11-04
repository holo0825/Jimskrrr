package com.GroupOne.kai.dao;



import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.kai.model.ActivityBean;


public interface ActivityRepository 
					extends JpaRepository<ActivityBean, Integer> {

	
//	ActivityBean findBy

//	@Query("select distinct category from ActivityBean")
//	List<ActivityBean> queryByTopic(String search);
	
	//查詢提關鍵字
	List<ActivityBean> findByTopicContaining(String search);
	
	//實作，更新報名人數 @Query扣完1的版本
	@Transactional
	  @Modifying
	  @Query("UPDATE ActivityBean set quota=:quota where id=:id ")
	void updatequota(int id,int quota);

}
