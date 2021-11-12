package com.GroupOne.Albert.registration.validator;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.GroupOne.Albert.members.Member;

public class UserRegisterValidator implements Validator {
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");
	private static Logger log = LoggerFactory.getLogger(UserRegisterValidator.class);
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member mb = (Member) target;
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberId", 	"", "帳號欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", 	"", "帳號欄不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", 		"", "姓名欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullname", 		"", "姓名欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", 	"", "密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password1", 	"", "確認密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dob", 	"", "生日欄不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", 	"", "地址欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "", "性別欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", 		"", "電子郵件欄不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel", 		"", "電話欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", 		"", "電話欄不能空白");
		ValidationUtils.rejectIfEmpty(errors, "memberMultipartFile", "", "必須挑選圖片");
//		if (mb.getMemberId().length()<5) {
//			errors.rejectValue("memberId","", "帳號欄不能小於五個字元");
//		}
		
		if (! mb.getPassword().equals(mb.getPassword1())) {
			errors.rejectValue("password","", "密碼欄與確認密碼不一致");
		}
		log.info("mb.getMemberMultipartFile().getSize()=" + mb.getMemberMultipartFile().getSize());
		if (mb.getMemberMultipartFile().getSize() == 0) {
			errors.rejectValue("memberMultipartFile", "", "必須挑選圖片");
		}
		

		if (mb.getFullname() != null && mb.getFullname().length() < 2 || mb.getFullname().length() > 30) {
			if (errors.getFieldError("name") == null) {
				errors.rejectValue("name", "customerBean.name.size", "姓名欄至少要有兩個字元，最多不得超過30個字元");
//				errors.rejectValue("name", "customerBean.name.size"); //必須保證messages.properties檔案中有定義，否則出現錯誤
//				errors.rejectValue("name", "customerBean.name.size", "姓名欄至少要有兩個字元，最多不得超過30個字元-預設值");
			}	
		}

		if (mb.getPassword() != null && mb.getPassword().contains(" ")) {
			//errors.rejectValue("password", "customerBean.password.space");
			errors.rejectValue("password", "customerBean.password.space", "密碼欄不能包含空白字元");
		}

		if (mb.getPassword1() != null && mb.getPassword1().contains(" ")) {
			//errors.rejectValue("password1", "customerBean.password1.space");
			errors.rejectValue("password1", "customerBean.password1.space", "確認密碼欄不能包含空白字元");
		}

		if (mb.getPassword1() != null && mb.getPassword1().length() < 5
				&& mb.getPassword1().length() > 15) {
			//errors.rejectValue("password1", "customerBean.password1.size");
			errors.rejectValue("password1", "customerBean.password.size", "密碼欄至少要有五個字元，最多不得超過30個字元");
		}
		if (mb.getPassword1() != null && mb.getPassword() != null
				&& !mb.getPassword1().equals(mb.getPassword())) {
			//errors.rejectValue("password", "customerBean.password.mustEqual");
			if (errors.getFieldError("password") == null) {
			   errors.rejectValue("password", "customerBean.password.mustEqual", "密碼欄與確認密碼欄必須完全一致");
			}
		}

		if (mb.getEmail() != null && !EMAIL_REGEX.matcher(mb.getEmail()).matches()) {
			//errors.rejectValue("email", "customerBean.email.invalid");
			if (errors.getFieldError("email") == null) {
				errors.rejectValue("email", "customerBean.email.invalid", "電子郵件地址的格式不正確");
			}
		}
		
	}

}
