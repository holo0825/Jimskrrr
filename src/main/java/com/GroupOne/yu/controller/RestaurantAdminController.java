package com.GroupOne.yu.controller;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.model.RestaurantBean;
import com.GroupOne.yu.services.MenuService;
import com.GroupOne.yu.services.RestaurantService;

//管理員用Controller
@Controller
@SessionAttributes("admin")
@RequestMapping("/admin")
public class RestaurantAdminController {
	RestaurantService restaurantService;
	MenuService menuService;
	ServletContext servletContext;
	String userName = "秦霜原";

	@Autowired
	public RestaurantAdminController(RestaurantService restaurantService, MenuService menuService,
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

	// ----------餐廳----------

	// 管理者 查詢所有餐廳
	@GetMapping("/queryallrestaurant")
	public String restaurantList(Model model) {
		List<RestaurantBean> list = restaurantService.findAllRestaurant();
		System.out.println("list size=" + list.size());
		model.addAttribute("rstName", list);
		return "Restaurant_Menu/AdminRestaurant";
	}

	// 管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
	@PostMapping("/updateRestaurantByAdmin")
	public String updateRestaurantByAdmin(String userName, String rstName) {
		return "Restaurant_Menu/AdminRestaurant";
	}

	// 專門管理員畫面 處理Ajax 下架功能，不跳轉畫面
	@DeleteMapping("/updateRestaurantByAdmin")
	@ResponseBody // 使其不跳轉畫面
	public void ajaxUpdateRestaurantByAdmin(@RequestParam String userName, @RequestParam String rstName, Model model)
			throws SQLException {
		System.out.println("========" + userName + "========" + rstName);
		restaurantService.updateRestaurantByAdmin("此餐廳已下架", userName, rstName);
	}

	// ----------菜單----------

	// 管理者 查詢所有餐點
	@GetMapping("/queryallmenu")
	public String menuList(Model model) {
		List<MenuBean> list = menuService.findAll();
		model.addAttribute("productName", list);
		return "Restaurant_Menu/AdminMenu";
	}

	// 管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
	@PostMapping("/updateMenuByAdmin")
	public String updateMenuByAdmin(String rstName, String productName) {
		return "Restaurant_Menu/AdminRestaurant";
	}

}
