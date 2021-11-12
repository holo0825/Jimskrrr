package com.GroupOne.Albert.ajax.service;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GroupOne.Albert.ajax.dto.MemberDto;
//import com.GroupOne.Albert.ajax.entity.Users;
import com.GroupOne.Albert.ajax.repository.UsernameCheckRepository;
import com.GroupOne.Albert.ajax.utils.EntityToDtoConverter;
import com.GroupOne.Albert.members.Member;
// The service class is responsible for performing business logic
@Service
public class UsernameCheckService {

	private static Logger log = LoggerFactory.getLogger(UsernameCheckService.class);
	
	@Autowired
	private UsernameCheckRepository userRepository;

//	public UserDto getUserByUserName(final String userName) {
	public MemberDto getUserByUsername(final String username) {
		
//		Optional<Users> user = userRepository.findUserByUserName(userName);
		Optional<Member> member = userRepository.findUserByUsername(username);
		
		// when user exists, return DTO version of Users entity
//		if (user.isPresent()) {
//			return EntityToDtoConverter.convertUserEntityToDto(user.get());
//		}
		if (member.isPresent()) {
			return EntityToDtoConverter.convertUserEntityToDto(member.get());
		}
		// when user not found, throw exception on purpose
		throw new RuntimeException("No user available for the given user name");
		
	}

}
