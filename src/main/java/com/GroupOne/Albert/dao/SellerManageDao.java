package com.GroupOne.Albert.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.model.UserBean;

// Admin管理Seller會員的DAO CRUD功能介面，裡面定義抽象方法給DAO實作類別(SellerManageDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface SellerManageDao extends JpaRepository<SellerBean, Integer>{

//	// Create or insert user
//	void insertSeller(SellerBean seller) throws SQLException;
//
//	// Select seller by id
//	SellerBean selectSeller(int id);
//
//	// Select all sellers
//	List<SellerBean> selectAllSellers();
//
//	// Delete seller by id
//	boolean deleteSeller(int id) throws SQLException;
//
//	// Update seller by id
//	boolean updateSeller(SellerBean seller) throws SQLException;

}