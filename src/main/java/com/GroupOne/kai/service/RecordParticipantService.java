package com.GroupOne.kai.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.kai.model.RecordParticipantBean;

public interface RecordParticipantService {
	
	//新增報名資料
	void insertRecordParticipant(RecordParticipantBean recordParticipantData);
	
	//顯示所有報名者資料
	List<RecordParticipantBean> selectAllUsers();
	
	//刪除活動資料
	void deleteRecordParticipant(int id);
	
	//更新報名人數
	void updatequota(int id,int quota);
}
