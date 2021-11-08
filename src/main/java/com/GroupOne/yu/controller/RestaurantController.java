package com.GroupOne.yu.controller;



import java.awt.datatransfer.SystemFlavorMap;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;
import com.GroupOne.yu.services.RestaurantService;


@Controller
public class RestaurantController {
	RestaurantService restaurantService;
	
	@Autowired
	public RestaurantController(RestaurantService restaurantService) {
		this.restaurantService = restaurantService;
	}
	
	//導向餐廳管理畫面
	@GetMapping("/ManageRestaurant")	
	public String ManageRestaurant() {
		return "ManageRestaurant";
	}
	
	//導向菜單管理畫面
		@GetMapping("/ManageMenu1")	
		public String ManageMenu() {
			
			return "ManageMenu";
		}
		

	
	//查詢所有餐廳
	@GetMapping("/searchallrestaurant") //對應前端jsp畫面的value值
	public String list(Model model) {
	List<RestaurantBean> list = restaurantService.findAllRestaurant();
	System.out.println("list size=" + list.size());
	model.addAttribute("rstname", list);
	return "restaurants"; //查詢完進到的jsp頁面
	}
	
	//到更新頁面
	@GetMapping("/UpdateRestaurant")
	public String updateRst() {		
		return "UpdateRestaurant";
	}
	
	
	//依照餐廳名稱更新餐廳資訊
	@PutMapping("/UpdateRestaurant/{rstName}")
	public String updateRestaurant(@ModelAttribute RestaurantBean restaurantBean, 
			BindingResult result, 
			@PathVariable String rstName
			) {
		restaurantService.updateRestaurant(restaurantBean);
	    return "/UpdateRestaurant";
	}  
	
	//查詢單一餐廳
	@GetMapping("/searchonerestaurant")
	public String getRestaurantByRestaurantName(
	        @RequestParam("restaurantName") String rstName, 
	        Model model
	){
		System.out.println("Restaurant Name=" +rstName);
	    model.addAttribute("rstname", restaurantService.findRestaurantByRstName(rstName));
	    return "restaurants";
	}
	
	
	//導向餐廳建立完成 
	@GetMapping("/newarestaurant")	
		public String OpenSuccess() {
			return "NewARestaurant";
		}
	
	//新增餐廳	
	@PostMapping("/OpenSuccess")
	public String processAddNewProductForm(
			@RequestParam("userName") String userName, 
			@RequestParam("mobile") String mobile, 
			@RequestParam("rstname") String rstname, 
			@RequestParam("license") String license, 
			@RequestParam("rstaddress") String rstaddress, 
			@RequestParam("rsttel") String rsttel, 
			@RequestParam("category") String category, 
			@RequestParam("businesshour") String businesshour){
			//@RequestParam("rstImage") Blob rstImage) 
			
	   RestaurantBean restaurant = new RestaurantBean(userName, mobile, rstname, license, rstaddress, rsttel, category, businesshour);
	   restaurantService.addRestaurant(restaurant);
	   System.out.println("餐廳已新增");
	   return "OpenSuccess";
	}
	
	@ModelAttribute("restaurantList")
	public Map<String, String> getRestaurantList() {
	    Map<String, String> restaurantMap = new HashMap<>();
	    List<RestaurantBean> list = restaurantService. findAllRestaurant();
	    for (RestaurantBean rb : list) {
	    	restaurantMap.put(rb.getRstname(), rb.getRsttel());
	    }
	    return restaurantMap;
	}
	
	//刪除餐廳:依據餐廳名稱
	@DeleteMapping("/deleterestaurant/{rstName}")
	public String DeleteRestaurant(@RequestParam("rstName") String rstName) {
		RestaurantBean restaurantBean = new RestaurantBean(rstName);
		restaurantService.DeleteRestaurant(rstName);
	    return "ManageRestaurant";
	}  
}		



