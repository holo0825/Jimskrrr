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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.Albert.model.AdminBean;
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.service.AdminLoginLogoutService;

@Controller
//@SessionAttributes("admin")
public class AdminLoginController{

		AdminLoginLogoutService allService;
		
		ServletContext servletContext;
	
		public AdminLoginController(AdminLoginLogoutService allService, ServletContext servletContext) {
			this.allService = allService;
			this.servletContext = servletContext;
		}
		
		// 進入登入頁面前的Controller方法，預備@ModelAttribute的admin屬性物件
		@GetMapping("/AdminTryLogin")
		public String adminTryLogin(Model model) {
//		public String adminTryLogin(@ModelAttribute("admin") AdminBean existingAdmin, Model model) {
//			if (existingAdmin != null) {
//				return "index";
//			}else {
				AdminBean admin = new AdminBean();
//			AdminBean admin = null; // 千萬不可以設定為null，下一頁的modelAttribute必須接受一個名為admin的物件
				model.addAttribute("admin", admin);
				return "adminLogin";
				// adminLogin.jsp 為管理者登入頁面
//			}
		}
		
//		@ModelAttribute("admin")
//		 public AdminBean getAdminBean() {
//		  return new AdminBean();
//		 }
		
//		@PostMapping("/Adminlogin")
		@GetMapping("/Adminlogin")
		public String checkLogin(@RequestParam(required = false) String username,
								 @RequestParam(required = false) String password,
								 @RequestParam(required = false) String email,
								 Model model,
								 RedirectAttributes redirectAttributes,
								 @ModelAttribute("admin") AdminBean aBean,
								 BindingResult bindingResult,
								 HttpServletRequest request) {
			
//			String username = request.getParameter("username");
//			String password = request.getParameter("password");
//			String email = request.getParameter("email");
		
		
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session factorySession = factory.getCurrentSession();
//		AdminDAO adminDao = new AdminDAO(factorySession);
			
			AdminBean admin;
//			String destPage = "adminLogin.jsp";
			String destPage = "adminLogin";
			
			if (aBean!=null) {
//			AdminBean admin = adminDao.checkLogin(username, password, email);
//				admin = allService.checkLogin(username, password, email);
//				admin = allService.checkLogin(aBean.getUsername(), aBean.getPassword(), aBean.getEmail());
				admin = allService.findByUsernameAndPasswordAndEmail(aBean.getUsername(), aBean.getPassword(), aBean.getEmail());
				
				if (admin != null) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);
//				destPage = "adminDash.jsp";
					
					model.addAttribute("admin", admin);
//					redirectAttributes.addAttribute("admin", admin);
					destPage = "adminDash";
					
					return "adminDash";
				} else {
					String message = "帳號密碼輸入錯誤或不存在此帳號";
//				request.setAttribute("message", message);
					admin = new AdminBean();
					model.addAttribute("admin", admin);
					model.addAttribute("message", message);
				}
			}


//			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
//			dispatcher.forward(request, response);
//			return "redirect:/" + destPage;
			return destPage;
			
		}

}