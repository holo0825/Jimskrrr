package com.GroupOne.Albert.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.AdminBean;

// Admin登入登出專用DAO介面，裡面定義抽象方法給DAO實作類別(AdminLoginLogoutDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface AdminLoginRepository extends JpaRepository<Member, String>{
//public interface AdminLoginLogoutDao extends JpaRepository<AdminBean, String>{
	
//	@Query("Select * from AdminBean a where a.username = ?1 and a.password = ?2 and a.email =?3")
//	@Query(value = "Select * from ADMIN_LOGIN 	where username = :username and password = :password and email = :email", nativeQuery = true)
//	AdminBean checkLogin(String username, String password, String email);
	
	// 相當於寫 "Select * from AdminBean where username = :username and password = :password and email = :email"
//	AdminBean findByUsernameAndPasswordAndEmail(String username, String password, String email);
	Member findByUsernameAndPasswordAndEmail(String username, String password, String email);

	// 新增來給Spring Security的自訂AuthenticationSuccessHandler使用(AuthenticationSuccessWithSessionHandler.java)
	@Query("Select m from Member m where m.username = ?1 and m.password = ?2")
	Member findByUsernameAndPassword(String username, String password);
	
	// 新增來給Spring Security的自訂AuthenticationSuccessHandler使用(AuthenticationSuccessWithSessionHandler.java)
	Member findByUsername(String username);
}