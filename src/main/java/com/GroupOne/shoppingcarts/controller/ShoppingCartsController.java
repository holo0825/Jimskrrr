package com.GroupOne.shoppingcarts.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.model.ListBean;
import com.GroupOne.shoppingcarts.service.ProductService;

@SessionAttributes({"user","payProcess"})
@Controller
@RequestMapping("/user")
public class ShoppingCartsController {

	ProductService productService;
	String username ;     // password: Helloworld123
	CartsBean payProcess;

	@Autowired
	public ShoppingCartsController(ProductService productService) {
		super();
		this.productService = productService;
	}

	@GetMapping("/CartListNew")
	public String cartListNew(Model model,
			@ModelAttribute("name") String productName,
			@ModelAttribute("price") String priceS,
			@ModelAttribute("number") String numberS,
			@ModelAttribute("category") String typeS
 			) {
		
		if(model.getAttribute("user") == null) {
			System.out.println("未登入");
			return "redirect:/UserTryLogin";
		}
		Member userBean = (Member) model.getAttribute("user");
		String username = userBean.getUsername();
		System.out.println("user_name: "+username);
		
		int price = Integer.parseInt(priceS);
		int number = Integer.parseInt(numberS);
		String type =typeS;		
		if (type.equals("group")) {
			type = "coupon";
		}else if(type.equals("food")) {
			type = "food";
		}
		System.out.println("type:"+type);
		System.out.println(productName+":"+price+":"+number+":"+type);
		
		int itemNo;
		boolean insert=false;
		CartsBean cartsBean = productService.findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(username, type);
		if (cartsBean == null) {		
			CartsBean cBean = new CartsBean(username,type);
			productService.saveCart(cBean);
			insert =true;
		}
		if(insert) {			
		cartsBean = productService.findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(username, type);
		}
		itemNo = cartsBean.getItemNo();
		boolean exist = productService.findByItemNoAndProductName(itemNo, productName);
		if (exist) {
			productService.updateNumberByItemNoAndProductName(number, itemNo, productName);
		}else {
			ListBean lBean = new ListBean(itemNo,productName,number,price);
			productService.saveList(lBean);
		}
//		List<ListBean> findByItemNo = productService.findByItemNo(itemNo);
		
//		model.addAttribute("type",type);
//		model.addAttribute("havePoint",productService.findByUsernametoCart(username));
//		model.addAttribute("no",itemNo);
//		model.addAttribute("info",username);
//		model.addAttribute("cartList",findByItemNo);
		return "redirect:/user/CartList/"+type;
	}
	
	@GetMapping("/CartList/{type}")
	public String cartListType(Model model,RedirectAttributes redModel,
			@PathVariable("type") String type) {
		
		if(model.getAttribute("user") == null) {
			System.out.println("未登入123");
			return "redirect:/UserTryLogin";
		}
		Member userBean = (Member) model.getAttribute("user");
		String username = userBean.getUsername();
		System.out.println("user_name: "+username);
		this.username = username;
		
		System.out.println("u:"+username+" t:"+type);
		CartsBean cartBean = productService.findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(username, type);
		int itemNo=-1;
		if(cartBean != null) {
			itemNo = cartBean.getItemNo();
		}
		System.out.println(cartBean);
		
		model.addAttribute("havePoint",productService.findByUsernametoCart(username)); //---------------------------------------------
		model.addAttribute("no",itemNo);
		model.addAttribute("info",username);
		model.addAttribute("cartList",productService.findByItemNo(itemNo));
		
		redModel.addAttribute("type",type);
		redModel.addAttribute("itemNo",itemNo);
//		return "redirect:/user/CartListOld";
		return "shopping/CartList";
	}
	
	@GetMapping("/AllCarts")
	public String allCarts(Model model) {
		
		if(model.getAttribute("user") == null) {
			System.out.println("未登入");
			return "redirect:/UserTryLogin";
		}
		Member userBean = (Member) model.getAttribute("user");
		String username = userBean.getUsername();
		System.out.println("user_name: "+username);

		List<CartsBean> findAllCartByUsername = productService.findByUsernameAndPaydayNotNull(username);
		model.addAttribute("allCarts",findAllCartByUsername);	
		return "shopping/AllCarts";
	}
	
	@PostMapping("/NumChangeList")
	@ResponseBody
	public void numChangeList(@RequestParam("itemNo") int itemNo,
			@RequestParam("productName") String productName,
			@RequestParam("number") int number
			) {
		System.out.println(itemNo+":"+productName+":"+number);
		productService.updateNumberByItemNoAndProductName(number, itemNo, productName);
	}
	
	@PostMapping("/DeleteCart")
	public String delete(@RequestParam("itemNo") int itemNo) {
		productService.deleteCartByItemNo(itemNo);
		productService.deleteListByItemNo(itemNo);
		return "redirect:/user/CartList/no";
	}
	
	@PostMapping("/DeletePartList")
	@ResponseBody
	public void deletePartList(@RequestParam("itemNo") int itemNo,
			@RequestParam("productName") String productName
			) {
		productService.deleteByItemNoAndProductName(itemNo, productName);
	}
	
	@GetMapping("/Pay")    
	public String pay(Model model) {
		
		if(model.getAttribute("payProcess") == null) {
			System.out.println("123");
			CartsBean cBean0 = (CartsBean) model.getAttribute("payProcess");
			System.out.println("cBean0: "+cBean0);
			System.out.println("cBean0.T:"+cBean0.getTransactionalNum());
//			return "redirect:/index";
		}
		CartsBean cartsBean = (CartsBean) model.getAttribute("payProcess");
		System.out.println("cBean1: "+cartsBean);
		
//		CartsBean cartsBean = this.payProcess;
		
		int amount = cartsBean.getAmount();
		String username = cartsBean.getUsername();
		int itemNo = cartsBean.getItemNo();
		int discount = cartsBean.getDiscount();
		int disAmount = cartsBean.getDisAmount();
		float disPoint = cartsBean.getPoints();
		String randomItemNo = cartsBean.getTransactionalNum();
		
		float havePoint = productService.findByUsernametoCart(username);
		float NewPoint = havePoint - discount + disPoint;
		productService.updatePointByUsernametoCart(NewPoint, username);
		
		Date utilD = new Date();
		productService.updateAmountAndPointsAndPaydayByUsernameAndItemNo(amount, disPoint, utilD, discount, disAmount, randomItemNo, username, itemNo);
		productService.updateExistByItemNo("Y", itemNo);
		
		return "redirect:/user/PayFinish";
	}
	
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!　　　預留使用(上:修改,下:紀錄)--順序: [] -> /PayProcess -> $$ -> /Pay
	@PostMapping("/PayProcess")
//	@ResponseBody
	public String payProcess(Model model,HttpServletRequest request,HttpServletResponse response,RedirectAttributes red,
			@RequestParam("amount") int amount,
			@RequestParam("point") float point,
			@RequestParam("username") String username,
			@RequestParam("itemNo") int itemNo,
			@RequestParam("number") int[] numberS,
			@RequestParam("productName") String[] productNameS,
			@RequestParam(value = "discount",required = false,defaultValue = "0") int discount,
			@RequestParam("disAmount") int disAmount,
			@RequestParam("disPoint") float disPoint
			) {
		
		String amountS = Integer.toString(amount);
		
		int random = (int) (10000 + ((Math.random() * 1000) + 1));
		String randomItemNo = "EEIT" + random + itemNo;
		
		CartsBean payProcess = new CartsBean(amount,disPoint,username,itemNo,discount,disAmount,randomItemNo);
		System.out.println(payProcess);
		model.addAttribute("payProcess",payProcess);
		this.payProcess = payProcess;
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < productNameS.length; i++) {
			if (i + 1 != productNameS.length) {
				sb.append(productNameS[i] + "x" + numberS[i] + "#");
			} else {
				sb.append(productNameS[i] + "x" + numberS[i]);
			}
		}
		String itemName = sb.toString();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String now = sdf.format(date);
		System.out.println(now);
		
		String stringURL = request.getHeader("Referer");
		String sURL = null;
		try {
			URL url = new URL(stringURL);
			String path = url.getPath();
			String[] pathS = path.split("/");
			sURL = url.getProtocol() + "://" + url.getAuthority()+"/"+pathS[1];
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		String resultURL = sURL + "/PayWait";
		
		red.addAttribute("now",now);
		red.addAttribute("resultURL",resultURL);
		red.addAttribute("randomItemNo",randomItemNo);
		red.addAttribute("amountS",amountS);
		red.addAttribute("itemName",itemName);

		return "redirect:/gottoGreen";
	}
	
	@PostMapping("/RefundApp")
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
			float havePoint = productService.findByUsernametoCart(username);
			float NewPoint = havePoint - point;
			productService.updatePointByUsernametoCart(NewPoint, username);
		}
	}
}
