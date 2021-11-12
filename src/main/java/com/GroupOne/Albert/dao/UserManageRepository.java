package com.GroupOne.Albert.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.UserBean;

// Admin管理User會員的DAO CRUD功能介面，裡面定義抽象方法給DAO實作類別(UserManageDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface UserManageRepository extends JpaRepository<Member, Integer>{
//public interface UserManageDao extends JpaRepository<UserBean, Integer>{

//	// Create or insert user
//	void insertUser(UserBean user) throws SQLException;
//
//	// Select user by id
//	UserBean selectUser(int id);
//
//	// Select all users
//	List<UserBean> selectAllUsers();
//
//	// Delete user by id
//	boolean deleteUser(int id) throws SQLException;
//
//	// Update user by id
//	boolean updateUser(UserBean user) throws SQLException;

}