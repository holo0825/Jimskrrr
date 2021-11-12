package com.GroupOne.Albert.login;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UrlPathHelper;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.MemberRole;
import com.GroupOne.Albert.service.AdminLoginService;
// 前面四個方法用來設定一個authentication provider，使用的是Spring Data JPA和Hibernate
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true) //開啟security註解
public class AdminWebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	//-------------------------------------------------
	@Autowired
	AdminLoginService adminLoginService;
	
	@Autowired
	ServletContext servletContext;
	//-------------------------------------------------
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	}
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService()); //注入Spring提供的UserDetailsService介面
		authProvider.setPasswordEncoder(passwordEncoder()); //注入Spring提供BCryptEncoder類別
		
		return authProvider; // 回傳一個DaoAuthenticationProvider物件
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
//		web.ignoring().antMatchers("/static/**, "/WEB-INF/views/**"");
		web.ignoring().antMatchers("/global/**");
	}
	
	
	// 最後的方法用來設定HTTP Security的驗證和授權機制(authentication and authorization)
	// 當使用者沒有足夠權限(permission)時，也可以自定義URL專門用來顯示權限不足的警告(access denied error)
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
//		http.sessionManagement()
//		.sessionCreationPolicy(SessionCreationPolicy.NEVER);
		http.authorizeRequests()
		.antMatchers("/seller/home").hasAuthority("ROLE_SELLER") // commented for testing
		.antMatchers("/user/**").hasAuthority("ROLE_USER") // commented for testing
		.antMatchers("/ajaxCheckUsername", "/js/**", "/css/**", "/resources/**", "/img/**", "/static/**", "/templates/**",
				"/WEB-INF/views/**", "/assets/**", "/", "/register/**", "/login", "/oauth/**","/**").permitAll() // used for testing
		.antMatchers("/admin/home", "/AdminHome", "/admin/UserAll/**", "/SellerAll/**").hasAuthority("ROLE_ADMIN") // commented for testing
		
		.anyRequest().authenticated()
//			.antMatchers("/login", "/oauth/**").permitAll() // commented for testing
			// Google OAuth2使用者自帶ROLE_USER
			
			
//			.antMatchers("/list").hasAnyAuthority("ROLE_USER", "USER", "CREATOR", "EDITOR", "ADMIN") // commented for testing
//            .antMatchers("/new").hasAnyAuthority("ADMIN", "CREATOR")
//            .antMatchers("/edit/**").hasAnyAuthority("ADMIN", "EDITOR")
//            .antMatchers("/delete/**").hasAuthority("ADMIN")
			.and()
			.formLogin()
				.loginPage("/login")
				.usernameParameter("username")
				.passwordParameter("password")
				.permitAll()
//				.defaultSuccessUrl("/list")
//				.loginProcessingUrl("/Adminlogin")
//				.successHandler(authenticationSuccessWithSessionHandler)
				.successHandler(new AuthenticationSuccessHandler() {
			         
			        @Override
			        public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			                Authentication authentication) throws IOException, ServletException {
			            // run custom logics upon successful login
			        	System.out.println("AuthenticationSuccessHandler invoked");
			        	System.out.println("Authentication name: " + authentication.getName());
			        	System.out.println("Authentication credentials: " + authentication.getCredentials());
			        	System.out.println("Authentication details: " + authentication.getDetails().toString());
			            System.out.println("Authentication name: " + authentication.getName());
			            //-----------------------------------------------------------------------------
			            System.out.println("request username: " + request.getParameter("username"));
			            System.out.println("request password: " + request.getParameter("password"));
			            //-----------------------------------------------------------------------------
			            MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
			            String username = myUserDetails.getUsername();
			            System.out.println("The user " + username + " has logged in.");
			            System.out.println("fullname: " + myUserDetails.getMember().getFullname()); 
			            System.out.println("password: " +myUserDetails.getMember().getPassword()); 
			            System.out.println("email: " + myUserDetails.getMember().getEmail()); 
			            MemberRole memberRole = myUserDetails.getMember().getMemberRole();
			            System.out.println("memberRole: " + memberRole); 
			            Member member = myUserDetails.getMember();
			            
//			    		Member member = adminLoginService.findByUsernameAndPassword(request.getParameter("username"), ""); 
//			    		Member member = adminLoginService.findByUsername(request.getParameter("username")); 
//			    		if (member!=null) {
//			    			request.getSession().setAttribute("admin", member);
//			    			request.getSession().setAttribute("password", request.getParameter("password"));
//			    			request.getSession().setAttribute("username", request.getParameter("username"));
//			    			System.out.println("admin added to session successfully");
//			    		}else {
//			    			System.out.println("admin failed to add to session");
//						}
			            System.out.println("requested session id" + request.getRequestedSessionId());
			            
			            UrlPathHelper helper = new UrlPathHelper();
			            String contextPath = helper.getContextPath(request);
			            switch (memberRole) {
						case ROLE_ADMIN:
							request.getSession().setAttribute("admin", member);
							response.sendRedirect(contextPath + "/admin/home");
							break;
						case ROLE_USER:
							request.getSession().setAttribute("user", member);
							response.sendRedirect(contextPath + "/user/home");
							break;
						case ROLE_SELLER:
							request.getSession().setAttribute("seller", member);
							response.sendRedirect(contextPath + "/seller/home");
							break;
						default:
							response.sendRedirect(contextPath + "/");
							break;
						}
			        }
			    })
				.failureUrl("/")
			.and()
			.oauth2Login()
				.loginPage("/login")
				.userInfoEndpoint()
					.userService(oauthUserService)
				.and()
				.successHandler(new AuthenticationSuccessHandler() {
					
					@Override
					public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
							Authentication authentication) throws IOException, ServletException {
						System.out.println("AuthenticationSuccessHandler invoked");
						System.out.println("Authentication name: " + authentication.getName());
						System.out.println("Authentication credentials: " + authentication.getCredentials());
						System.out.println("Authentication details: " + authentication.getDetails().toString());
						CustomOAuth2User oauthUser = (CustomOAuth2User) authentication.getPrincipal();
						
						// OAuth2登入使用者用email當作username，取得回傳的Member型態物件
						Member oauth2GoogleUser = userService.processOAuthPostLogin(oauthUser);
//						Member oauth2GoogleUser = userService.processOAuthPostLogin(oauthUser.getEmail());
						System.out.println("The OAuth2 User " + oauthUser.getName() + " | " + oauthUser.getEmail() + " has logged in.");
						// 將OAuth2登入的使用者資訊存入session
						request.getSession().setAttribute("user", oauth2GoogleUser);;
//						response.sendRedirect("/list");
//						response.sendRedirect("/UserHome");
						UrlPathHelper helper = new UrlPathHelper();
			            String contextPath = helper.getContextPath(request);
			            response.sendRedirect(contextPath + "/user/home");
			            
					}
				})
				//.defaultSuccessUrl("/list")
			.and()
			.logout().logoutSuccessUrl("/").deleteCookies("JSESSIONID").invalidateHttpSession(true).permitAll()
			.and()
			.exceptionHandling().accessDeniedPage("/403")
			;
	}
	
	@Autowired
	private CustomOAuth2UserService oauthUserService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationSuccessWithSessionHandler authenticationSuccessWithSessionHandler;
}
