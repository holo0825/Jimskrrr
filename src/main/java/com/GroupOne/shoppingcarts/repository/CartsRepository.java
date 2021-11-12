package com.GroupOne.shoppingcarts.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.shoppingcarts.model.CartsBean;

public interface CartsRepository extends JpaRepository<CartsBean, Integer>{

	CartsBean findByItemNo(int itemNo);
	
//	List<CartsBean> findAllCartByAdmin();
	List<CartsBean> findByPaydayNotNull();
	
//	List<Object[]> findTwoAmountStatistics();
	@Query("select c.type,SUM(c.amount) from CartsBean c where c.payday is not null and (c.refund != '已退款' or c.refund is null) group by c.type")
	List<Object[]> findTwoAmountStatistics();
	
//	List<CartsBean> findTwoCart(String username);
	List<CartsBean> findByUsernameAndPaydayIsNullAndWrongIsNull(String username);
	
//	List<CartsBean> findAllCartByUsername(String username);
	List<CartsBean> findByUsernameAndPaydayNotNull(String username);
	
//	CartsBean findByUsername(String username, String type);
	CartsBean findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(String username,String type);
	
//	void insertCart(CartsBean cartsBean);
	
	
//	void updateByUsername(int amount, float points,Date payday , String username, int itemNo);
	@Modifying
	@Query(value = "update Cart set amount = ?1 , points = ?2 , payday = ?3 , discount = ?4 , disAmount = ?5 , transactionalNum =?6 where username = ?7 and itemNo = ?8",nativeQuery = true)
	void updateAmountAndPointsAndPaydayByUsernameAndItemNo(int amount, float points,Date payday, int dicount, int disAmount, String transactionalNum, String username, int itemNo);
	
//	boolean deleteCartByitemNo(CartsBean cartsBean);
//	void deleteById(int itemNo);
	
	@Modifying
	@Query("update CartsBean c set c.refund = ?1 where c.itemNo = ?2")
	void updateRefundByItemNo(String refund,int itemNo);
}
