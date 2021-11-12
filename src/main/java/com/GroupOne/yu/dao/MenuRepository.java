package com.GroupOne.yu.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;

@Repository 
public interface MenuRepository 
					extends JpaRepository<MenuBean, Integer> {

	//管理員&賣家&買家 查詢所有菜色	
	//List<MenuBean> findAll();	
	
	//賣家&消費者 查詢單筆菜色
	MenuBean findByProductName(String productName);
	//Optional<MenuBean> findByProduct(String productName);
	//MenuBean findById(Integer id);
	
	//買家 根據單一餐廳查詢菜單
	MenuBean findByRstName(String rstName);	
	
	//被下架的就不會是空的，所以只會顯示空的出來
	List<MenuBean> findByRstNameAndOffshelfIsNull(String rstName);

	//賣家 刪除菜色 
	void deleteByProductName(String productName);
	
	//賣家 更新菜單
	//void save(MenuBean menuBean, MultipartFile dishImage);
//	@Modifying
//	@Query(value="Update menu set offshelf=?1 where rstName=?2 and productName=?3", nativeQuery=true)
//	void updateMenu(MenuBean menuBean);
	
	//管理員 強迫下架菜色 (更新一個欄位，避免全部強制更新)
	@Modifying
	@Query(value="Update menu set offshelf=?1 where rstName=?2 and productName=?3", nativeQuery=true)
	//想要如何再SQL做更新就如何寫
	void updateMenuByAdmin(String offshelf, String rstName, String productName);
	
	//買家 新增&修改 存照片
	//void addPicture(MenuBean menuBean);
		
	//賣家 新增菜色
	//MenuBean save(MenuBean menuBean, MultipartFile coverImage);	
	
	
}

