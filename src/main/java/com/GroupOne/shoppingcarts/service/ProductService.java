package com.GroupOne.shoppingcarts.service;

import java.util.Date;
import java.util.List;

import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.model.ListBean;

public interface ProductService {

	// Carts
	List<CartsBean> findByPaydayNotNull();

	List<Object[]> findTwoAmountStatistics();

	List<CartsBean> findByUsernameAndPaydayIsNullAndWrongIsNull(String username);

	List<CartsBean> findByUsernameAndPaydayNotNull(String username);

	CartsBean findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(String username, String type);

	void saveCart(CartsBean cartsBean);

	void updateAmountAndPointsAndPaydayByUsernameAndItemNO(int amount, float points, Date payday, String username,
			int itemNo);

	void deleteCartByItemNo(int itemNo);

	// List
	List<Object[]> findListAmountStatistics();

	List<ListBean> findByItemNo(int itemNo);

	boolean findByItemNoAndProductName(int itemNo, String productName);

	void saveList(ListBean listBean);

	void updateNumberByItemNoAndProductName(int number, int itemNo, String productNmae);

	void updateNumberAndExistByItemNoAndProductName(int number, String exist, int itemNo, String productNmae);

	void deleteListByItemNo(int itemNO);

	// User point
//	float findByUsernametoCart(String username);
//
//	void updatePointByUsernametoCart(float point, String username);

}
