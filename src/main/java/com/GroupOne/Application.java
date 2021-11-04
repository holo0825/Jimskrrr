package com.GroupOne;

import javax.servlet.Filter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import org.springframework.web.filter.CharacterEncodingFilter;

import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);

	}

	// 必須要定義HiddenHttpMethodFilter才能將前端表單送出的POST請求轉換成PUT、DELET、PATCH請求
//	@Bean
//	FilterRegistrationBean<Filter> hiddenHttpMethodFilter() {
//		FilterRegistrationBean<Filter> filterBean = new FilterRegistrationBean<>();
//		filterBean.setFilter(new HiddenHttpMethodFilter());
//		return filterBean;
//	}

	// Spring Boot已經內鍵設定編碼，以下示範如何強制設定編碼模式
//	@Bean
//	FilterRegistrationBean<Filter> registerCharacterEncodingFilter() {
//		FilterRegistrationBean<Filter> filterBean = new FilterRegistrationBean<>();
//		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
//		characterEncodingFilter.setForceEncoding(true);
//		characterEncodingFilter.setEncoding("UTF-8");
//		filterBean.setFilter(characterEncodingFilter);
//		return filterBean;
//	}
//	} http://localhost:8080/EEIT133GroupOne/

}
