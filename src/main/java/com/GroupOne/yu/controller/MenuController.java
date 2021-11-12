//package com.GroupOne.yu.controller;
//
//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.InputStream;
//
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.sql.Blob;
//import java.sql.SQLException;
//import java.util.List;
//import java.util.Optional;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.sql.rowset.serial.SerialBlob;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.CacheControl;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.StringUtils;
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
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.GroupOne.shoppingcarts.model.ListBean;
//import com.GroupOne.yu.model.MenuBean;
//import com.GroupOne.yu.model.RestaurantBean;
//import com.GroupOne.yu.services.MenuService;
//import com.GroupOne.yu.services.RestaurantService;
//import com.GroupOne.yu.validator.MenuValidator;
//
//@Controller
//public class MenuController {
//
//	MenuService menuService;
//	RestaurantService restaurantService;
//	ServletContext servletContext;
//	String userName = "秦霜原";
//
//	@Autowired
//	public MenuController(MenuService menuService, RestaurantService restaurantService, ServletContext servletContext) {
//		this.menuService = menuService;
//		this.restaurantService = restaurantService;
//		this.servletContext = servletContext;
//	}
//	
//	@RequestMapping("/admin")
//
//	@ModelAttribute("menuBean")
//	public MenuBean menu(@RequestParam(required = false) Integer id) {
//		MenuBean bean = null;
//		return bean;
//	}
//
//	// 餐廳首頁
//	@GetMapping("/top")
//	public String restauranttop() {
//		return "Restaurant_Menu/top";
//	}
//
//	//賣家 管理菜單
//	@GetMapping("/ManageMenu")
//	public String ManageMenu() {
//		return "Restaurant_Menu/ManageMenu";
//	}
//
//	// 賣家 查詢所有餐點
//	@GetMapping("/searchallmenu")
//	public String findAll(Model model) {
//		List<MenuBean> list = menuService.findAll();
//		System.out.println(list.size());
//		model.addAttribute(list);
//		return "Restaurant_Menu/MenuList";
//
//	}
//
//	// 管理者 查詢所有餐點
//	@GetMapping("/queryallmenu")
//	public String menuList(Model model) {
//		List<MenuBean> list = menuService.findAll();
//		System.out.println("list size=" + list.size());
//		model.addAttribute("productName", list);
//		return "Restaurant_Menu/AdminMenu";
//	}
//
//	// 賣家 到新增餐點畫面
//	@GetMapping("/addmenu")
//	public String getAddMenu(Model model) {
//		MenuBean menuBean = new MenuBean();
//		// menuService.addProduct(menuBean);
//		model.addAttribute("menuBean", menuBean);
//		return "Restaurant_Menu/MenuEdit";
//	}
//
//	// 賣家 新增東西到SQL，跳轉到菜色列表畫面
//	// 賣家新增菜單，先抓取餐廳名稱
//	@PostMapping("/addtomenu")
//	public String newMenu(@ModelAttribute MenuBean menuBean) {
//		// 先查餐廳名稱
//		System.out.println(userName);
//		RestaurantBean restaurantBean = restaurantService.findByUserName(userName);
//		// 抓取餐廳名稱
//		System.out.println("123");
//		String rstName1 = restaurantBean.getRstName();
//		System.out.println(456);
//		// 再進行菜色新增
//		menuBean.setRstName(rstName1);
//		menuService.addProduct(menuBean);
//		System.out.println("success");
//		return "redirect:/searchallmenu";
//
//	}
//
//	// 賣家 根據餐廳名稱&菜單名稱去修改菜單
//	@GetMapping("/updateMenu")
//	public String save(Model model, @RequestParam String productName) {
//		// 先查餐廳名稱
//		System.out.println(userName);
//		RestaurantBean restaurantBean = restaurantService.findByUserName(userName);
//		// 抓取餐廳名稱
//		String rstName1 = restaurantBean.getRstName();
//		System.out.println(456);
//		// 再進行菜色修改
//		System.out.println(productName);
//		MenuBean menu = (MenuBean) menuService.findByProductName(productName);
//		model.addAttribute("menu", menu);
//		return "Restaurant_Menu/AdjustMenu";
//	}
//
//	// 修改菜單後送出
//	@GetMapping("/doupdate")
//	public String doUpdate(Model model, @ModelAttribute MenuBean menuBean) {
//		menuService.updateMenu(menuBean);
//		return "redirect:/searchallmenu";
//	}
//
//	// 管理者 (更新)強制下架 (更新一個欄位，避免全部強制更新)
//	@PostMapping("/updateMenuByAdmin")
//	public String updateMenuByAdmin(String rstName, String productName) {
//		return "Restaurant_Menu/AdminRestaurant";
//	}
//
//	// 賣家 刪除菜色
//	@GetMapping("/deleteMenu")
//	public String DeleteMenu(@RequestParam("productName") String productName) {
//		MenuBean optional = menuService.findByProductName(productName);
//		if (optional != null) {
//			menuService.deleteByProductName(productName);
//		} else {
//			throw new RuntimeException(productName + "此菜色不存在");
//		}
//		return "Restaurant_Menu/ManageMenu";
//	}
//
//	// 專門管理員畫面 處理Ajax刪除功能，不跳轉畫面
//	@DeleteMapping("/updateMenuByAdmin")
//	@ResponseBody // 使其不跳轉畫面
//	public void ajaxupdateMenuByAdmin(@RequestParam String rstName, @RequestParam String productName, Model model) throws SQLException {
//		System.out.println("========" + rstName+ "========" + productName);
//		menuService.updateMenuByAdmin("此菜色已下架",rstName,productName);
//	}
//
//
//}
