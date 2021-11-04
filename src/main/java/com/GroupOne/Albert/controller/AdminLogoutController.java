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

/**
 * Servlet implementation class UserLogoutServlet
 */
@Controller
public class AdminLogoutController {
	
	@GetMapping("/Adminlogout")
	public String adminLogout(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession(true);
		if (session != null) {
			session.removeAttribute("admin");
//			session.invalidate(); //登出時關閉session
		}

//		RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
//		dispatcher.forward(request, response);
		return "redirect:/AdminTryLogin";
	}

}
