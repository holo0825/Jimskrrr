package com.GroupOne.Albert.service;

import java.sql.SQLException;
import java.util.List;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;

// Admin管理Seller會員的Service介面，裡面定義抽象方法給Service實作類別(SellerManageServiceImpl.java)Override使用
// 此介面用來間接呼叫DAO介面SellerManageDao.java做事，執行CRUD功能

public interface SellerManageService {

	// Create or insert user
//	void insertSeller(SellerBean seller) throws SQLException;
	void insertSeller(Member seller) throws SQLException;

	// Select seller by id
//	SellerBean selectSeller(int id);
	Member selectSeller(int id);

	// Select all sellers
//	List<SellerBean> selectAllSellers();
	List<Member> selectAllSellers();

	// Delete seller by id
	boolean deleteSeller(int id) throws SQLException;

	// Update seller by id
//	boolean updateSeller(SellerBean seller) throws SQLException;
	boolean updateSeller(Member seller) throws SQLException;
	
}
