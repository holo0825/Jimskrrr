//package com.GroupOne.Albert.login;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//// 前面四個方法用來設定一個authentication provider，使用的是Spring Data JPA和Hibernate
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//	
//	@Bean
//	public UserDetailsService userDetailsService() {
//		return new UserDetailsServiceImpl();
//	}
//	
//	@Bean
//	public BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//	
//	@Bean
//	public DaoAuthenticationProvider authenticationProvider() {
//		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
//		authProvider.setUserDetailsService(userDetailsService()); //注入Spring提供的UserDetailsService介面
//		authProvider.setPasswordEncoder(passwordEncoder()); //注入Spring提供BCryptEncoder類別
//		
//		return authProvider; // 回傳一個DaoAuthenticationProvider物件
//	}
//
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.authenticationProvider(authenticationProvider());
//	}
//	// 最後的方法用來設定HTTP Security的驗證和授權機制(authentication and authorization)
//	// 當使用者沒有足夠權限(permission)時，也可以自定義URL專門用來顯示權限不足的警告(access denied error)
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests()
//			.antMatchers("/", "/login", "/oauth/**").permitAll() // used for testing
////			.anyRequest().authenticated()
////			.antMatchers("/login", "/oauth/**").permitAll() // commented for testing
//			// Google OAuth2使用者自帶ROLE_USER
//			.antMatchers("/list").hasAnyAuthority("ROLE_USER", "USER", "CREATOR", "EDITOR", "ADMIN") // commented for testing
//            .antMatchers("/new").hasAnyAuthority("ADMIN", "CREATOR")
//            .antMatchers("/edit/**").hasAnyAuthority("ADMIN", "EDITOR")
//            .antMatchers("/delete/**").hasAuthority("ADMIN")
//			.and()
//			.formLogin().permitAll()
//				.loginPage("/login")
//				.usernameParameter("email")
//				.passwordParameter("pass")
//				.defaultSuccessUrl("/list")
//			.and()
//			.oauth2Login()
//				.loginPage("/login")
//				.userInfoEndpoint()
//					.userService(oauthUserService)
//				.and()
//				.successHandler(new AuthenticationSuccessHandler() {
//					
//					@Override
//					public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//							Authentication authentication) throws IOException, ServletException {
//						System.out.println("AuthenticationSuccessHandler invoked");
//						System.out.println("Authentication name: " + authentication.getName());
//						CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();
//						
//						userService.processOAuthPostLogin(oauthUser.getEmail());
//						
//						response.sendRedirect("/list");
//					}
//				})
//				//.defaultSuccessUrl("/list")
//			.and()
//			.logout().logoutSuccessUrl("/").permitAll()
//			.and()
//			.exceptionHandling().accessDeniedPage("/403")
//			;
//	}
//	
//	@Autowired
//	private CustomOAuth2UserService oauthUserService;
//	
//	@Autowired
//	private UserService userService;
//}
