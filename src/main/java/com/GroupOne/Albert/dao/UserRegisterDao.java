package com.GroupOne.Albert.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.model.UserBean;

// 買家註冊和賣家註冊專用DAO介面，裡面定義抽象方法給DAO實作類別(RegisterDaoImpl.java)Override使用
// Spring框架中建議對介面寫程式，所以改成呼叫介面，代替直接new物件呼叫。

public interface UserRegisterDao extends JpaRepository<UserBean, Integer>{

//	String registerUser(UserBean userBean);

}