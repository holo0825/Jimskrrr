package com.GroupOne.Albert.login;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.registration.ClientRegistration.ProviderDetails.UserInfoEndpoint;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
// 建立DefaultOAuth2UserService的子類別，override loadUser()方法，認證成功時回傳一個CustomOAuth2User物件
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService  {

	/*
	 * 一旦驗證成功，Spring OAuth2會呼叫loadUser()方法，並回傳一個Custome)Auth2User物件
	 * Returns an OAuth2User after obtaining the user attributes of the End-User from the UserInfo Endpoint.
	 * */
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2User user =  super.loadUser(userRequest);
		
		//--------------------------------------------------------------
		System.out.println("========================================");
		System.out.println(user.getName()); // i.e. 109939498552963078039，not meaningful
		System.out.println(user.getAuthorities().toString());
		System.out.println("name=" + user.getAttribute("name").toString()); // 取得Google使用者名稱
		System.out.println("picture=" + user.getAttribute("picture").toString()); 
		System.out.println("email=" + user.getAttribute("email").toString()); 
		System.out.println("email_verified=" + user.getAttribute("email_verified").toString()); 
		System.out.println("locale=" + user.getAttribute("locale").toString()); 
		System.out.println(user.getAttributes().toString());
		
//		user.getAuthorities().add(null);
//		SecurityContextHolder.getContext().setAuthentication(anAuthentication);
		System.out.println("========================================");
		//--------------------------------------------------------------

		System.out.println("CustomOAuth2UserService invoked");
		return new CustomOAuth2User(user); // 回傳OAuth2使用者物件
	}

}
