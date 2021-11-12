package com.GroupOne.Albert.registration.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.registration.repository.RegisterMemberRepository;

//import _00_init.util.GlobalService;
import com.GroupOne.Albert.registration.service.MemberService;
@Service
public class MemberServiceImpl implements MemberService {
	private static Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	RegisterMemberRepository registerMemberRepo;
	
//	SessionFactory factory;
	@Autowired
	public MemberServiceImpl(RegisterMemberRepository memberDao) {
		this.registerMemberRepo = memberDao;
//		this.factory = factory;
	}
	
//	public MemberServiceImpl(MemberDao memberDao) {
//		this.memberDao = memberDao;
//		this.factory = HibernateUtils.getSessionFactory();
//	}
	@Transactional
	@Override
	public void save(Member mb) {
//	public void save(MemberBean mb) {
		log.info("會員註冊功能之Service: 儲存會員資料");
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			registerMemberRepo.save(mb);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)  
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
	}
	@Transactional
	@Override
	public boolean existsById(String id) {
		log.info("會員註冊功能之Service: 檢查會員輸入的編號是否已被使用");
		boolean exist = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			exist = registerMemberRepo.existsById(id);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)  
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return exist;
	}
	@Transactional
	@Override
	public Member findByUsername(String username) {
//	public MemberBean findByMemberId(String id) {
		log.info("會員註冊功能之Service: 由會員編號找出對應的會員");
//		MemberBean mb = null;
		Member mb = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			mb = registerMemberRepo.findByUsername(username);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null) 
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}

	/*
	 * 功能：檢查客戶的未付款訂購金額。 說明：處理客戶訂單時，[訂單的總金額 + 該客戶的未付款餘額]不能超過限額， 此限額定義在
	 * GlobalService類別的常數: ORDER_AMOUNT_LIMIT 步驟： 1. 取出 OrderBean 內的訂單的總金額 1.
	 * 取出Member表格內的 Member#unpaid_amount欄位(未付款餘額) 2.
	 * unpaid_amount加上本訂單的總金額後，檢查該數值是否超過限額 (GlobalService.ORDER_AMOUNT_LIMIT)。
	 * 如果超過限額， 則 該訂單不予處裡， 丟出UnpaidOrderAmountExceedingException，
	 * 否則呼叫memberDao#updateUnpaidAmount(ob)：執行更新Member表格的 unpaid_amount欄位:
	 * Member#unpaid_amount += currentAmount;
	 */
//	@Transactional
//	@Override
//	public void checkUnpaidAmount(OrderBean ob) {
//		log.info("處理訂單之Service: 由會員編號找出對應的會員，計算新的未付款餘額");
////		Session session = factory.getCurrentSession();
////		Transaction tx = null;
////		try {
////			tx = session.beginTransaction();
//			double currentAmount = ob.getTotalAmount(); // 取出該訂單的總金額
//			double unpaidAmount = findByMemberId(ob.getMemberId()).getUnpaid_amount();
//			if (currentAmount + unpaidAmount > GlobalService.ORDER_AMOUNT_LIMIT) {
//				log.info("處理訂單之Service: 未付款金額超過限額: " + (currentAmount + unpaidAmount));
//				throw new UnpaidOrderAmountExceedingException("未付款金額超過限額: " 
//							+ (currentAmount + unpaidAmount));
//			} 
//			log.info("處理訂單之Service: 未付款金額並未超過限額，立即呼叫memberDao更新會員的未付款餘額");
//			memberDao.updateUnpaidAmount(ob);
////			tx.commit();
////		} catch (Exception ex) {
////			if (tx != null)
////				tx.rollback();
////			ex.printStackTrace();
////			throw new RuntimeException(ex);
////		}
//	}
	
	@Transactional	
	@Override
	public Member findByUsernameAndPassword(String username, String password) {
//	public MemberBean findByMemberIdAndPassword(String memberId, String password) {
//		Session session = factory.getCurrentSession();
//		MemberBean mb = null;
		Member mb = null;
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			mb = registerMemberRepo.findByUsernameAndPassword(username, password);
	    	log.info("會員登入功能之Service: 檢查帳號/密碼結果:" 
					+ (mb == null? "帳號/密碼正確" : "帳號/密碼錯誤"));
//	    	tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}

}
