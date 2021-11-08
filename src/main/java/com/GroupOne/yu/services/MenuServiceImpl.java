package com.GroupOne.yu.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.yu.dao.MenuRepository;
import com.GroupOne.yu.model.MenuBean;

@Repository
@Transactional
public class MenuServiceImpl implements MenuService {
	MenuRepository menuRepository;

	@Autowired
	public MenuServiceImpl(MenuRepository menuRepository) {
		this.menuRepository = menuRepository;
	}

	// 查詢所有 
	@Override
	public List<MenuBean> findAll() {
		return menuRepository.findAll();
	}

	//更新資料 save
	@Override
	public void updateMenu(MenuBean menuBean) {
		menuRepository.save(menuBean);
	}
		
	//查詢單筆
	@Override
	public MenuBean findByProductName(String productName) {
	    return menuRepository.findByProductName(productName);
	  
	}	
	
	//新增菜色 save
	@Override
	public MenuBean addProduct(MenuBean menuBean) {
		return menuRepository.save(menuBean);
	}
	
	//刪除菜色
	@Override
	public void DeleteMenu(String productName) {
		menuRepository.deleteByProductName(productName);
	}

//	@Override
//	public void DeleteMenu(MenuBean menu) {
//		menuDao.DeleteMenu(menu);
//	}




}