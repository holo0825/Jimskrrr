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

import com.GroupOne.Albert.model.AdminBean;

/**
 * Servlet implementation class UserLogoutServlet
 */
@Controller
@SessionAttributes({"admin"})
public class AdminLogoutController {
	
	@GetMapping("/Adminlogout")
	public String adminLogout(Model model, HttpServletRequest request, SessionStatus status) {

		HttpSession session = request.getSession(true);
		if (session != null) {
			session.removeAttribute("admin");
//			session.invalidate(); //登出時關閉session
		}
		AdminBean loggedInAdmin = (AdminBean) model.getAttribute("admin");
		if (loggedInAdmin != null) {
			status.setComplete(); // 清除該Controller類別列出的@SessionAttributes
		}

//		RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
//		dispatcher.forward(request, response);
//		return "redirect:/AdminTryLogin";
		return "forward:/AdminTryLogin";
	}

}
