package com.GroupOne.Albert.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.GroupOne.Albert.members.Member;
// 實作Spring Security定義的UserDetailsService介面
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	// 運用loadUserByUsername方法()，產生UserRepository介面的實例，在驗證使用者時由Spring Security觸發
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
//		User user = userRepository.getUserByUsername(username);
		Member member = userRepository.getMemberByUsername(username);
//		if (user == null) {
		if (member == null) {
			throw new UsernameNotFoundException("Could not find user");
		}
		
//		return new MyUserDetails(user);
		return new MyUserDetails(member);
	}

}
