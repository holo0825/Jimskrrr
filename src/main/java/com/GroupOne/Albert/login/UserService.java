package com.GroupOne.Albert.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GroupOne.Albert.OAuth2.Provider;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.MemberRole;
// Google OAuth2 專用
@Service
public class UserService {

	@Autowired
	private UserRepository repo;
	// 這裡接收OAuth2登入者的email作為username使用
	public Member processOAuthPostLogin(CustomOAuth2User oauthUser) {
//	public Member processOAuthPostLogin(String username) {
//	public void processOAuthPostLogin(String username) {
		// OAuth2使用者用email當作username，所有查詢時用email作為username
//		User existUser = repo.getUserByUsername(username);
//		Member existUser = repo.getMemberByUsername(username);
		String username = oauthUser.getEmail();
		Member existUser = repo.getMemberByUsername(username);
		
		if (existUser == null) {
//			User newUser = new User();
			Member newUser = new Member();
			// OAuth2使用者的username和email一模一樣
			newUser.setUsername(username);
			newUser.setEmail(username);
			// 取得OAuth2使用者的姓名並存入資料庫
			newUser.setFullname(oauthUser.getName());
//			newUser.setPassword(existUser.getPassword());
			newUser.setProvider(Provider.GOOGLE);
			newUser.setEnabled(true);
			// 在資料庫MEMBER_ROLE欄位新增ROLE_USER字串名稱，代表使用者的權限角色
			newUser.setMemberRole(MemberRole.ROLE_USER);
			newUser.setBonusPoint((float) 0.0);
			//--------------------------------------------------------------
			System.out.println("#####################################");
			System.out.println("New OAuth User Username: " + newUser.getUsername());
			System.out.println("New OAuth User Provider: " + newUser.getProvider());
			System.out.println("New OAuth User MemberRole: " + newUser.getMemberRole());
			System.out.println("#####################################");
			//--------------------------------------------------------------
			// 將OAuth2使用者資料存進SQL資料庫
			repo.save(newUser);
			
			System.out.println("Created new user: " + username);
			// 新增回傳OAuth2的Member型態物件，並且存在session，提供系統其他服務取得使用者資訊
			return repo.getMemberByUsername(username);
		}
		// 如果OAuth2使用者已經存在，回傳該使用者的Member型態物件，並且存在session以供他他服務取得使用者資訊
		return existUser;
		
	}
	
}
