package com.GroupOne.yu.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.yu.model.MenuBean;
import com.GroupOne.yu.services.MenuService;
import com.GroupOne.yu.validator.MenuValidator;

@Controller
public class MenuController {

	MenuService menuService;

	@Autowired
	public MenuController(MenuService menuService) {
		this.menuService = menuService;
	}
	
	//餐廳首頁
	@GetMapping("/top")
	public String restauranttop() {
		return "top";
	}
	
	//管理餐廳
	@GetMapping("/ManageMenu")	
	public String ManageMenu() {
		return "ManageMenu";
	}
	
	//查詢所有餐點
	@GetMapping("/searchallmenu")
	public String findAll(Model model) {
		List<MenuBean> list = menuService.findAll();
		System.out.println(list.size());
		model.addAttribute(list);
		return "MenuList";
		
	}
	
	//新增餐點
	@GetMapping("/addmenu")
	public String getAddMenu(Model model) {
		//MenuBean menuBean = new MenuBean();
		//menuService.addProduct(menuBean);
	    return "MenuEdit";
	}
	
	//新增完跳轉
	@PostMapping("/addtomenu")
	public String findAll(@ModelAttribute MenuBean menuBean) {
		menuService.addProduct(menuBean);
		System.out.println("success");
		return "redirect:/searchallmenu";
		
	}
	
	
//	@PostMapping("/addmenu")
//	public String AddMenu(
//			@RequestParam("productName") String productName, 
//			@RequestParam(value="dishImage", required=false) Blob dishImage, 
//			@RequestParam("remark") String remark, 
//			@RequestParam("price") String price) {
//	    MenuBean menuBean = new MenuBean(productName, dishImage, remark, price);
//	    menuService.addProduct(menuBean);
//	    return "redirect:/ManageMenu";
//	}

	//圖片上傳功能
	public String fileUpload(@RequestParam("dishImage") MultipartFile file,
								RedirectAttributes redirectAttributes) {
		if (file != null && !file.isEmpty() ) {
			redirectAttributes.addFlashAttribute("message:","請選擇檔案");
			return "redirect:MenuEdit";
		}
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(file.getOriginalFilename());
			Files.write(path, bytes);
			redirectAttributes.addFlashAttribute("message:","成功上傳" 
					+ file.getOriginalFilename() + "'");

		} catch(Exception e) {
			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "redirect:/MenuEdit";
	}
	
	//根據菜單名稱去修改菜單
	@GetMapping("/updateMenu")
	public String save(Model model,@RequestParam String productName) {
		System.out.println(productName);
		MenuBean menu = (MenuBean)menuService.findByProductName(productName);
		model.addAttribute("menu", menu);
		return "AdjustMenu";
	}
	
	@GetMapping("/doupdate")
	public String doUpdate(Model model, @ModelAttribute MenuBean menuBean) {
		menuService.updateMenu(menuBean);
		return "redirect:/searchallmenu";
	}
	
	

	
	//刪除菜色
	@GetMapping("/deleteMenu")
	public String DeleteMenu(@RequestParam("productName") String productName) {
		MenuBean optional = menuService.findByProductName(productName);
		if (optional != null) {
			menuService.DeleteMenu(productName);
		} else {
			throw new RuntimeException(productName + "此菜色不存在");
		}
		return "/ManageMenu";
	}  
	
	
		 
}
	
	
	

