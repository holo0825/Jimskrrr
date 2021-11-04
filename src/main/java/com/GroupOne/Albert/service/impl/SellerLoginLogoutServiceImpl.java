package com.GroupOne.Albert.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.SellerLoginLogoutDao;
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.service.SellerLoginLogoutService;

// Seller登入登出的Service實作類別，實作SellerAdminLoginLogoutService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

//@Service 
@Repository
@Transactional
public class SellerLoginLogoutServiceImpl implements SellerLoginLogoutService {

	private SellerLoginLogoutDao sllDao;
	
	@Autowired
	public SellerLoginLogoutServiceImpl(SellerLoginLogoutDao sllDao) {
		this.sllDao = sllDao;
	}

//	@Override
//	public SellerBean checkLogin(String username, String password, String email) {
//		return sllDao.checkLogin(username, password, email);
//	}
	@Override
	public SellerBean findByUsernameAndPasswordAndEmail(String username, String password, String email) {
		return sllDao.findByUsernameAndPasswordAndEmail(username, password, email);
	}

}
