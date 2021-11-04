package com.GroupOne.kai.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.kai.dao.ActivityRepository;
import com.GroupOne.kai.model.ActivityBean;

@Service
@Transactional
public class ActivityServiceImpI implements ActivityService {

	ActivityRepository activityRepository;

	@Autowired
	public void ActivityServiceImpl(ActivityRepository activityRepository) {

		
		this.activityRepository = activityRepository;
	}
	//[前端]活動卡
	@Transactional // A.O.P
	@Override
	public List<ActivityBean> selectAllUsers() {

//		return activityRepository.selectAllUsers();
//		System.out.println("do done");
		return activityRepository.findAll();
	}
	//[前端]活動卡內容
	@Override
	public Optional<ActivityBean> selectOneUsers(int id) {
		
		return activityRepository.findById(id);


	}
	
	//[後端]新增
	@Override
	public void insertActivity(ActivityBean activity, MultipartFile image) {
		StringBuilder styleStr = new StringBuilder("");
		for(String style:activity.getStyles()) {
			styleStr.append(style).append(",");
		}
		activity.setSchedule(activity.getStartTime()+"-"+activity.getEndTime());
		if(styleStr.length() != 0)
			activity.setStyle(styleStr.deleteCharAt(styleStr.length()-1).toString());
		try {
			activity.setActivity_photo(image.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		activity.setCreate_date(new Date());
		activityRepository.save(activity);

	}
	//[後端]查詢主題關鍵字
	@Override
	public List<ActivityBean> selectSearchTopic(String inputTopic) {

		return activityRepository.findByTopicContaining(inputTopic);

	}
	

	@Override
	public Optional<ActivityBean> selectSearchId(int id) {
		
		return activityRepository.findById(id);
	}
	//[後端]修改
	@Override
	public void editActivity(ActivityBean activity, MultipartFile image) {
		StringBuilder styleStr = new StringBuilder("");
		for(String style:activity.getStyles()) {
			styleStr.append(style).append(",");
		}
		activity.setSchedule(activity.getStartTime()+"-"+activity.getEndTime());
		if(styleStr.length() != 0)
			activity.setStyle(styleStr.deleteCharAt(styleStr.length()-1).toString());
		try {
			activity.setActivity_photo(image.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		activityRepository.save(activity);

	}
	//[後端]刪除
	@Override
	public void deleteActivity(int id) {
		System.out.println("------------>");
		activityRepository.deleteById(id);
	}

	



}
