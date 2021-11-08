package com.GroupOne.yu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.GroupOne.yu.model.RestaurantCartBean;

@Controller
public class BuyersController{
		
	@GetMapping(value = "/OrderForm")
	public String sellerForm(Model model, 
			@RequestParam(value = "productName") String productName,
			@RequestParam(value = "price") String price,
			@RequestParam(value = "number") String number 
		) {

		//model.addAttribute("RestaurantName",rstName);
		model.addAttribute("name",productName);
		model.addAttribute("price",price);
		model.addAttribute("number",number);
		model.addAttribute("category","food");
		//model.addAttribute("cart", cart);

		return "redirect:/CartListNew";
	}	
}
	