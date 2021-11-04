package com.GroupOne.kai.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.GroupOne.kai.dao.ActivityRepository;
import com.GroupOne.kai.dao.RecordParticipantRepository;
import com.GroupOne.kai.model.RecordParticipantBean;

@Service
@Transactional
public class RecordParticipantServiceImpl implements RecordParticipantService {
	
	RecordParticipantRepository recordParticipantRepository;
	ActivityRepository activityRepository;

	public RecordParticipantServiceImpl(RecordParticipantRepository recordParticipantRepository,
			ActivityRepository activityRepository) {
	
		this.recordParticipantRepository = recordParticipantRepository;
		this.activityRepository = activityRepository;
	}

	//insert
	@Override
	public void insertRecordParticipant(RecordParticipantBean recordParticipantData) {
		
		recordParticipantRepository.save(recordParticipantData);
	}
	
	//selectAll
	@Override
	public List<RecordParticipantBean> selectAllUsers() {
		
		return recordParticipantRepository.findAll();
	}

	@Override
	public void deleteRecordParticipant(int id) {
		
		recordParticipantRepository.deleteById(id);
		
	}
	//更新報名人數
	@Override
	public void updatequota(int id,int quota) {
		
	
		
		activityRepository.updatequota(id,quota);
	}
	
}
