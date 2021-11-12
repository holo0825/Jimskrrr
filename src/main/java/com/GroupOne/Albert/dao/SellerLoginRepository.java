package com.GroupOne.Albert.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;

// Seller登入登出專用DAO介面，裡面定義抽象方法給DAO實作類別(SellerLoginLogoutDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface SellerLoginRepository extends JpaRepository<Member, String>{
//public interface SellerLoginLogoutDao extends JpaRepository<SellerBean, String>{

//	@Query("Select s from SellerBean s where s.username = ?1 and s.password = ?2 and s.email =?3")
//	@Query(value = "Select * from SELLER_DETAILS where username = :username and password = :password and email = :email", nativeQuery = true)
//	SellerBean checkLogin(String username, String password, String email);

	// 相當於寫 "Select * from SellerBean where username = :username and password = :password and email = :email"
//	SellerBean findByUsernameAndPasswordAndEmail(String username, String password, String email);
	Member findByUsernameAndPasswordAndEmail(String username, String password, String email);
}