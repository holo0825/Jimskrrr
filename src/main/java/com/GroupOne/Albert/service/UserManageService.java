package com.GroupOne.Albert.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import com.GroupOne.Albert.model.UserBean;

// Admin管理User會員的Service介面，裡面定義抽象方法給Service實作類別(UserManageServiceImpl.java)Override使用
// 此介面用來間接呼叫DAO介面UserManageDao.java做事，執行CRUD功能

public interface UserManageService {

	// Create or insert user
	void insertUser(UserBean user) throws SQLException;

	// Select user by id
//	UserBean selectUser(int id);
	UserBean selectUser(int id);

	// Select all users
	List<UserBean> selectAllUsers();

	// Delete user by id
//	boolean deleteUser(int id) throws SQLException;
	boolean deleteUser(int id) throws SQLException;

	// Update user by id
	boolean updateUser(UserBean user) throws SQLException;
}
