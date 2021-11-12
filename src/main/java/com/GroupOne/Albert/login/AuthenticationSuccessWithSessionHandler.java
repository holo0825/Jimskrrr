package com.GroupOne.Albert.login;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.MemberRole;
import com.GroupOne.Albert.service.AdminLoginService;

/*
 * In case the authentication success handler class needs to use another business class (a dependency) to perform the custom logics, 
 * we need to configure spring security differently.
 * First, create a separate handler class that extends SavedRequestAwareAuthenticationSuccessHandler class
 * 
 * Here, the @Component annotation is used 
 * so its instances will be managed by Spring framework and injectable into other components if needed. 
 * And as you can see, this handler depends on AdminLoginService class to perform the custom logics in the callback method onAuthenticationSuccess()
 * */
// 自訂AuthenticationSuccessHandler，用來儲存代表使用者的Bean物件或Username和password在session中，提供在其他microservices使用
@Component
public class AuthenticationSuccessWithSessionHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	
	AdminLoginService adminLoginService;

	@Autowired
	public AuthenticationSuccessWithSessionHandler(AdminLoginService adminLoginService) {
		this.adminLoginService = adminLoginService;
	}
	

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
//		super.onAuthenticationSuccess(request, response, authentication);
		MyUserDetails myUserDetails = (MyUserDetails)authentication.getPrincipal();
		String username = myUserDetails.getUsername();
		System.out.println("==================");
		System.out.println(username);
		System.out.println("==================");
		
		Member admin = adminLoginService.findByUsernameAndPassword(request.getParameter(USERNAME), request.getParameter(PASSWORD));
		if (admin!=null) {
			request.getSession().setAttribute("admin", admin);
			request.getSession().setAttribute(PASSWORD, request.getParameter(PASSWORD));
			request.getSession().setAttribute(USERNAME, request.getParameter(USERNAME));
			System.out.println("admin added to session successfully");
		}
		System.out.println("admin failed to add to session");

//		MyUserDetails memberDetails = (MyUserDetails) authentication.getPrincipal();
//		Member admin1 = memberDetails.getMember();
//         
//        if (customer.isOTPRequired()) {
//            customerService.clearOTP(customer);
//        }
        // this handler depends on CustomerService class to perform the custom logics in the callback method onAuthenticationSuccess(). 
        super.onAuthenticationSuccess(request, response, authentication); 
		//-------------------------------------------------------
//		request.getUserPrincipal();
//		request.changeSessionId();
//		request.getRequestedSessionId();
//		request.getAuthType();
//		request.getContextPath();
//		request.getHeaderNames();
//		request.authenticate(response);
//		request.getHttpServletMapping();
//		request.getInputStream();
//		request.getLocalAddr();
//		request.getLocalName();
//		request.getLocalPort();
//		request.getLocale();
		//-------------------------------------------------------
//		request.login(USERNAME, PASSWORD);
//		request.logout();
		//-------------------------------------------------------
//		request.isUserInRole(MemberRole.ROLE_ADMIN.toString());
//		request.isSecure(); //checks if this request was made using a securechannel, such as HTTPS.
//		request.isRequestedSessionIdValid();
//		request.isRequestedSessionIdFromCookie();
//		request.getUserPrincipal();
//		request.getServletPath();
//		request.getServletContext();
//		request.getServerPort();
//		request.getServerName();
//		request.getHttpServletMapping();
//		request.getScheme();
//		request.getRequestURL();
//		request.getRequestURI();
		//-------------------------------------------------------
//		request.getRemoteUser();
//		request.getRemotePort();
//		request.getRemoteHost();
//		request.getRemoteAddr();
		//-------------------------------------------------------
//		request.getQueryString();
//		request.getProtocol();
//		request.getPathTranslated();
//		request.getReader();
//		request.getMethod();
//		request.getDateHeader(getDefaultTargetUrl());
//		request.getDateHeader(getTargetUrlParameter());
//		request.getCookies();
//		request.getContentType();
//		request.getContentLengthLong();
//		request.getContentLength();
//		request.getCharacterEncoding();
//		request.getPathInfo();
		//-------------------------------------------------------
	}
	
}
