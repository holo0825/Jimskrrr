package com.GroupOne.yu.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.GroupOne.yu.model.MenuBean;



public class MenuValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return MenuBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productName", "menuBean.productName.empty", "菜色名稱不得為空");
		ValidationUtils.rejectIfEmpty(errors, "price", "menuBean.price.empty", "價格不得為空");

		MenuBean menuBean= (MenuBean) target;

		if (menuBean.getProductName() != null && menuBean.getProductName().length() < 2 || menuBean.getProductName().length() > 30) {
			if (errors.getFieldError("productName") == null) {
				errors.rejectValue("productName", "menuBean.productName.size");
			}	
		}

	}

}
