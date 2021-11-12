package com.GroupOne.tom.customer.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.tom.customer.service.CustomerService;
import com.GroupOne.tom.model.CartBean;
import com.GroupOne.tom.model.SellerProductBean;


@Controller
public class CustomerController{
	
	
	CustomerService customerService;
	
	
	@Autowired
	public CustomerController(CustomerService customerService) {
		super();
		this.customerService = customerService;
	}
	
	@GetMapping("customerSearch")
	public String customerSearch(Model model) {
		
		List<SellerProductBean> products = customerService.findAll();
		
		model.addAttribute("Products", products);
		return "groupbuy/customerSearch";   
	}
	
	@GetMapping("customer/{id}")
	public String customer(Model model, @PathVariable(required = false) Integer id) {
		
		Optional<SellerProductBean> product = customerService.findById(id);
		SellerProductBean customerProduct = product.get();
		model.addAttribute("Product", customerProduct);
		return "groupbuy/customer";   
	}
	
	@GetMapping(value = "/CustomerForm")
	public String sellerForm(Model model,
			RedirectAttributes red, 
			@RequestParam(value = "id") Integer id,
			@RequestParam(value = "number") Integer number 
		) {

		CartBean cart = customerService.getCustomerById(id);
		cart.setNumber(number);
		System.out.println("+++++++++++++++++++++");
		System.out.println("321:"+cart.getName());
		System.out.println("321:"+cart.getPrice());
		System.out.println("321:"+cart.getNumber());
		System.out.println("321:"+cart.getCategory());
		
		System.out.println("+++++++++++++++++++++");
		
		red.addAttribute("name",cart.getName());
		red.addAttribute("price",cart.getPrice());
		red.addAttribute("number",cart.getNumber());
		red.addAttribute("category",cart.getCategory());
//		model.addAttribute("cart", cart);


		return "redirect:/user/CartListNew";

	}	
	
	
}
	