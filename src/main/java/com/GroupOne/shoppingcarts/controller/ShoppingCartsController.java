package com.GroupOne.shoppingcarts.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

//import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.model.ListBean;
import com.GroupOne.shoppingcarts.service.ProductService;
import com.GroupOne.tom.model.CartBean;


@SessionAttributes({"admin","user"})
@Controller
//@RequestMapping("/shopping")
public class ShoppingCartsController {

	ProductService productService;
	String username = "Orange";
//	String username ;     // password: Helloworld123

	@Autowired
	public ShoppingCartsController(ProductService productService) {
		super();
		this.productService = productService;
	}

	@GetMapping("/CartListNew")
	public String CartListNew(Model model,
//			CartBean cart,
			@ModelAttribute("name") String productName,
			@ModelAttribute("price") String priceS,
			@ModelAttribute("number") String numberS,
			@ModelAttribute("category") String typeS
			
//			@RequestParam("productName") String productName,
//			@RequestParam("price") String priceS,
//			@RequestParam("number") String numberS,
//			@RequestParam("type") String typeS
 			) {
//		String username = (String) model.getAttribute("user");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
//		this.username = username;
		//CartBean cart = model.getAttribute("cart");
		System.out.println("-------------------------");
		System.out.println("123:"+productName);
		System.out.println("123:"+priceS);
		System.out.println("123:"+numberS);
		System.out.println("123:"+typeS);
//		System.out.println("123:"+cart.getName());
		System.out.println("-------------------------");
//		String productName = cart.getName();
//		int price = Integer.parseInt(cart.getPrice());
//		int number = Integer.parseInt(cart.getNumber());
//		String type = cart.getCategory();
		
		int price = Integer.parseInt(priceS);
		int number = Integer.parseInt(numberS);
		String type =typeS;		
		if (type.equals("group")) {
			type = "coupon";
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
		List<ListBean> findByItemNo = productService.findByItemNo(itemNo);
//		model.addAttribute("havePoint",productService.findPointByUsernametoCart(username));
		model.addAttribute("havePoint",250); //--------------------------------------------------------
		model.addAttribute("no",itemNo);
		model.addAttribute("info",username);
		model.addAttribute("cartList",findByItemNo);
		return "shopping/CartList";
	}
	
	@GetMapping("/CartListOld")
	public String CartListOld(Model model,
			@RequestParam("itemNo") int itemNo) {
//		String username = (String) model.getAttribute("user");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
//		this.username = username;	

		System.out.println("======================");
		List<String> test123 = new ArrayList<>();
		test123 = Arrays.asList("1","0","3");
		
		for (String s : test123) {
			System.out.println(s);
		}
//		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		System.out.println("======================");
		model.addAttribute("test123",test123);
		
		
//		model.addAttribute("havePoint",productService.findPointByUsernametoCart(username));
		model.addAttribute("havePoint",250); //--------------------------------------------------------
		model.addAttribute("no",itemNo);
		model.addAttribute("info",username);
		model.addAttribute("cartList",productService.findByItemNo(itemNo));
		return "shopping/CartList";
	}
	
	public List<Byte[]> ProductImages(int[] ints){
//		Byte[] NoImage = null;
		
		return null;
	}
	
	
	@GetMapping("/TwoCart")
	public String TwoCart(Model model) {
//		String username = (String) model.getAttribute("user");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
//		this.username = username;
		
		
		List<CartsBean> findTwoCart = productService.findByUsernameAndPaydayIsNullAndWrongIsNull(username);
		System.out.println(username);
		
		String result=null;
		if(findTwoCart.size() == 0) {
			result = "NoItem";
		}
		model.addAttribute("result",result);
		model.addAttribute("info",username);
		model.addAttribute("twoCart",findTwoCart);
		return "shopping/TwoCart";
	}
	
	@GetMapping("/AllCarts")
	public String AllCarts(Model model) {
//		String username = (String) model.getAttribute("user");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
//		this.username = username;

		List<CartsBean> findAllCartByUsername = productService.findByUsernameAndPaydayNotNull(username);
		model.addAttribute("allCarts",findAllCartByUsername);	
		return "shopping/AllCarts";
	}
	
	@GetMapping("/ListItem")
	@ResponseBody
	public List<ListBean> ListItem(Model model,
			@RequestParam("itemNo") int itemNo) {
		return productService.findByItemNo(itemNo);
	}
	
	@GetMapping("/DeleteCart")
	public String Delete(@RequestParam("itemNo") int itemNo) {
		productService.deleteCartByItemNo(itemNo);
		productService.deleteListByItemNo(itemNo);
		return "shopping/Pay";
	}
	
	@GetMapping("/Pay")    
	public String Pay(
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
		System.out.println("discount:"+discount+",disAmount:"+disAmount+",disPoint:"+disPoint);  //SQL待新增 -> 使用點數做折扣   //Cart:+3欄位
		
//		float havePoint = productService.findPointByUsernametoCart(username);
//		float havePoint = productService.findPointByUsernametoCart(username); //-----------------------
//		float NEwPoint = havePoint - discount + disPoint;
//		System.out.println("Old-New : "+havePoint+"-"+NEwPoint);
		
//		productService.updatePointByUsernametoCart(NEwPoint, username);
		
		Date utilD = new Date();
		productService.updateAmountAndPointsAndPaydayByUsernameAndItemNO(amount, point, utilD, username, itemNo);
		for (int i = 0; i < productNameS.length; i++) {
			String productName = productNameS[i];
			int number = numberS[i];
			productService.updateNumberAndExistByItemNoAndProductName(number, "Y", itemNo, productName);
		}
		productService.deleteListByItemNo(itemNo);
		return "shopping/Pay";
	}
	
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!　　　預留使用(上:修改,下:紀錄)--順序: [] -> /PayProcess -> $$ -> /Pay
	@GetMapping("/PayProcess")
	@ResponseBody
	public String PayProcess(Model model,
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
//		Date utilD = new Date();
//		CartsBean testcb = new CartsBean(amount, point, utilD, username, itemNo);
//		request.getSession().setAttribute("payCart",testcb);     //  -> @SessionAttributes ?
		
		List<ListBean> testList = new ArrayList<ListBean>();
		for (int i = 0; i < productNameS.length; i++) {
			String productName = productNameS[i];
			int number = numberS[i];
			ListBean testlb = new ListBean(number,itemNo,productName);
			testList.add(testlb);
		}
//		request.getSession().setAttribute("payList",testList);
		
		for(ListBean lb : testList) {
			System.out.println(lb.getItemNo()+":"+lb.getProductName()+":"+lb.getNumber());     //預留OK
		}
		return "shopping/Pay";
	}
	
	@GetMapping("/AdminCart")
	public String AdminFindAll(Model model) {
//		String username = (String) model.getAttribute("admin");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
		System.out.println("admin_name: "+username);
		List<CartsBean> findAllCartByUsername = productService.findByPaydayNotNull();
		model.addAttribute("adminCart",findAllCartByUsername);
		return "shopping/AdminCart";
	}
	
	@GetMapping("/Adminstatistics.cart")
	public String AdmintatisticsCart(Model model) {
//		String username = (String) model.getAttribute("admin");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
		
		List<Object[]> result = productService.findTwoAmountStatistics();
		String pie = "[['Task', 'Hours per Day'],";
		int i =0;
		for(Object[] ob:result) {
			String name = (String) ob[0];
			if(name.equals("coupon")) {
				name = "團購券";
			}else {
				name = "訂餐";
			}
			pie += "['"+name+"',"+ob[1]+"]";
			i++;
			if(i != result.size()) {				
			pie += ",";
			}
		}
		pie += "]";
		model.addAttribute("pie",pie);
		model.addAttribute("StatisticsCart",result);
		return "shopping/Adminstatistics";
	}
	
	@GetMapping("/Adminstatistics.list")
	public String AdmintatisticsList(Model model) {
//		String username = (String) model.getAttribute("admin");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
		
		List<Object[]> result = productService.findListAmountStatistics();
		String pie = "[['Task', 'Hours per Day'],";
		int i =0;
		for(Object[] ob:result) {
			pie += "['"+ob[0]+":單價"+ob[1]+"元',"+ob[3]+"]";
			i++;
			if(i != result.size()) {				
			pie += ",";
			}
		}
		pie += "]";
		model.addAttribute("pie",pie);
		model.addAttribute("StatisticsList",result);
		return "shopping/Adminstatistics";
	}
}
