package com.GroupOne.Albert.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.GroupOne.Albert.model.SellerBean;

//Spring框架運用SessionStatus類別的setComplete()方法清除名為seller的@SessionAttributes
@Controller
@SessionAttributes({"seller"})
public class SellerLogoutController {
	
	@GetMapping("/Sellerlogout")
	public String sellerLogout(Model model, SessionStatus status) {
//	public String sellerLogout(Model model, HttpServletRequest request, SessionStatus status) {

//		HttpSession session = request.getSession(true);
//		if (session != null) {
//			session.removeAttribute("seller");
//			session.invalidate(); //登出時關閉session
//		}
		SellerBean loggedInSeller = (SellerBean) model.getAttribute("seller");
		if (loggedInSeller != null) {
			status.setComplete(); // 清除該Controller類別列出的@SessionAttributes
		}

//		RequestDispatcher dispatcher = request.getRequestDispatcher("sellerLogin.jsp");
//		dispatcher.forward(request, response);
//		return "redirect:/SellerTryLogin";
		return "forward:/SellerTryLogin";
	}

}
