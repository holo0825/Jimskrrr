package com.GroupOne.Albert.service;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.UserBean;

// User登入登出的Service介面，裡面定義抽象方法給Service實作類別(UserLoginLogoutServiceImpl.java)Override使用
// 此介面用來間接呼叫DAO介面UserLoginLogoutDao.java做事，執行CRUD功能

public interface UserLoginService {

//	UserBean checkLogin(String username, String password, String email);

//	UserBean findByUsernameAndPasswordAndEmail(String username, String password, String email);
	Member findByUsernameAndPasswordAndEmail(String username, String password, String email);
}
