package com.GroupOne.Albert.ajax.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.Albert.members.Member;
//import com.GroupOne.Albert.ajax.entity.Users;

public interface UsernameCheckRepository extends JpaRepository<Member, Integer> {
//public interface UserRepository extends JpaRepository<Users, Integer> {

//	Optional<Users> findUserByUserName(final String userName);
	Optional<Member> findUserByUsername(final String username);

}
