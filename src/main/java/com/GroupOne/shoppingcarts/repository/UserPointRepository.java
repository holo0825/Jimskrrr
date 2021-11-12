package com.GroupOne.shoppingcarts.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.GroupOne.Albert.members.Member;


public interface UserPointRepository extends JpaRepository<Member, Integer>{

	Member findByUsername(String username);
	
	@Modifying
	@Query("update UserBean u set u.bonusPoint = ?1 where u.username = ?2")
	void updatePointByUsername(float point,String username);
}
