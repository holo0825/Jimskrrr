package com.GroupOne.Albert.registrationCommentedForTest;

import java.util.function.Predicate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class EmailValidator implements Predicate<String>{

	@Override
	public boolean test(String s) {
//		TODO: Regex to validate email
		// custom regex pattern to check email
//		String regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
//		 
//		Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
//		Matcher matcher = pattern.matcher(s);
//        return matcher.find();
		return true; //assume everything is valid for now
	}

}
