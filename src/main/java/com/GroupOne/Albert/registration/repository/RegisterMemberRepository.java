package com.GroupOne.Albert.registration.repository;

import java.sql.Connection;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.Albert.members.Member;


public interface RegisterMemberRepository extends JpaRepository<Member, Integer>{
	
	boolean existsById(String id);
	
//	void save(MemberBean mb) ;
//	void save(Member mb);
	
//	MemberBean findByMemberId(String id);
	Member findByUsername(String username);
	
//	MemberBean findByMemberIdAndPassword(String memberId, String password);	
	Member findByUsernameAndPassword(String username, String password);	
	
//	void updateUnpaidAmount(OrderBean ob);

//	void setConnection(Connection con);
}