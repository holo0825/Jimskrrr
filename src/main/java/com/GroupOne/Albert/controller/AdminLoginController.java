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
@SessionAttributes("admin")
public class AdminLoginController{

		AdminLoginLogoutService allService;
		
		ServletContext servletContext;
	
		public AdminLoginController(AdminLoginLogoutService allService, ServletContext servletContext) {
			this.allService = allService;
			this.servletContext = servletContext;
		}
		
		// 進入登入頁面前的Controller方法，檢查session是否登入狀態，預備@ModelAttribute的admin屬性物件
		@GetMapping("/AdminTryLogin")
		public String adminTryLogin(Model model) {
//		public String adminTryLogin(Model model, HttpServletRequest request) {
			
//			AdminBean existingAdmin = (AdminBean)request.getSession().getAttribute("admin");
			AdminBean existingAdmin = (AdminBean)model.getAttribute("admin");

			if (existingAdmin != null) {
				return "adminDash";
			}
			AdminBean adminLoginBean = new AdminBean();
//			AdminBean admin = null; // 千萬不可以設定為null，下一頁的modelAttribute必須接受一個名為adminLoginBean的物件
			model.addAttribute("adminLoginBean", adminLoginBean);
			// adminLogin.jsp 為管理者登入頁面
			return "adminLogin";
		}
		
//		@ModelAttribute("adminLoginBean")
//		 public AdminBean getAdminBean() {
//		  return new AdminBean();
//		 }
		
//		@PostMapping("/Adminlogin")
		@GetMapping("/Adminlogin")
		public String checkLogin(
//								 @RequestParam(required = false) String username,
//								 @RequestParam(required = false) String password,
//								 @RequestParam(required = false) String email,
								 Model model,
								 RedirectAttributes redirectAttributes,
								 @ModelAttribute("adminLoginBean") AdminBean adminLoginBean,
								 BindingResult bindingResult,
								 HttpServletRequest request) {
			
//			String username = request.getParameter("username");
//			String password = request.getParameter("password");
//			String email = request.getParameter("email");
		
		
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session factorySession = factory.getCurrentSession();
//		AdminDAO adminDao = new AdminDAO(factorySession);
			// 先判斷管理員是否已經登入，如果已經登入就導回到管理員首頁
//			HttpSession session = request.getSession();
//			AdminBean existingAdmin = (AdminBean)session.getAttribute("admin");
			AdminBean existingAdmin = (AdminBean)model.getAttribute("admin");
			if (existingAdmin != null) {
				return "forward:/AdminHome";
			}
			
			AdminBean admin;
//			String destPage = "adminLogin.jsp";
			String destPage = "AdminTryLogin";
			
			if (adminLoginBean!=null) {
//			AdminBean admin = adminDao.checkLogin(username, password, email);
//				admin = allService.checkLogin(username, password, email);
//				admin = allService.checkLogin(aBean.getUsername(), aBean.getPassword(), aBean.getEmail());
				admin = allService.findByUsernameAndPasswordAndEmail(
						adminLoginBean.getUsername(), adminLoginBean.getPassword(), adminLoginBean.getEmail());
				
				if (admin != null) {
//				session = request.getSession();
//				session.setAttribute("admin", admin);
//				destPage = "adminDash.jsp";
					model.addAttribute("admin", admin);
					return "forward:/AdminHome";
				} else {
					String message = "帳號密碼輸入錯誤或不存在此帳號";
//				request.setAttribute("message", message);
					admin = new AdminBean();
					model.addAttribute("admin", admin);
//					redirectAttributes.addAttribute("admin", admin);
					model.addAttribute("message", message);
				}
			}


//			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
//			dispatcher.forward(request, response);
			return "forward:/" + destPage;
//			return destPage;
			
		}
		
		
		@GetMapping("/AdminHome")
		public String adminHome(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
//			AdminBean existingAdmin = (AdminBean)request.getSession().getAttribute("admin");
			AdminBean existingAdmin = (AdminBean)model.getAttribute("admin");
			if (existingAdmin != null) {
				return "adminDash";
			}else {
				String message = "尚未登入或權限不足";
				redirectAttributes.addFlashAttribute("message", message);
//				model.addAttribute("message", message);
				return "redirect:/AdminTryLogin";
			}
		}
			
}