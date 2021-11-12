package com.GroupOne.Albert.registration.service;

import com.GroupOne.Albert.members.Member;

public interface MemberService {
	boolean existsById(String id);
	
//	void save(MemberBean mb);
	void save(Member mb);
	
//	void checkUnpaidAmount(OrderBean ob);
	
//	MemberBean findByMemberId(String id);
	Member findByUsername(String username);
	
//	MemberBean findByMemberIdAndPassword(String memberId, String password) ;
	Member findByUsernameAndPassword(String username, String password) ;
}
