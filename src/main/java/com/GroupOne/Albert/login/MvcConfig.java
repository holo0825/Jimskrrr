package com.GroupOne.Albert.login;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
	/*
	 * Configure simple automated controllers pre-configured with the responsestatus code 
	 * and/or a view to render the response body. 
	 * This is useful incases where there is no need for custom controller logic 
	 * -- e.g. render ahome page, perform simple site URL redirects, 
	 * return a 404 status withHTML content, a 204 with no content, and more.
	 * */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/403").setViewName("403");
		
//		registry.addViewController("/login").setViewName("login");
		
		registry.addViewController("/admin/home").setViewName("adminDash");
		registry.addViewController("/user/home").setViewName("userDash");
		registry.addViewController("/seller/home").setViewName("userDash");
		
		// 透過註冊告訴Spring一般會員註冊及商家會員註冊的頁面對應路徑和邏輯名稱
		registry.addViewController("/register").setViewName("__register_index");
//		registry.addViewController("/register/user").setViewName("__register_user");
//		registry.addViewController("/register/seller").setViewName("__register_seller");

//		registry.addViewController("/login/test").setViewName("__login");
		registry.addViewController("/login").setViewName("__login");

		
	}

//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/css/**")
//			.addResourceLocations("/WEB-INF/views/css/");
//		registry.addResourceHandler("/image/**")
//			.addResourceLocations("/WEB-INF/views/images/");
//		registry.addResourceHandler("/resources/**")
//		.addResourceLocations("/resources/");
//		
//	}
}
