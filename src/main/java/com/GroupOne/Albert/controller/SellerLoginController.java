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
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.SellerLoginLogoutService;
import com.GroupOne.Albert.service.UserLoginLogoutService;

@Controller
//@SessionAttributes("seller")
public class SellerLoginController{

		SellerLoginLogoutService sllService;
		
		ServletContext servletContext;
	
		public SellerLoginController(SellerLoginLogoutService sllService, ServletContext servletContext) {
			this.sllService = sllService;
			this.servletContext = servletContext;
		}
	
		// 進入登入頁面前的Controller方法，預備@ModelAttribute的seller屬性物件
		@GetMapping("/SellerTryLogin")
		public String getAddNewProductForm(Model model) {
//		public String getAddNewProductForm(@ModelAttribute("seller") SellerBean existingSeller, Model model) {
//			if (existingSeller != null) {
//				return "index";
//			}else {
				SellerBean seller = new SellerBean();
//			SellerBean seller = null; // 千萬不可以設定為null，下一頁的modelAttribute必須接受一個名為seller的物件
				model.addAttribute("seller", seller);
				return "sellerLogin";
				// sellerLogin.jsp 為賣家用戶登入頁面				
//			}
		}
		
//		@ModelAttribute("seller")
//		 public SellerBean getSellerBean() {
//		  return new SellerBean();
//		 }
		
		@GetMapping("/Sellerlogin")
		public String checkLogin(@RequestParam(required = true) String username,
								 @RequestParam(required = true) String password,
								 @RequestParam(required = true) String email,
								 Model model,
								 RedirectAttributes redirectAttributes,
								 @ModelAttribute("seller") SellerBean sBean,
								 BindingResult bindingResult,
								 HttpServletRequest request) {
			
//			String username = request.getParameter("username");
//			String password = request.getParameter("password");
//			String email = request.getParameter("email");
		
		
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session factorySession = factory.getCurrentSession();
//		SellerDAO sellerDao = new SellerDAO(factorySession);

			SellerBean seller;
//			String destPage = "sellerLogin.jsp";
			String destPage = "sellerLogin";

			if (sBean!=null) {
//			sellerBean seller = sellerDao.checkLogin(username, password, email);
//				seller = sllService.checkLogin(username, password, email);
//				seller = sllService.checkLogin(sBean.getUsername(), sBean.getPassword(), sBean.getEmail());
				seller = sllService.findByUsernameAndPasswordAndEmail(sBean.getUsername(), sBean.getPassword(), sBean.getEmail());
				
			
				if (seller != null) {
				HttpSession session = request.getSession();
				session.setAttribute("seller", seller);
	//			destPage = "sellerDash.jsp";
					
					model.addAttribute("seller", seller);
	//				redirectAttributes.addAttribute("seller", seller);
					destPage = "sellerDash";
					
					return "sellerDash";
				} else {
					String message = "帳號密碼輸入錯誤或不存在此帳號";
	//			request.setAttribute("message", message);
					seller = new SellerBean();
					model.addAttribute("seller", seller);
					model.addAttribute("message", message);
				}
			}

//			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
//			dispatcher.forward(request, response);
//			return "redirect:/" + destPage;
			return destPage;
			
		}

}