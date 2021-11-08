package com.GroupOne.yu.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.GroupOne.yu.model.RestaurantBean;

public class RestaurantValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return RestaurantBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "restaurantBean.username.empty", "經營者姓名不得為空");
		ValidationUtils.rejectIfEmpty(errors, "Mobile", "restaurantBean.mobile.empty", "經營者電話不得為空");
		ValidationUtils.rejectIfEmpty(errors, "Rstname", "restaurantBean.Rstname.empty", "餐廳名稱不得為空");
		ValidationUtils.rejectIfEmpty(errors, "License", "restaurantBean.license.empty", "必須填入證照號碼");
		ValidationUtils.rejectIfEmpty(errors, "Rstaddress", "restaurantBean.rstaddress.empty", "餐廳地址不得為空");
		ValidationUtils.rejectIfEmpty(errors, "Rsttel", "restaurantBean.rsttel.empty", "餐廳電話不得為空");
		//ValidationUtils.rejectIfEmpty(errors, "category", "restaurantBean.category.empty", "餐廳類型不得為空");
		//ValidationUtils.rejectIfEmpty(errors, "businesstime", "restaurantBean.businesstime.empty", "email欄不得為空");

		RestaurantBean restaurant = (RestaurantBean) target;

		if (restaurant .getMobile() != null && restaurant .getMobile().contains(" ")) {
			errors.rejectValue("Mobile", "restaurantBean.password.space", "請輸入經營者電話");
		}

		if (restaurant.getRstname() != null && restaurant .getRstname().length() <= 1) {
			errors.rejectValue("getRstname", "restaurantBean.getRstname.size", "餐廳名稱至少需要一個字");
		}
		
//		if (restaurant.getRstaddress() != null && restaurant .getRstaddress().length() > 8) {
//			errors.rejectValue("getRstname", "restaurantBean.getRstname.size", "餐廳地址至少八個字");
//		}

		if (restaurant .getRsttel() != null && restaurant .getRsttel().contains(" ")) {
			errors.rejectValue("Rsttel", "restaurantBean.getRsttel.space", "請輸入經營者電話");
		

	}

	}
	}
