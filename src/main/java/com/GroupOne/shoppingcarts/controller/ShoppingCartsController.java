package com.GroupOne.shoppingcarts.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.shoppingcarts.model.CartsBean;
import com.GroupOne.shoppingcarts.model.ListBean;
import com.GroupOne.shoppingcarts.service.ProductService;
import com.GroupOne.tom.model.CartBean;


@SessionAttributes({"admin","user","payProcess","productNameS","numberS"})
@Controller
//@RequestMapping("/shopping")
public class ShoppingCartsController {

	ProductService productService;

	String username = "JackyChen";

//	String username ;     // password: Helloworld123

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
		model.addAttribute("havePoint",productService.findByUsernametoCart(username));
		model.addAttribute("no",itemNo);
		model.addAttribute("info",username);
		model.addAttribute("cartList",findByItemNo);
		return "shopping/CartList";
	}

	@GetMapping("/CartList/{type}")
	public String cartFood(RedirectAttributes model,
			@PathVariable("type") String type) {
		System.out.println("u:"+username+" t:"+type);
		CartsBean cartBean = productService.findByUsernameAndTypeAndPaydayIsNullAndWrongIsNull(username, type);
		int itemNo=-1;
		if(cartBean != null) {
			itemNo = cartBean.getItemNo();
		}
		System.out.println(cartBean);
		model.addAttribute("itemNo",itemNo);
		return "redirect:/CartListOld";
	}
	
	@GetMapping("/CartListOld")
	public String cartListOld(Model model,
			@ModelAttribute("itemNo") int itemNo
			) {

//		String username = (String) model.getAttribute("user");
//		if(username == null) {
//			return "redirect:/testUser";
//		}
//		this.username = username;	

		System.out.println("ite:"+itemNo);

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
		model.addAttribute("havePoint",productService.findByUsernametoCart(username)); //--------------------------------------------------------
		model.addAttribute("no",itemNo);
		model.addAttribute("info",username);
		model.addAttribute("cartList",productService.findByItemNo(itemNo));
		return "shopping/CartList";
	}
	
//	public List<Byte[]> productImages(int[] ints,HttpServletResponse resp){
//		Byte[] NoImage = null;
//		String filePath = "/resources/images/NoImage.jpg";
//
//		byte[] media = null;
//		HttpHeaders headers = new HttpHeaders();
//		String filename = "";
//		int len = 0;
//		BookBean bean = productService.getProductId(bookId);
//		if (bean != null) {
//			Blob blob = bean.getCoverImage();
//			filename = bean.getFileName();
//			if (blob != null) {
//				try {
//					len = (int) blob.length();
//					media = blob.getBytes(1, len);  // 第一個位元組(因為JDBC從1開頭)
//				} catch (SQLException e) {
//					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
//				}
//			} else {
//				media = toByteArray(filePath);
//				filename = filePath;
//			}
//		} else {
//			media = toByteArray(filePath);
//			filename = filePath;
//		}
//		headers.setCacheControl(CacheControl.noCache().getHeaderValue());  // 為避免抓錯檔案,不放入快取區
//		String mimeType = servletContext.getMimeType(filename);
//		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("mediaType =" + mediaType);
//		headers.setContentType(mediaType);
//		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
//		return responseEntity;
//		return null;
//	}
	
	
	@GetMapping("/TwoCart")

	public String twoCart(Model model) {

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

	public String allCarts(Model model) {

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
	public List<ListBean> listItem(Model model,
			@RequestParam("itemNo") int itemNo) {
		return productService.findByItemNo(itemNo);
	}
	
	@GetMapping("/DeleteCart")
	public String delete(@RequestParam("itemNo") int itemNo) {
		productService.deleteCartByItemNo(itemNo);
		productService.deleteListByItemNo(itemNo);
		return "redirect:/CartList/no";
	}
	
	@GetMapping("/DeletePartList")
	@ResponseBody
	public String deletePartList(@RequestParam("itemNo") int itemNo,
			@RequestParam("productName") String productName
			) {
		productService.deleteByItemNoAndProductName(itemNo, productName);
		return "delete success";
	}
	
	@GetMapping("/Pay")    
	public String pay(Model model) {
		
		if(model.getAttribute("payProcess") == null) {
			return "redirect:/index";
		}
		
		CartsBean cartsBean = (CartsBean) model.getAttribute("payProcess");
		String[] productNameS = (String[]) model.getAttribute("productNameS");
		int[] numberS = (int[]) model.getAttribute("numberS");
		
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
		
		for (int i = 0; i < productNameS.length; i++) {
			String productName = productNameS[i];
			int number = numberS[i];
			productService.updateNumberAndExistByItemNoAndProductName(number, "Y", itemNo, productName);
		}
		productService.deleteListByItemNo(itemNo);
		return "redirect:/PayFinish";
	}
	
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!　　　預留使用(上:修改,下:紀錄)--順序: [] -> /PayProcess -> $$ -> /Pay
	@GetMapping("/PayProcess")
//	@ResponseBody
	public String payProcess(Model model,HttpServletRequest request,
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
		
		System.out.println("紀錄");
		
		int random = (int) (10000 + ((Math.random() * 1000) + 1));
		System.out.println("random: " + random);
		String randomItemNo = "EEIT" + random + itemNo;  // -----------
		
		CartsBean payProcess = new CartsBean(amount,disPoint,username,itemNo,discount,disAmount,randomItemNo);
		
		model.addAttribute("payProcess",payProcess);
		model.addAttribute("productNameS",productNameS);
		model.addAttribute("numberS",numberS);
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < productNameS.length; i++) {
			if (i + 1 != productNameS.length) {
				sb.append(productNameS[i] + "x" + numberS[i] + "#");
			} else {
				sb.append(productNameS[i] + "x" + numberS[i]);
			}
		}
		String itemName = sb.toString();  // ----------
		System.out.println(itemName);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String now = sdf.format(date);  // ----------
		System.out.println(now);
		
		String stringURL = request.getHeader("Referer");
		String sURL = stringURL.toString().substring(0, stringURL.toString().lastIndexOf("/"));
		System.out.println("send:" + sURL);
		String resultURL = sURL + "/Pay";
		System.out.println(resultURL);
		
		return "redirect:/Pay";
	}
	
	@GetMapping("/AdminCart")

	public String adminFindAll(Model model) {

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

	public String admintatisticsCart(Model model) {

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

	public String admintatisticsList(Model model) {

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
