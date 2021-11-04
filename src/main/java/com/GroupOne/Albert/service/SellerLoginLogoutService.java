package com.GroupOne.Albert.service;

import com.GroupOne.Albert.model.SellerBean;

// Seller登入登出的Service介面，裡面定義抽象方法給Service實作類別(SellerLoginLogoutServiceImpl.java)Override使用
// 此介面用來間接呼叫DAO介面SellerLoginLogoutDao.java做事，執行CRUD功能

public interface SellerLoginLogoutService {
	
//	SellerBean checkLogin(String username, String password, String email);

	SellerBean findByUsernameAndPasswordAndEmail(String username, String password, String email);

}
