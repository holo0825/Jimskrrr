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

import com.GroupOne.Albert.model.AdminBean;
import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.UserLoginLogoutService;

@Controller
@SessionAttributes("user")
public class UserLoginController{

		UserLoginLogoutService ullService;
		
		ServletContext servletContext;
	
		public UserLoginController(UserLoginLogoutService ullService, ServletContext servletContext) {
			this.ullService = ullService;
			this.servletContext = servletContext;
		}
		
		// 進入登入頁面前的Controller方法，檢查session是否登入狀態，或預備@ModelAttribute的userLoginBean屬性物件
		@GetMapping("/UserTryLogin")
		public String getAddNewProductForm(Model model) {
//		public String getAddNewProductForm(Model model, HttpServletRequest request) {
			
//			UserBean existingUser = (UserBean)request.getSession().getAttribute("user");
			UserBean existingUser = (UserBean)model.getAttribute("user");

			if (existingUser != null) {
				return "userDash";
			}
			UserBean userLoginBean = new UserBean();
//			UserBean userLoginBean = null; // 千萬不可以設定為null，下一頁的modelAttribute必須接受一個名為userLoginBean的物件
			model.addAttribute("userLoginBean", userLoginBean);
			// userLogin.jsp 為賣家用戶登入頁面
			return "userLogin";
		}
				
//		@ModelAttribute("userLoginBean")
//		 public UserBean getUserBean() {
//		  return new UserBean();
//		 }		
				
		@GetMapping("/Userlogin")
		public String checkLogin(
//								 @RequestParam(required = false) String username,
//								 @RequestParam(required = false) String password,
//								 @RequestParam(required = false) String email,
								 Model model,
								 RedirectAttributes redirectAttributes,
								 @ModelAttribute("userLoginBean") UserBean userLoginBean,
								 BindingResult bindingResult,
								 HttpServletRequest request) {
			
//			String username = request.getParameter("username");
//			String password = request.getParameter("password");
//			String email = request.getParameter("email");
		
		
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session factorySession = factory.getCurrentSession();
//		UserDAO userDao = new UserDAO(factorySession);
			// 先判斷買家是否已經登入，如果已經登入就導回到買家平台首頁
//			HttpSession session = request.getSession();
//			UserBean existingUser = (UserBean)session.getAttribute("user");
			UserBean existingUser = (UserBean)model.getAttribute("user");
			if (existingUser != null) {
				return "forward:/UserHome";
			}

			UserBean user;
//			String destPage = "userLogin.jsp";
			String destPage = "UserTryLogin";

			if (userLoginBean!=null) {
//			UserBean user = userDao.checkLogin(username, password, email);
//				user = ullService.checkLogin(username, password, email);
//				user = ullService.checkLogin(uBean.getUsername(), uBean.getPassword(), uBean.getEmail());
				user = ullService.findByUsernameAndPasswordAndEmail(
						userLoginBean.getUsername(), userLoginBean.getPassword(), userLoginBean.getEmail());
				
			
				if (user != null) {
//				session = request.getSession();
//				session.setAttribute("user", user);
//				destPage = "userDash.jsp";
					model.addAttribute("user", user);
					return "forward:/UserHome";
				} else {
					String message = "帳號密碼輸入錯誤或不存在此帳號";
//				request.setAttribute("message", message);
					user = new UserBean();
					model.addAttribute("user", user);
//					redirectAttributes.addAttribute("user" ,user);
					model.addAttribute("message", message);
				}
			}
			
//			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
//			dispatcher.forward(request, response);
			return "forward:/" + destPage;
//			return destPage;
		}

		
		@GetMapping("/UserHome")
		public String userHome(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
//			UserBean existingUser = (UserBean)request.getSession().getAttribute("user");
			UserBean existingUser = (UserBean)model.getAttribute("user");
			if (existingUser != null) {
				return "userDash";
			}else {
				String message = "尚未登入或權限不足";
				redirectAttributes.addFlashAttribute("message", message);
//				model.addAttribute("message", message);
				return "redirect:/UserTryLogin";
			}
		}

}