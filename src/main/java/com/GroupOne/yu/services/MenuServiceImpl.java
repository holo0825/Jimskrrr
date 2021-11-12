package com.GroupOne.yu.services;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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

	//管理員&賣家&買家 查詢所有 
	@Override
	public List<MenuBean> findAll() {
		return menuRepository.findAll();
	}

	//賣家 更新資料 save
	@Override
	public void updateMenu(MenuBean menuBean) {
		menuRepository.save(menuBean);
	}
	
	
	//管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
		@Override
		public void updateMenuByAdmin(String offshelf,String rstName, String productName) {
			menuRepository.updateMenuByAdmin(offshelf, rstName, productName);
			//menuRepository.flush();
		}
		
	//賣家&消費者 查詢單筆
	@Override
	public MenuBean findByProductName(String productName) {
	    return menuRepository.findByProductName(productName);
	  
	}
	
	//買家根據餐廳查詢菜單
	@Override
	public List<MenuBean> findByRstName(String rstName){
		return menuRepository.findByRstNameAndOffshelfIsNull(rstName);
		
	}
	
	//賣家 新增菜色 save
	@Override
	public MenuBean addProduct(MenuBean menuBean) {
		try {
			menuBean.setDishImage(menuBean.getCoverImage().getBytes());
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		return menuRepository.save(menuBean);
	}

	//賣家 新增
//		@Override
//		public void addProducts(MenuBean menuBean, MultipartFile coverImage) {
//			//將圖片變成SQL可以存取的檔案字串名
//			StringBuilder styleStr = new StringBuilder("");
//			for(String productName:menuBean.getProductName()) {
//				styleStr.append(productName).append(",");
//			}
//			if(styleStr.length() != 0)
//				menuBean.setId(styleStr.deleteCharAt(styleStr.length()-1).toString());
//			try {
//				menuBean.setDishImage(coverImage.getBytes());
//				//變成byte檔
//			} catch (IOException e) {
//				e.printStackTrace();
//			}		
//			menuRepository.save(menuBean);//存照片進去囉
//		}
	
	
	//賣家 刪除菜色
	@Override
	public void deleteByProductName(String productName) {
		menuRepository.deleteByProductName(productName);
	}




}