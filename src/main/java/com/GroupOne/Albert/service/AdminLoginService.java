package com.GroupOne.Albert.service;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.AdminBean;

// Admin登入登出的Service介面，裡面定義抽象方法給Service實作類別(AdminLoginLogoutServiceImpl.java)Override使用
// 此介面用來間接呼叫DAO介面AdminLoginLogoutDao.java做事，執行CRUD功能

public interface AdminLoginService {

//	AdminBean checkLogin(String username, String password, String email);

//	AdminBean findByUsernameAndPasswordAndEmail(String username, String password, String email);
	Member findByUsernameAndPasswordAndEmail(String username, String password, String email);
	
	// 新增來給Spring Security的自訂AuthenticationSuccessHandler使用(AuthenticationSuccessWithSessionHandler.java)
	Member findByUsernameAndPassword(String username, String password);

	// 新增來給Spring Security的自訂AuthenticationSuccessHandler使用(AuthenticationSuccessWithSessionHandler.java)
	Member findByUsername(String parameter);
}
