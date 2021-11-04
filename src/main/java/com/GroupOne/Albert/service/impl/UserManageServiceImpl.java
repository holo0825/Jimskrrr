package com.GroupOne.Albert.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.UserManageDao;
import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.UserManageService;

// Admin管理User會員Service實作類別，實作UserManageService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

@Service @Transactional
public class UserManageServiceImpl implements UserManageService {

	SessionFactory factory;
	UserManageDao umDao;
	
	@Autowired
	public UserManageServiceImpl(SessionFactory factory, UserManageDao umDao) {
		super();
		this.factory = factory;
		this.umDao = umDao;
	}

//	@Override
//	public void insertUser(UserBean user) throws SQLException {
//		umDao.insertUser(user);
//	}
	@Override
	public void insertUser(UserBean user) throws SQLException {
		umDao.save(user);
	}

//	@Override
//	public UserBean selectUser(int id) {
//		return umDao.selectUser(id);
//	}
	@Override
	public UserBean selectUser(int id) {
		return umDao.findById(id).get();
	}

//	@Override
//	public List<UserBean> selectAllUsers() {
//		return umDao.selectAllUsers();
//	}
	@Override
	public List<UserBean> selectAllUsers() {
		return umDao.findAll();
	}

//	@Override
//	public boolean deleteUser(int id) throws SQLException {
//		return umDao.deleteUser(id);
//	}
	@Override
	public boolean deleteUser(int id) throws SQLException {
		if (selectUser(id)!=null) {
			umDao.deleteById(id);
			return true;
		}
		return false;
	}

//	@Override
//	public boolean updateUser(UserBean user) throws SQLException {
//		return umDao.updateUser(user);
//	}
	@Override
	public boolean updateUser(UserBean user) throws SQLException {
		if (user != null) {
			umDao.save(user);
			return true;
		}
		return false;
	}

}
