package com.GroupOne.shoppingcarts.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(value = Throwable.class)
	public String handleError(HttpServletRequest request,Exception e) {
		return "shopping/test/404";
	}
	

}
