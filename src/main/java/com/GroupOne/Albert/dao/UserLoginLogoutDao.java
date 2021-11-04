package com.GroupOne.Albert.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.Albert.model.UserBean;

// User登入登出專用DAO介面，裡面定義抽象方法給DAO實作類別(UserLoginLogoutDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface UserLoginLogoutDao extends JpaRepository<UserBean, Integer>{
	
//	@Query("from UserBean u where u.username = ?1 and u.password = ?2 and u.email =?3")
//	@Query(value = "Select * from USER_DETAILS where username = :username and password = :password and email = :email", nativeQuery = true)
//	UserBean checkLogin(String username, String password, String email);
	
	// 相當於寫 "Select * from AdminBean where username = :username and password = :password and email = :email"
	UserBean findByUsernameAndPasswordAndEmail(String username, String password, String email);

}