package com.GroupOne.Albert.login;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;
// 實作Spring OAuth2提供的OAuth2User介面
public class CustomOAuth2User implements OAuth2User {

	/*org.springframework.security.oauth2.core.user.OAuth2User
	 * A representation of a user Principal that is registered with an OAuth 2.0 Provider.
	 * */
	private OAuth2User oauth2User;
	
	public CustomOAuth2User(OAuth2User oauth2User) {
		this.oauth2User = oauth2User;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return oauth2User.getAttributes();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return oauth2User.getAuthorities();
	}
	// override getName()方法，取得使用者名稱
	@Override
	public String getName() {	
		return oauth2User.getAttribute("name");
	}
	// 自己寫getter方法取得使用者的email
	public String getEmail() {
		return oauth2User.<String>getAttribute("email");		
	}
//---------------------------------------------------------------------------
	public String getPicture() {
		return oauth2User.<String>getAttribute("picture");		
	}

	public String getEmailVerified() {
		return oauth2User.<String>getAttribute("email_verified");		
	}

	public String getLocale() {
		return oauth2User.<String>getAttribute("locale");		
	}
//---------------------------------------------------------------------------
}
