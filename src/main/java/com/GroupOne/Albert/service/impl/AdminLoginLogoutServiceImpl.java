package com.GroupOne.Albert.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.AdminLoginLogoutDao;
import com.GroupOne.Albert.model.AdminBean;
import com.GroupOne.Albert.service.AdminLoginLogoutService;

// Admin登入登出的Service實作類別，實作AdminLoginLogoutService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

//@Service 
@Repository
@Transactional
public class AdminLoginLogoutServiceImpl implements AdminLoginLogoutService {

	private AdminLoginLogoutDao allDao;
	
	@Autowired
	public AdminLoginLogoutServiceImpl(AdminLoginLogoutDao allDao) {
		this.allDao = allDao;
	}

//	@Override
//	public AdminBean checkLogin(String username, String password, String email) {
//		return allDao.checkLogin(username, password, email);
//	}
	@Override
	public AdminBean findByUsernameAndPasswordAndEmail(String username, String password, String email) {
		return allDao.findByUsernameAndPasswordAndEmail(username, password, email);
	}

}
