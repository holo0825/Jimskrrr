package com.GroupOne.Albert.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.GroupOne.Albert.model.AdminBean;
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.model.UserBean;

@Controller
public class HomeController {
	@GetMapping({"/index", "/", "/home"})
	public String Index(Model model) { // Spring MVC不重視方法名稱，但是建議取名為有意義的名稱
		
//		AdminBean admin = new AdminBean();
//		model.addAttribute("admin", admin);
//		
//		UserBean user = new UserBean();
//		model.addAttribute("user", user);
//		
//		SellerBean seller = new SellerBean();
//		model.addAttribute("seller", seller);

		return "index";
	}
}