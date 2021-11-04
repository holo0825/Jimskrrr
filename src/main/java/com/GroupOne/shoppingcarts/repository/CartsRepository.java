package com.GroupOne.shoppingcarts.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.shoppingcarts.model.CartsBean;

public interface CartsRepository extends JpaRepository<CartsBean, Integer>{

//	List<CartsBean> findAllCartByAdmin();//預計新增,尚未使用
	List<CartsBean> findByPaydayNotNull();
	
//	List<Object[]> findTwoAmountStatistics();
	@Query("select c.type,SUM(c.amount) from CartsBean c where c.payday is not null group by c.type")
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
	@Query(value = "update Cart set amount = ?1 , points = ?2 , payday = ?3 where username = ?4 and itemNo = ?5",nativeQuery = true)
	void updateAmountAndPointsAndPaydayByUsernameAndItemNO(int amount, float points,Date payday , String username, int itemNo);
	
//	boolean deleteCartByitemNo(CartsBean cartsBean);
//	void deleteById(int itemNo);
}
