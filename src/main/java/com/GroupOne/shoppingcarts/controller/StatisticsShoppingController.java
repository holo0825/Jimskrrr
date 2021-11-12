package com.GroupOne.shoppingcarts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.service.ProductService;

@SessionAttributes({"admin"})
@Controller
@RequestMapping("/admin")
public class StatisticsShoppingController {
	
	ProductService productService;
	
	@Autowired
	public StatisticsShoppingController(ProductService productService) {
		super();
		this.productService = productService;
	}

	@PostMapping("/RefundDec")
	@ResponseBody
	public void refundApp(@RequestParam("itemNo") int itemNo,
			@RequestParam("info") String info,
			@RequestParam(value = "point",required = false,defaultValue = "0") float point
			) {
		productService.updateRefundByItemNoCart(info, itemNo);
		if(info.equals("已退款")) {
			productService.updateRefundByItemNoList(info, itemNo);
		}
		if(point != 0) {
			CartsBean cartsBean = productService.findByCartItemNo(itemNo);
			String username = cartsBean.getUsername();
			System.out.println(username+":"+itemNo);
			float havePoint = productService.findByUsernametoCart(username);
			float NewPoint = havePoint - point;
			productService.updatePointByUsernametoCart(NewPoint, username);
		}
	}
	
	@GetMapping("/AdminCart")
	public String adminFindAll(Model model) {

		if(model.getAttribute("admin") == null) {
			System.out.println("未登入");
			return "redirect:/AdminTryLogin";
		}
		Member adminBean = (Member) model.getAttribute("admin");
		String username = adminBean.getUsername();
		System.out.println("admin_name: "+username);
		
		List<CartsBean> findAllCartByUsername = productService.findByPaydayNotNull();
		model.addAttribute("adminCart",findAllCartByUsername);
		return "shopping/AdminCart";
	}
	
	@GetMapping("/Adminstatistics")
	public String admintatistics(Model model) {
		
		if(model.getAttribute("admin") == null) {
			System.out.println("未登入");
			return "redirect:/AdminTryLogin";
		}
		Member adminBean = (Member) model.getAttribute("admin");
		String username = adminBean.getUsername();
		System.out.println("admin_name: "+username);
		
		List<Object[]> resultCart = productService.findTwoAmountStatistics();
		String pieCart = "[['Task', 'Hours per Day'],";
		int i =0;
		for(Object[] ob:resultCart) {
			String name = (String) ob[0];
			if(name.equals("coupon")) {
				name = "團購券";
			}else {
				name = "訂餐";
			}
			pieCart += "['"+name+"',"+ob[1]+"]";
			i++;
			if(i != resultCart.size()) {				
				pieCart += ",";
			}
		}
		pieCart += "]";
		model.addAttribute("pieCart",pieCart);
		model.addAttribute("StatisticsCart",resultCart);
	
		List<Object[]> resultList = productService.findListAmountStatistics();
		String pieList = "[['Task', 'Hours per Day'],";
		int j =0;
		for(Object[] ob:resultList) {
			pieList += "['"+ob[0]+":單價"+ob[1]+"元',"+ob[3]+"]";
			System.out.println(j);
			if(j != resultList.size()) {				
				pieList += ",";
			}
		}
		pieList += "]";
		model.addAttribute("pieList",pieList);
		model.addAttribute("StatisticsList",resultList);
		
		System.out.println(pieCart);
		System.out.println(pieList);
		return "shopping/Adminstatistics";
	}
}
