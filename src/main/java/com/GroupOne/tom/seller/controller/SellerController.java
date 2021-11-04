package com.GroupOne.tom.seller.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.GroupOne.tom.model.SellerProductBean;
import com.GroupOne.tom.seller.service.SellerService;

@Controller
public class SellerController {
	
	
	SellerService sellerService;
	
	@Autowired
	public SellerController(SellerService sellerService) {
		super();
		this.sellerService = sellerService;
	}
	
//	@GetMapping("/")
//	public String index() {
//		return "SellerMain";   
//	}
	
	@GetMapping("/SellerMain")
	public String sellerMain() {
		return "SellerMain";   
	}
	
	@GetMapping("/Seller")
	public String seller() {
		return "Seller";   
	}
	
	@GetMapping("/SellerUpdate")
	public String sellerUpdate(Model model) {
		
		List<SellerProductBean> products = sellerService.findAll();
		
		model.addAttribute("Products", products);
		
		return "SellerUpdate";   
	}
	
	@GetMapping(value = "/sellerForm", 
			params = { "productname", "price", "people", "date", "picture"})
	public String sellerForm(Model model, 
			@RequestParam(value = "productname") String Name,
			@RequestParam(value = "price") Integer price, 
			@RequestParam(value = "people") Integer people,
			@RequestParam(value = "date") Date date) {

		SellerProductBean form = new SellerProductBean(); 	
		form.setName(Name);
		form.setPrice(price);
		form.setPeople(people);
		form.setDate(date);
		
		sellerService.insertProduct(form);

		return "Seller";
	}	
	
	@GetMapping(value = "/sellerUpdateForm" )
			//params = {"UPDATE","DELETE","productno", "productname", "price", "people", "date"}
	public String sellerUpdateForm(Model model, 
			@RequestParam(value = "UPDATE" ,required=false) String UPDATE,
			@RequestParam(value = "DELETE" ,required=false) String DELETE,
			@RequestParam(value = "productno") Integer id,
			@RequestParam(value = "productname") String Name,
			@RequestParam(value = "price") Integer price, 
			@RequestParam(value = "people") Integer people,
			@RequestParam(value = "date",required=false) Date date,
			@RequestParam(value = "now") Date now) {
		
		SellerProductBean form = new SellerProductBean(); 
		form.setId(id);
		form.setName(Name);
		form.setPrice(price);
		form.setPeople(people);
		if(date==null) {
			form.setDate(now);
		}else {
			form.setDate(date);
		}
		
		
		if (DELETE != null) {
			sellerService.deleteProduct(id);
		}else if(UPDATE != null) {
			sellerService.updateProduct(form);
		}
		
		return "redirect:/SellerUpdate";
	}	
	

}
