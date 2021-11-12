package com.GroupOne.Albert.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GroupOne.Albert.dao.UserManageRepository;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.UserBean;
import com.GroupOne.Albert.service.UserManageService;

// Admin管理User會員專用的Controller
@Controller
//@RequestMapping("/UserAll")
@RequestMapping("/admin")
public class UserManageController {

	UserManageService umService;
	
	ServletContext servletContext;

	@Autowired
	public UserManageController(UserManageService umService, ServletContext servletContext) {
		this.umService = umService;
		this.servletContext = servletContext;
	}

	@GetMapping("/listuser")
	public String listUser(Model model) {
//		List<UserBean> listUser = umService.selectAllUsers();
		List<Member> listUser = umService.selectAllUsers();
		model.addAttribute("listUser", listUser);
//		return "user-list";
		return "_new_user_list";
	}

	@GetMapping("/newuser")
	public String showNewForm(Model model) {
		return "user-form";
	}
	
	// 點選編輯按鈕，抓取PathVariable的userId，根據userId查詢使用者資料，並填入編輯表單輸入框
//	@GetMapping("/edituser")
	@GetMapping("/edituser/{userId}")
//	public String showEditForm(@RequestParam("id") int id, Model model) {
	public String showEditForm(@PathVariable("userId") int userId, Model model) {
//		UserBean existingUser = umService.selectUser(userId);
		Member existingUser = umService.selectUser(userId);
		model.addAttribute("user", existingUser);
		return "user-form";
	}

	@GetMapping("/insertuser")
	public String insertUser(@RequestParam String username,
							 @RequestParam String password,
							 @RequestParam String fullname,
							 @RequestParam String dob,
							 @RequestParam String gender,
							 @RequestParam String email,
							 @RequestParam String phoneNumber,
							 @RequestParam String homeNumber,
							 @RequestParam(value="bonusPoint", defaultValue="0") float bonusPoint,
							 Model model) throws SQLException {

//		UserBean newUser = new UserBean(username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		Member newUser = new Member(username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		umService.insertUser(newUser);
		return "redirect:/UserAll/listuser";
	}

	@GetMapping("/updateuser")
//	@GetMapping("/updateuser/{userId}")
	public String updateUser(@RequestParam int id,
//	public String updateUser(@PathVariable int userId,
							@RequestParam String username,
							@RequestParam String password,
							@RequestParam String fullname,
							@RequestParam String dob,
							@RequestParam String gender,
							@RequestParam String email,
							@RequestParam String phoneNumber,
							@RequestParam String homeNumber,
							@RequestParam(value="bonusPoint", defaultValue="0") float bonusPoint,
							Model model) throws SQLException {
		
//		UserBean book = new UserBean(id, username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		Member book = new Member(id, username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		umService.updateUser(book);
		return "redirect:/UserAll/listuser";
	}

//	@GetMapping("/deleteuser")
	@GetMapping("/deleteuser/{userId}")
//	public String deleteUser(@RequestParam int id, Model model) throws SQLException{
	public String deleteUser(@PathVariable int userId, Model model) throws SQLException{
		umService.deleteUser(userId);
		return "redirect:/UserAll/listuser";
	}
	
//--------------------------------------------------------------------------

	// 專門處理Ajax刪除功能，不跳轉畫面
	@DeleteMapping("/ajaxdeleteuser/{userId}")
	@ResponseBody
	public void ajaxDeleteUser(@PathVariable int userId, Model model) throws SQLException {
		System.out.println("===========================" + userId);
		umService.deleteUser(userId);
	}
	
	// 專門處理Ajax全查詢功能
	@GetMapping("/ajaxlistuser")
	@ResponseBody
	public String ajaxListUser(Model model) {
//		List<UserBean> listUser = umService.selectAllUsers();
		List<Member> listUser = umService.selectAllUsers();
		model.addAttribute("listUser", listUser);
		return "user-list";
	}
	
	// 專門處理Ajax更新功能
//	@ResponseBody
	@PutMapping("/ajaxupdateuser")
	public String ajaxUpdateUser(@RequestParam int id,
								@RequestParam String username,
								@RequestParam String password,
								@RequestParam String fullname,
								@RequestParam String dob,
								@RequestParam String gender,
								@RequestParam String email,
								@RequestParam String phoneNumber,
								@RequestParam String homeNumber,
								@RequestParam(value="bonusPoint", defaultValue="0") float bonusPoint,
								Model model) throws SQLException {
		
//		UserBean book = new UserBean(id, username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		Member book = new Member(id, username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		umService.updateUser(book);
		return "redirect:/UserAll/listuser";
	}
	
	// 專門處理Ajax新增功能
	@PostMapping("/ajaxinsertuser")
	public String ajaxInsertUser(@RequestParam String username,
								@RequestParam String password,
								@RequestParam String fullname,
								@RequestParam String dob,
								@RequestParam String gender,
								@RequestParam String email,
								@RequestParam String phoneNumber,
								@RequestParam String homeNumber,
								@RequestParam(value="bonusPoint", defaultValue="0") float bonusPoint,
								Model model) throws SQLException {
			
//		UserBean newUser = new UserBean(username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		Member newUser = new Member(username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
		umService.insertUser(newUser);
		return "redirect:/UserAll/listuser";
	}

}
