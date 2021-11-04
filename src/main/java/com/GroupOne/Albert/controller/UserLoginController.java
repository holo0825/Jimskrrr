package com.GroupOne.Albert.controller;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.UserLoginLogoutService;

@Controller
//@SessionAttributes("user")
public class UserLoginController{

		UserLoginLogoutService ullService;
		
		ServletContext servletContext;
	
		public UserLoginController(UserLoginLogoutService ullService, ServletContext servletContext) {
			this.ullService = ullService;
			this.servletContext = servletContext;
		}
		
		// 進入登入頁面前的Controller方法，預備@ModelAttribute的seller屬性物件
		@GetMapping("/UserTryLogin")
		public String getAddNewProductForm(Model model) {
//		public String getAddNewProductForm(@ModelAttribute("user") UserBean existingUser, Model model) {
//			if (existingUser != null) {
//				return "index";
//			}else {
				UserBean user = new UserBean();
//			UserBean user = null; // 千萬不可以設定為null，下一頁的modelAttribute必須接受一個名為seller的物件
				model.addAttribute("user", user);
				return "userLogin";
				// userLogin.jsp 為賣家用戶登入頁面
//			}
		}
				
//		@ModelAttribute("user")
//		 public UserBean getUserBean() {
//		  return new UserBean();
//		 }		
				
		@GetMapping("/Userlogin")
		public String checkLogin(@RequestParam String username,
								 @RequestParam String password,
								 @RequestParam String email,
								 Model model,
								 RedirectAttributes redirectAttributes,
								 @ModelAttribute("user") UserBean uBean,
								 BindingResult bindingResult,
								 HttpServletRequest request) {
			
//			String username = request.getParameter("username");
//			String password = request.getParameter("password");
//			String email = request.getParameter("email");
		
		
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session factorySession = factory.getCurrentSession();
//		UserDAO userDao = new UserDAO(factorySession);

			UserBean user;
//			String destPage = "userLogin.jsp";
			String destPage = "userLogin";

			if (uBean!=null) {
//			UserBean user = userDao.checkLogin(username, password, email);
//				user = ullService.checkLogin(username, password, email);
//				user = ullService.checkLogin(uBean.getUsername(), uBean.getPassword(), uBean.getEmail());
				user = ullService.findByUsernameAndPasswordAndEmail(uBean.getUsername(), uBean.getPassword(), uBean.getEmail());
				
			
			if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
//			destPage = "userDash.jsp";
				
				model.addAttribute(user);
//				redirectAttributes.addAttribute("user" ,user);
				destPage = "userDash";
				
				return "userDash";
			} else {
				String message = "帳號密碼輸入錯誤或不存在此帳號";
//			request.setAttribute("message", message);
				user = new UserBean();
				model.addAttribute("user", user);
				model.addAttribute("message", message);
			}
			}
			
//			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
//			dispatcher.forward(request, response);
//			return "redirect:/" + destPage;
			return destPage;
			
		}

}