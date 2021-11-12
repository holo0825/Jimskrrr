//package com.GroupOne.yu.controller;
//
//
//
//import java.awt.datatransfer.SystemFlavorMap;
//import java.sql.Blob;
//import java.sql.SQLException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Optional;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import com.GroupOne.yu.model.MenuBean;
//import com.GroupOne.yu.model.RestaurantBean;
//import com.GroupOne.yu.services.MenuService;
//import com.GroupOne.yu.services.RestaurantService;
//
//
//@Controller
//@SessionAttributes({"admin", "user", "seller"})
////@RequestMapping("/admin")
//public class RestaurantController {
//	RestaurantService restaurantService;
//	MenuService menuService;
//	
//	@Autowired
//	public RestaurantController(RestaurantService restaurantService,MenuService menuService) {
//		this.restaurantService = restaurantService;
//		this.menuService = menuService;
//	}
//		
//	//導向餐廳菜單畫面
//	@GetMapping("/menuforrestaurant{rstName}")
//	public String MenuforRestaurant(Model model, @PathVariable String rstName) {
//		List<MenuBean> menu = menuService.findByRstName(rstName);
//		model.addAttribute("productName", menu);
//		return "Restaurant_Menu/menuforrestaurant";
//	}	
//			
//	//導向餐廳管理畫面
//	@GetMapping("/ManageRestaurant")	
//	public String ManageRestaurant() {
//		return "Restaurant_Menu/ManageRestaurant";
//	}
//	
//	//導向菜單管理畫面
//		@GetMapping("/ManageMenu1")	
//		public String ManageMenu() {			
//			return "Restaurant_Menu/ManageMenu";
//		}
//		
//	//導向餐廳列表畫面
//		@GetMapping("/restaurants")	
//		public String Restaurants() {					
//			return "Restaurant_Menu/restaurants";
//		}
//		
//
//	//(身分別判斷)之後改依照餐廳名稱以及使用者名稱來新刪改查餐廳
//	
//	//買家 查詢所有餐廳
//	@GetMapping("/searchallrestaurant") //對應前端jsp畫面的value值
//	public String list(Model model) {
//	List<RestaurantBean> list = restaurantService.findAllRestaurant();
//	System.out.println("list size=" + list.size());
//	model.addAttribute("rstName", list);
//	return "Restaurant_Menu/restaurants"; //查詢完進到的jsp頁面
//	}
//	
//	//管理者 查詢所有餐廳
//	@GetMapping("/queryallrestaurant") 
//	public String restaurantList(Model model) {
//	List<RestaurantBean> list = restaurantService.findAllRestaurant();
//	System.out.println("list size=" + list.size());
//	model.addAttribute("rstName", list);
//	return "Restaurant_Menu/AdminRestaurant"; 
//	}
//	
//	//到更新頁面(for 賣家)
//	@GetMapping("/UpdateRestaurant")
//	public String updateRst() {		
//		return "Restaurant_Menu/UpdateRestaurant";
//	}
//	
//	
//	//賣家 依照餐廳名稱更新餐廳資訊
//	@PostMapping("/UpdateRestaurant/{rstName}")
//	public String updateRestaurant(@ModelAttribute RestaurantBean restaurantBean, 
//			BindingResult result, 
//			@PathVariable String rstName
//			){
//		//未來加上session判斷		
//		restaurantService.updateRestaurant(restaurantBean);
//	    return "Restaurant_Menu/UpdateRestaurant";
//	}  
//	
//	//管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
//	@PostMapping("/updateRestaurantByAdmin")
//	public String updateRestaurantByAdmin(String userName, String rstName) {
//		return "Restaurant_Menu/AdminRestaurant";
//	}
//	
//	//消費者&賣家 查詢單一餐廳
//	@GetMapping("/SearchOneRestaurant")
//	public String getRestaurantByRestaurantName(
//	        @RequestParam("restaurantName") String rstName, 
//	        Model model
//	){
//	//	RestaurantBean restaurantBean = new RestaurantBean();
//	//	RestaurantBean beans = restaurantService.findByRstName(rstName);
//		System.out.println("Restaurant Name=" +rstName);
//	    model.addAttribute("rstName", restaurantService.findByRstName(rstName));
//	    return "Restaurant_Menu/SearchOneRestaurant";
//	}
//	
//	
//	//導向餐廳建立完成 
//	@GetMapping("/newarestaurant")	
//		public String OpenSuccess() {
//			return "Restaurant_Menu/NewARestaurant";
//		}
//	
//	//賣家 新增餐廳	
//	@PostMapping("/OpenSuccess")
//	public String processAddNewProductForm(
//			@RequestParam("userName") String userName, 
//			@RequestParam("mobile") String mobile, 
//			@RequestParam("rstName") String rstName, 
//			@RequestParam("license") String license, 
//			@RequestParam("rstAddress") String rstAddress, 
//			@RequestParam("rstTel") String rstTel, 
//			@RequestParam("category") String category, 
//			@RequestParam("businessHour") String businessHour){
//			//@RequestParam("rstImage") Blob rstImage) 
//			
//	   RestaurantBean restaurant = new RestaurantBean(userName, mobile, rstName, license, rstAddress, rstTel, category, businessHour);
//	   restaurantService.addRestaurant(restaurant);
//	   System.out.println("餐廳已新增");
//	   return "Restaurant_Menu/OpenSuccess";
//	}
//	
//	@ModelAttribute("restaurantList")
//	public Map<String, String> getRestaurantList() {
//	    Map<String, String> restaurantMap = new HashMap<>();
//	    List<RestaurantBean> list = restaurantService. findAllRestaurant();
//	    for (RestaurantBean rb : list) {
//	    	restaurantMap.put(rb.getRstName(), rb.getRstTel());
//	    }
//	    return restaurantMap;
//	}
//	
//	//賣家 刪除餐廳:依據餐廳名稱
//	@DeleteMapping("/deleterestaurant/{rstName}")
//	public String DeleteRestaurant(@RequestParam("rstName") String rstName) {
//		RestaurantBean restaurantBean = new RestaurantBean(rstName);
//		restaurantService.deleteByRstName(rstName);
//	    return "Restaurant_Menu/ManageRestaurant";
//	}  
//	
//	// 專門管理員畫面 處理Ajax 下架功能，不跳轉畫面
//		@DeleteMapping("/updateRestaurantByAdmin")
//		@ResponseBody // 使其不跳轉畫面
//		public void ajaxUpdateRestaurantByAdmin(@RequestParam String userName, @RequestParam String rstName, Model model) throws SQLException {
//			System.out.println("========" +userName+ "========" + rstName);
//			restaurantService.updateRestaurantByAdmin("此餐廳已下架",userName,rstName);
//		}
//}		
//
//
//
