package com.GroupOne.shoppingcarts.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@SessionAttributes({"admin","user"})
@Controller
public class TestController {

//	redirectAttributes.addFlashAttribute("modelData3", "這是加在RedirectAttributes" + "物件內的屬性物件，瀏覽器會顯示");
//	redirectAttributes.addFlashAttribute("uri3", uri);
//	return "redirect:/redirectAnother"; // 傳向新請求,model內無法存取

	@GetMapping({ "/testUser" })
	public String TestUser(Model model) {
		String t1 = (String) model.getAttribute("admin");
		String t2 = (String) model.getAttribute("user");
		if(t1 != null || t2 != null) {
			return "shopping/test/testProduct";
		}
		
		return "shopping/test/testUser";
	}
	
	@GetMapping("/testLoginAdmin")
	public String LoginAdmin(Model model,
			@RequestParam(name = "username", required = false) String username) {
		model.addAttribute("admin",username);
		
		return "redirect:/testProduct";
	}
	
	@GetMapping("/testLoginUser")
	public String LoginUser(Model model,
			@RequestParam(name = "username", required = false) String username) {
		
		model.addAttribute("user",username);
		
		return "redirect:/testProduct";
	}
	
	@GetMapping("/testRemove")
	public String TestRemove(Model model,SessionStatus status) {
		
		status.setComplete();
		System.out.println("Remove admin and user");
		return "redirect:/testProduct";
	}
	
	
	@GetMapping({"/testProduct"})
	public String TestProduct(Model model,HttpServletRequest request) {

		String admin =  (String) model.getAttribute("admin");
		String user = (String) model.getAttribute("user");
		
		System.out.println("admin_name: "+admin);
		System.out.println("user_name: "+user);
		
//		String send = null;

//		String requestURI = request.getRequestURI();
//		System.out.println("URI:"+requestURI);
		String StringURL = request.getHeader("Referer");
//		System.out.println("URL:" + StringURL);
//		try {
//			URL url = new URL(StringURL);

//			System.out.println("URL 為：" + url.toString());
//		System.out.println("URL 為：" + StringURL.toString());

//			System.out.println("協議為：" + url.getProtocol());
//
//			System.out.println("驗證信息：" + url.getAuthority());
//
//			System.out.println("文件名及請求參數：" + url.getFile());
//
//			System.out.println("主機名：" + url.getHost());
//
//			System.out.println("路徑：" + url.getPath());
//
//			System.out.println("埠：" + url.getPort());
//
//			System.out.println("默認埠：" + url.getDefaultPort());

//			send = url.getProtocol()+"://"+url.getAuthority()+"/EEIT133GroupOne_v2.1/";
		String substring1 = StringURL.toString().substring(0, StringURL.toString().lastIndexOf("/") + 1);
//		send = substring1;

//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		}
		System.out.println("send:" + substring1);

//		redirectAttributes.addAttribute("username", username);
//		request.getSession().setAttribute("user", username);
		return "shopping/test/testProduct";
	}
}
