package com.GroupOne.Albert.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.dao.SellerManageRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.SellerBean;
import com.GroupOne.Albert.service.SellerManageService;

// Admin管理Seller會員Service實作類別，實作SellerManageService介面
// Hibernate老師有加@Transactional，但Spring老師沒有

@Service @Transactional
public class SellerManageServiceImpl implements SellerManageService {

	private SellerManageRepository sellerManageRepo;
	
	@Autowired
	public SellerManageServiceImpl(SellerManageRepository sellerManageRepo) {
		this.sellerManageRepo = sellerManageRepo;
	}

//	@Override
//	public void insertSeller(SellerBean seller) throws SQLException {
//		smDao.insertSeller(seller);
//	}
	@Override
	public void insertSeller(Member seller) throws SQLException {
//	public void insertSeller(SellerBean seller) throws SQLException {
		sellerManageRepo.save(seller);
	}

//	@Override
//	public SellerBean selectSeller(int id) {
//		return smDao.selectSeller(id);
//	}
	@Override
	public Member selectSeller(int id) {
//	public SellerBean selectSeller(int id) {
		return sellerManageRepo.findById(id).get();
	}

//	@Override
//	public List<SellerBean> selectAllSellers() {
//		return smDao.selectAllSellers();
//	}
	@Override
	public List<Member> selectAllSellers() {
//	public List<SellerBean> selectAllSellers() {
		return sellerManageRepo.findAll();
	}

//	@Override
//	public boolean deleteSeller(int id) throws SQLException {
//		return smDao.deleteSeller(id);
//	}
	@Override
	public boolean deleteSeller(int id) throws SQLException {
		if (selectSeller(id)!=null) {
			sellerManageRepo.deleteById(id);
			return true;
		}
		return false;
	}

//	@Override
//	public boolean updateSeller(SellerBean seller) throws SQLException {
//		return smDao.updateSeller(seller);
//	}
	@Override
	public boolean updateSeller(Member seller) throws SQLException {
//	public boolean updateSeller(SellerBean seller) throws SQLException {
		if (seller != null) {
			sellerManageRepo.save(seller);
			return true;
		}
		return false;
	}

}
