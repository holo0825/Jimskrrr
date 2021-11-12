package com.GroupOne.Albert.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.SellerLoginRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;
import com.GroupOne.Albert.service.SellerLoginService;

// Seller登入登出的Service實作類別，實作SellerAdminLoginLogoutService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

//@Service 
@Repository
@Transactional
public class SellerLoginServiceImpl implements SellerLoginService {

	private SellerLoginRepository sllDao;
	
	@Autowired
	public SellerLoginServiceImpl(SellerLoginRepository sllDao) {
		this.sllDao = sllDao;
	}

//	@Override
//	public SellerBean checkLogin(String username, String password, String email) {
//		return sllDao.checkLogin(username, password, email);
//	}
//	@Override
//	public SellerBean findByUsernameAndPasswordAndEmail(String username, String password, String email) {
//		return sllDao.findByUsernameAndPasswordAndEmail(username, password, email);
//	}
	@Override
	public Member findByUsernameAndPasswordAndEmail(String username, String password, String email) {
		return sllDao.findByUsernameAndPasswordAndEmail(username, password, email);
	}

}
