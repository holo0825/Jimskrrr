package com.GroupOne.Albert.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.AdminLoginRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.AdminBean;
import com.GroupOne.Albert.service.AdminLoginService;

// Admin登入登出的Service實作類別，實作AdminLoginLogoutService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

//@Service 
@Repository
@Transactional
public class AdminLoginServiceImpl implements AdminLoginService {

	private AdminLoginRepository adminLoginRepository;
	
	@Autowired
	public AdminLoginServiceImpl(AdminLoginRepository adminLoginRepository) {
		this.adminLoginRepository = adminLoginRepository;
	}

//	@Override
//	public AdminBean checkLogin(String username, String password, String email) {
//		return allDao.checkLogin(username, password, email);
//	}
//	@Override
//	public AdminBean findByUsernameAndPasswordAndEmail(String username, String password, String email) {
//		return allDao.findByUsernameAndPasswordAndEmail(username, password, email);
//	}
	@Override
	public Member findByUsernameAndPasswordAndEmail(String username, String password, String email) {
		return adminLoginRepository.findByUsernameAndPasswordAndEmail(username, password, email);
	}
	
	// 新增來給Spring Security的自訂AuthenticationSuccessHandler使用(AuthenticationSuccessWithSessionHandler.java)
	@Override
	public Member findByUsernameAndPassword(String username, String password) {
		return adminLoginRepository.findByUsernameAndPassword(username, password);
	}

	// 新增來給Spring Security的自訂AuthenticationSuccessHandler使用(AuthenticationSuccessWithSessionHandler.java)
	@Override
	public Member findByUsername(String username) {
		return adminLoginRepository.findByUsername(username);
	}

}
