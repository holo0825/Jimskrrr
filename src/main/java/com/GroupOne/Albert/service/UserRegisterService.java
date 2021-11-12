package com.GroupOne.Albert.service;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;
import com.GroupOne.Albert.members.oldusers.UserBean;

// 買家註冊和賣家註冊的Service介面，裡面定義抽象方法給Service實作類別(RegisterServiceImpl.java)Override使用
// 此介面用來間接呼叫DAO介面RegisterDao.java做事，執行會員註冊功能

public interface UserRegisterService {

//	String registerUser(UserBean userBean);
	String registerUser(Member userBean);
}
