package com.GroupOne.yu.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;
import com.GroupOne.yu.services.MenuService;
import com.GroupOne.yu.services.RestaurantService;

//多身分別用Controller

@Controller
public class RestaurantMainController {

	RestaurantService restaurantService;
	MenuService menuService;
	ServletContext servletContext;
	String userName = "秦霜原";

	@Autowired
	public RestaurantMainController(RestaurantService restaurantService, MenuService menuService,
			ServletContext servletContext) {
		this.restaurantService = restaurantService;
		this.menuService = menuService;
		this.servletContext = servletContext;
	}

	@ModelAttribute("menuBean")
	public MenuBean menu(@RequestParam(required = false) Integer id) {
		MenuBean bean = null;
		return bean;
	}

	// 餐廳首頁
	@GetMapping("top")
	public String restauranttop() {
		return "Restaurant_Menu/top";
	}

	// 買家 查詢所有餐廳
	@GetMapping("/searchallrestaurant") // 對應前端jsp畫面的value值
	public String list(Model model) {
		List<RestaurantBean> list = restaurantService.findAllRestaurant();
		System.out.println("list size=" + list.size());
		model.addAttribute("rstName", list);
		return "Restaurant_Menu/restaurants"; // 查詢完進到的jsp頁面
	}

	// 買家 導向點擊之餐廳 菜單畫面
	@GetMapping("/menuforrestaurant{rstName}")
	public String MenuforRestaurant(Model model, @PathVariable String rstName) {
		List<MenuBean> menu = menuService.findByRstName(rstName);
		model.addAttribute("productName", menu);
		return "Restaurant_Menu/menuforrestaurant";
	}

	// 買家 查詢單一餐廳
	@GetMapping("/SearchOneRestaurant")
	public String getRestaurantByRestaurantName(@RequestParam("restaurantName") String rstName, Model model) {
		// RestaurantBean restaurantBean = new RestaurantBean();
		// RestaurantBean beans = restaurantService.findByRstName(rstName);
		System.out.println("Restaurant Name=" + rstName);
		model.addAttribute("rstName", restaurantService.findByRstName(rstName));
		return "Restaurant_Menu/SearchOneRestaurant";
	}

	//買家 商品加入購物車，導向購物車畫面
	@GetMapping(value = "/user/OrderForm")
	public String sellerForm(Model model, RedirectAttributes red, @RequestParam(value = "rstName") String rstName,
			@RequestParam(value = "productName") String productName, @RequestParam(value = "price") String price,
			@RequestParam(value = "number") String number) {

		red.addAttribute("rstName", rstName);
		red.addAttribute("name", productName); // "name"要跟團購的名稱相同
		red.addAttribute("price", price);
		red.addAttribute("number", number);
		red.addAttribute("category", "food");
		// model.addAttribute("cart", cart);

		return "redirect:/user/CartListNew";
	}
}
