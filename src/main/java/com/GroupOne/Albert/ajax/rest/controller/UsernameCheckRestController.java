package com.GroupOne.Albert.ajax.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.GroupOne.Albert.ajax.dto.MemberDto;
import com.GroupOne.Albert.ajax.dto.UsernameInput;
import com.GroupOne.Albert.ajax.service.UsernameCheckService;

@RestController
public class UsernameCheckRestController {

	@Autowired
	private UsernameCheckService userService;

	@PostMapping("/ajaxCheckUsername")
	public ResponseEntity<MemberDto> getUserByUserName(@RequestBody UsernameInput userInput) {
//		UserDto userDto = userService.getUserByUserName(userInput.getUserName());
		MemberDto userDto = userService.getUserByUsername(userInput.getUsername());

		return new ResponseEntity<MemberDto>(userDto, HttpStatus.OK);
	}

}
