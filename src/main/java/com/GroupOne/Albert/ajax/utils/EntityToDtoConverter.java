package com.GroupOne.Albert.ajax.utils;

import com.GroupOne.Albert.ajax.dto.MemberDto;
import com.GroupOne.Albert.members.Member;
//import com.GroupOne.Albert.ajax.entity.Users;

// Class to convert Users entity to DTO version because you should never expose the entity class to clients or end users
public final class EntityToDtoConverter {

	private EntityToDtoConverter() {
	}

//	public static UserDto convertUserEntityToDto(final Users user) {
//		return new UserDto(user.getId(), user.getUserName());
//	}
	public static MemberDto convertUserEntityToDto(final Member member) {
		return new MemberDto(member.getId(), member.getUsername());
	}

}
