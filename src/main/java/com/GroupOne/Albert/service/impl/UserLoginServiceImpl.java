package com.GroupOne.Albert.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.UserLoginRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.UserBean;
import com.GroupOne.Albert.service.UserLoginService;

// User登入登出的Service實作類別，實作UserLoginLogoutService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

//@Service 
@Repository
@Transactional
public class UserLoginServiceImpl implements UserLoginService {

	private UserLoginRepository ullDao;

	@Autowired
	public UserLoginServiceImpl(UserLoginRepository ullDao) {
		this.ullDao = ullDao;
	}

//	@Override
//	public UserBean checkLogin(String username, String password, String email) {
//		return ullDao.checkLogin(username, password, email);
//	}
//	@Override
//	public UserBean findByUsernameAndPasswordAndEmail(String username, String password, String email) {
//		return ullDao.findByUsernameAndPasswordAndEmail(username, password, email);
//	}
	@Override
	public Member findByUsernameAndPasswordAndEmail(String username, String password, String email) {
		return ullDao.findByUsernameAndPasswordAndEmail(username, password, email);
	}


}
