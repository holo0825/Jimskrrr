package com.GroupOne.Albert.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.UserRegisterRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;
import com.GroupOne.Albert.members.oldusers.UserBean;
import com.GroupOne.Albert.service.UserRegisterService;

// 買家註冊和賣家註冊Service實作類別，實作RegisterService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

@Service
@Transactional
public class UserRegisterServiceImpl implements UserRegisterService {

	UserRegisterRepository userRegisterRepo;

	@Autowired
	public UserRegisterServiceImpl(UserRegisterRepository userRegisterRepo) {
		this.userRegisterRepo = userRegisterRepo;
	}
	
//	@Override
//	public String registerUser(UserBean userBean) {
//		return rDao.registerUser(userBean);
//	}

	@Override
	public String registerUser(Member userBean) {
//	public String registerUser(UserBean userBean) {
		if (userBean != null) {
//			UserBean userRecord = userRegisterDao.findByUsername(userBean.getUsername());
			Member userRecord = userRegisterRepo.findByUsername(userBean.getUsername());
			if (userRecord == null) {
				userRegisterRepo.save(userBean);
				return "買家用戶註冊成功！";
			} else {
				return "買家用戶註冊失敗，請再次確認"; // On failure, send a message from here.
			}

		}else {
			return "買家用戶註冊失敗，請再次確認"; // On failure, send a message from here.
		}
	}
}
