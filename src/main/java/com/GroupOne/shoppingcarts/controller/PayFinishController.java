package com.GroupOne.shoppingcarts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.model.ListBean;
import com.GroupOne.shoppingcarts.service.ProductService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@SessionAttributes({"payProcess"})
public class PayFinishController {
	
	ProductService productService;
	
	@Autowired
	public PayFinishController(ProductService productService) {
		super();
		this.productService = productService;
	}

	@GetMapping("/user/PayFinish")
	public String removePayProcess(Model model,SessionStatus status) {
		CartsBean cBean = (CartsBean) model.getAttribute("payProcess");
		System.out.println("cBean2: "+cBean);
		status.setComplete();
		System.out.println("Remove payProcess and transcationRe");
		CartsBean cBean2 = (CartsBean) model.getAttribute("payProcess");
		System.out.println("cBean2: "+cBean2);
		return "shopping/Pay";
	}
	
	@PostMapping("/PayWait")
	public String payWait(Model model,SessionStatus status) {
		System.out.println("Pay Wait");
		CartsBean cBean = (CartsBean) model.getAttribute("payProcess");
		System.out.println("cBean-1: "+cBean);
		return "redirect:/user/Pay";	
	}
	
	@GetMapping("/gottoGreen")
	@ResponseBody
	public void payProcess(Model model,HttpServletRequest request,HttpServletResponse response,
			@ModelAttribute("now") String now,
			@ModelAttribute("resultURL") String resultURL,
			@ModelAttribute("randomItemNo") String randomItemNo,
			@ModelAttribute("amountS") String amountS,
			@ModelAttribute("itemName") String itemName
			) {
			
		System.out.println(model.getAttribute("payProcess"));
		
		System.out.println("----------");
		System.out.println(now);
		System.out.println(randomItemNo);
		System.out.println(amountS);
		System.out.println(itemName);
		System.out.println(resultURL);
		
		AllInOne aio = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantID("2000214");
		obj.setMerchantTradeNo(randomItemNo);
//		obj.setStoreID();
		obj.setMerchantTradeDate(now);
		obj.setTotalAmount(amountS);
		obj.setTradeDesc("test Description"); // ??
		obj.setItemName(itemName);
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setOrderResultURL(resultURL);
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = aio.aioCheckOut(obj, null);
		System.out.println(form);
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF8");
		try {
			PrintWriter out = response.getWriter();
			out.print(form);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping({"/user/ListItem","/admin/ListItem"})
	@ResponseBody
	public List<ListBean> listItem(Model model,HttpServletRequest request,
			@RequestParam("itemNo") int itemNo) {
		String stringURL = request.getHeader("Referer");
		System.out.println(stringURL);
		return productService.findByItemNo(itemNo);
	}
	
	@GetMapping("/user/test1")
	public String te() {
		return "shopping/Pay";
	
	}
}
