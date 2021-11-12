//package com.GroupOne.Albert.security.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
//
//import com.GroupOne.Albert.members.MemberService;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
//
////	@Autowired
////	private UserService userService;
//	private MemberService memberService;
//	private final BCryptPasswordEncoder bCryptPasswordEncoder;
//	
//	@Autowired
//	public SecurityConfiguration(MemberService memberService, BCryptPasswordEncoder bCryptPasswordEncoder) {
//		this.memberService = memberService;
//		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
//	}
//
////	@Bean
////    public BCryptPasswordEncoder passwordEncoder() {
////        return new BCryptPasswordEncoder();
////    }
//	
//	@Bean
//    public DaoAuthenticationProvider authenticationProvider() {
//        DaoAuthenticationProvider provider = 
//        		new DaoAuthenticationProvider();
////        provider.setUserDetailsService(userService);
//        provider.setUserDetailsService(memberService);
////        provider.setPasswordEncoder(passwordEncoder());
//        provider.setPasswordEncoder(bCryptPasswordEncoder);
//        return provider;
//    }
//	
//	@Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.authenticationProvider(authenticationProvider());
//    }
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
////		http.httpBasic().disable();
//		http
//		.csrf().disable() // added for testing
//		.authorizeRequests().antMatchers(
//				"/",
//				 "/registration**",
//	                "/js/**",
//	                "/css/**",
//	                "/img/**").permitAll()
//		.anyRequest().authenticated()
//		.and()
//		.formLogin()
//		.loginPage("/login")
//		.permitAll()
//		.and()
//		.logout()
//		.invalidateHttpSession(true)
//		.clearAuthentication(true)
//		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//		.logoutSuccessUrl("/login?logout")
//		.permitAll();
//	}
//
//}
