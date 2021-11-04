package com.GroupOne.yang.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.GroupOne.yang.model.ArticleBean;

public class ArticleValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ArticleBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "", "標題不能空白");
		ValidationUtils.rejectIfEmpty(errors, "content","", "內容不能空白");
		ValidationUtils.rejectIfEmpty(errors, "category","", "分類不能空白");

	}

}
