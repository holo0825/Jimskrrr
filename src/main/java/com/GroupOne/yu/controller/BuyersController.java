//package com.GroupOne.yu.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//@Controller
//public class BuyersController{
//		
//	//買家 商品加入購物車，導向購物車畫面
//	@GetMapping(value = "/OrderForm")
//	public String sellerForm(Model model, 
//			RedirectAttributes red, 
//			@RequestParam(value = "rstName") String rstName,
//			@RequestParam(value = "productName") String productName,
//			@RequestParam(value = "price") String price,
//			@RequestParam(value = "number") String number 
//		) {
//
//		red.addAttribute("rstName",rstName);
//		red.addAttribute("name",productName); //"name"要跟團購的名稱相同
//		red.addAttribute("price",price);
//		red.addAttribute("number",number);
//		red.addAttribute("category","food");
//		//model.addAttribute("cart", cart);
//
//		return "redirect:/CartListNew";
//	}	
//}
//	