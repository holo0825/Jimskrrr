package com.GroupOne.Albert.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.UserRegisterDao;
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.UserRegisterService;

// 買家註冊和賣家註冊Service實作類別，實作RegisterService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

@Service
@Transactional
public class UserRegisterServiceImpl implements UserRegisterService {

	UserRegisterDao userRegisterDao;

	@Autowired
	public UserRegisterServiceImpl(UserRegisterDao userRegisterDao) {
		this.userRegisterDao = userRegisterDao;
	}
	
//	@Override
//	public String registerUser(UserBean userBean) {
//		return rDao.registerUser(userBean);
//	}

	@Override
	public String registerUser(UserBean userBean) {
		if (userBean != null) {
			UserBean userRecord = userRegisterDao.findByUsername(userBean.getUsername());
			if (userRecord == null) {
				userRegisterDao.save(userBean);
				return "買家用戶註冊成功！";
			} else {
				return "買家用戶註冊失敗，請再次確認"; // On failure, send a message from here.
			}

		}else {
			return "買家用戶註冊失敗，請再次確認"; // On failure, send a message from here.
		}
	}
}
