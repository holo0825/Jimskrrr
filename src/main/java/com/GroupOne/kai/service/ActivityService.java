package com.GroupOne.kai.service;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.kai.model.ActivityBean;


public interface ActivityService {

	//新增活動資料
	void insertActivity(ActivityBean activityData, MultipartFile image);
	
	//顯示所有活動資料V
	List<ActivityBean> selectAllUsers();
	
	//顯示活動細項V
	 Optional<ActivityBean> selectOneUsers(int id);
	
	//查詢活動主題V
	List<ActivityBean> selectSearchTopic(String inputTopic);

	//ID
	Optional<ActivityBean> selectSearchId(int id);

	//修改活動資料
	// public List < ActivityBean > update(int searchId)
	void editActivity(ActivityBean editActivity, MultipartFile image);
	
	//刪除活動資料V
	void deleteActivity(int id);
}