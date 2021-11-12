package com.GroupOne.Albert.login;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.MemberRole;
// Spring Security必須要實作UserDetails介面才能取得已驗證的使用者資訊，所以下建立UserDetails的子介面
public class MyUserDetails implements UserDetails {

//	private User user;
	private Member member;
	
//	public MyUserDetails(User user) {
//		this.user = user;
//	}
	public MyUserDetails(Member member) {
		this.member = member;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
//		Set<Role> roles = user.getRoles(); //取得目前使用者的所有權限角色
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		// 從roles Table取得該使用者所有role，並且一一加入List<SimpleGrantedAuthority>
//		for (Role role : roles) {
//			authorities.add(new SimpleGrantedAuthority(role.getName()));
//		}
		
		//---------------------------------------------------------------------
//		authorities.add(new SimpleGrantedAuthority("ROLE_EDITOR")); // manually add role
//		authorities.add(new SimpleGrantedAuthority("EDITOR")); // manually add role
		
		switch (member.getMemberRole()) {
		case ROLE_ADMIN:
			System.out.println("added ROLE_ADMIN");
			authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN")); // manually add role			
			break;
		case ROLE_SELLER:
			System.out.println("added ROLE_SELLER");
			authorities.add(new SimpleGrantedAuthority("ROLE_SELLER")); // manually add role			
			break;
		case ROLE_USER:
			System.out.println("added ROLE_USER");
			authorities.add(new SimpleGrantedAuthority("ROLE_USER")); // manually add role			
			break;
		default:
			System.out.println("added no roles");
			break;
		}
//		if (user.getUsername().equals("patrick")) {
//			authorities.add(new SimpleGrantedAuthority("ADMIN")); // manually add role
//		}
		// check authority
		//---------------------------------------------------------------------
		System.out.println("************************************************");
		System.out.println(authorities.toString());
		System.out.println("************************************************");
		//---------------------------------------------------------------------
		return authorities; // 回傳裝著多個role的Set，給Spring Security做驗證使用
	}

	@Override
	public String getPassword() {
		return member.getPassword();
	}

	@Override
	public String getUsername() {
		return member.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
//		return member.getEnabled();
		return true;
	}

	//------------------------------------------------------
	// 用來測試AuthenticationSuccessWithSessionHandler使用的方法
	public Member getMember() {
		return member;
	}
	//------------------------------------------------------
}
