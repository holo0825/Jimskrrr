package com.GroupOne.Albert.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.UserManageRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.UserBean;
import com.GroupOne.Albert.service.UserManageService;

// Admin管理User會員Service實作類別，實作UserManageService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

@Service @Transactional
public class UserManageServiceImpl implements UserManageService {

	UserManageRepository userManageRepo;
	
	@Autowired
	public UserManageServiceImpl(UserManageRepository userManageRepo) {
		this.userManageRepo = userManageRepo;
	}

//	@Override
//	public void insertUser(UserBean user) throws SQLException {
//		umDao.insertUser(user);
//	}
	@Override
	public void insertUser(Member user) throws SQLException {
//	public void insertUser(UserBean user) throws SQLException {
		userManageRepo.save(user);
	}

//	@Override
//	public UserBean selectUser(int id) {
//		return umDao.selectUser(id);
//	}
	@Override
	public Member selectUser(int id) {
//	public UserBean selectUser(int id) {
		return userManageRepo.findById(id).get();
	}

//	@Override
//	public List<UserBean> selectAllUsers() {
//		return umDao.selectAllUsers();
//	}
	@Override
	public List<Member> selectAllUsers() {
//	public List<UserBean> selectAllUsers() {
		return userManageRepo.findAll();
	}

//	@Override
//	public boolean deleteUser(int id) throws SQLException {
//		return umDao.deleteUser(id);
//	}
	@Override
	public boolean deleteUser(int id) throws SQLException {
		if (selectUser(id)!=null) {
			userManageRepo.deleteById(id);
			return true;
		}
		return false;
	}

//	@Override
//	public boolean updateUser(UserBean user) throws SQLException {
//		return umDao.updateUser(user);
//	}
	@Override
	public boolean updateUser(Member user) throws SQLException {
//	public boolean updateUser(UserBean user) throws SQLException {
		if (user != null) {
			userManageRepo.save(user);
			return true;
		}
		return false;
	}

}
