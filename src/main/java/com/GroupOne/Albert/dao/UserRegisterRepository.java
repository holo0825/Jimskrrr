package com.GroupOne.Albert.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;
import com.GroupOne.Albert.members.oldusers.UserBean;

// 買家註冊和賣家註冊專用DAO介面，裡面定義抽象方法給DAO實作類別(RegisterDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface UserRegisterRepository extends JpaRepository<Member, Integer>{
//public interface UserRegisterDao extends JpaRepository<UserBean, Integer>{

//	String registerUser(UserBean userBean);

//	UserBean findByUsername(String username);
	// find a member by username, used for AJAX+jQuery to check username availability instantly
	Member findByUsername(String username);
}