package com.GroupOne.Albert.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.SellerRegisterDao;
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.service.SellerRegisterService;

// 買家註冊和賣家註冊Service實作類別，實作RegisterService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

@Service @Transactional
public class SellerRegisterServiceImpl implements SellerRegisterService {

	SellerRegisterDao sellerRegisterDao;

	@Autowired
	public SellerRegisterServiceImpl(SellerRegisterDao sellerRegisterDao) {
		this.sellerRegisterDao = sellerRegisterDao;
	}
	
//	@Override
//	public String registerSeller(SellerBean sellerBean) {
//		return rDao.registerSeller(sellerBean);
//	}

	@Override
	public String registerSeller(SellerBean sellerBean) {
		if (sellerBean != null) {
			SellerBean sellerRecord = sellerRegisterDao.findByUsername(sellerBean.getUsername());
			if (sellerRecord == null) {
				sellerRegisterDao.save(sellerBean);
				return "賣家用戶註冊成功！";
			} else {
				return "賣家用戶註冊失敗，請再次確認"; // On failure, send a message from here.
			}

		}else {
			return "賣家用戶註冊失敗，請再次確認"; // On failure, send a message from here.
		}
	}
}
