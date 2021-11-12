package com.GroupOne.Albert.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

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

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.service.SellerManageService;

// Admin管理Seller會員專用的Controller
@Controller 
//@RequestMapping("/SellerAll")
@RequestMapping("/admin")
public class SellerManageController {
	
	SellerManageService smService;
	
	ServletContext servletContext;

	@Autowired
	public SellerManageController(SellerManageService smService, ServletContext servletContext) {
		this.smService = smService;
		this.servletContext = servletContext;
	}
	
	@GetMapping("/listseller")
	public String listSeller(Model model) {
//		List<SellerBean> listSeller = smService.selectAllSellers();
		List<Member> listSeller = smService.selectAllSellers();
		model.addAttribute("listSeller", listSeller);
//		return "seller-list";
		return "_new_seller_list";
	}

	@GetMapping("/newseller")
	public String showNewForm(Model model)
			throws ServletException, IOException {
		return "seller-form";
	}
	
	// 點選編輯按鈕，抓取PathVariable的sellerId，根據sellerId查詢使用者資料，並填入編輯表單輸入框
//	@GetMapping("/editseller")
	@GetMapping("/editseller/{sellerId}")
//	public String showEditForm(@RequestParam("id") int id, Model model) {
	public String showEditForm(@PathVariable("sellerId") int sellerId, Model model) {
//		SellerBean existingSeller = smService.selectSeller(sellerId);
		Member existingSeller = smService.selectSeller(sellerId);
		model.addAttribute("seller", existingSeller);
		return "seller-form";
	}

	@GetMapping("/insertseller")
	public String insertSeller(@RequestParam String username,
							   @RequestParam String password,
							   @RequestParam String fullname,
							   @RequestParam String dob,
							   @RequestParam String gender,
							   @RequestParam String email,
							   @RequestParam String phoneNumber,
							   @RequestParam String telephoneNumber,
							   @RequestParam String extensionNumber,
							   @RequestParam String companyName,
							   @RequestParam String companyAddress,
							   @RequestParam(value = "businessCert", required = false) Byte[] businessCert,
							   @RequestParam(value="verifyStatus", required = false, defaultValue = "false") Boolean verifyStatus,
							   Model model) throws SQLException {
		businessCert = null;
		
//		SellerBean newSeller = new SellerBean(username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		Member newSeller = new Member(username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		smService.insertSeller(newSeller);
		return "redirect:/SellerAll/listseller";
	}

	@GetMapping("/updateseller")
//	@GetMapping("/updateseller/{sellerId}")
	public String updateSeller(@RequestParam int id,
//	public String updateSeller(@PathVariable int sellerId,
							   @RequestParam String username,
							   @RequestParam String password,
							   @RequestParam String fullname,
							   @RequestParam String dob,
							   @RequestParam String gender,
							   @RequestParam String email,
							   @RequestParam String phoneNumber,
							   @RequestParam String telephoneNumber,
							   @RequestParam String extensionNumber,
							   @RequestParam String companyName,
							   @RequestParam String companyAddress,
							   @RequestParam Byte[] businessCert,
							   @RequestParam(value="bonusPoint", defaultValue="false") Boolean verifyStatus,
							   Model model) throws SQLException {

//		SellerBean book = new SellerBean(id, username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		Member book = new Member(id, username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		smService.updateSeller(book);
		return "redirect:/SellerAll/listseller";
	}

//	@GetMapping("/deleteseller")
	@GetMapping("/deleteseller/{sellerId}")
//	public String deleteSeller(@RequestParam int id, Model model) throws SQLException {
	public String deleteSeller(@PathVariable int sellerId, Model model) throws SQLException {
		smService.deleteSeller(sellerId);
		return "redirect:/SellerAll/listseller";
	}
	
//--------------------------------------------------------------------------
	
	// 專門處理Ajax刪除功能，不跳轉畫面
	@DeleteMapping("/ajaxdeleteseller/{sellerId}")
	@ResponseBody
	public void ajaxDeleteUser(@PathVariable int sellerId, Model model) throws SQLException {
		System.out.println("===========================" + sellerId);
		smService.deleteSeller(sellerId);
	}
	
	// 專門處理Ajax全查詢功能
	@GetMapping("/ajaxlistseller")
	@ResponseBody
	public String ajaxListSeller(Model model) {
//		List<SellerBean> listSeller = smService.selectAllSellers();
		List<Member> listSeller = smService.selectAllSellers();
		model.addAttribute("listSeller", listSeller);
		return "seller-list";
	}
	
	// 專門處理Ajax更新功能
	@PutMapping("/ajaxupdateseller")
	public String ajaxUpdateSeller(@RequestParam int id,
								@RequestParam String username,
								@RequestParam String password,
								@RequestParam String fullname,
								@RequestParam String dob,
								@RequestParam String gender,
								@RequestParam String email,
								@RequestParam String phoneNumber,
								@RequestParam String telephoneNumber,
								@RequestParam String extensionNumber,
								@RequestParam String companyName,
								@RequestParam String companyAddress,
								@RequestParam Byte[] businessCert,
								@RequestParam(value="bonusPoint", defaultValue="false") Boolean verifyStatus,
								Model model) throws SQLException {
		
//		SellerBean book = new SellerBean(id, username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		Member book = new Member(id, username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		smService.updateSeller(book);
		return "redirect:/SellerAll/listseller";
	}
	
	// 專門處理Ajax新增功能
	@PostMapping("/ajaxinsertseller")
	public String ajaxInsertSeller(@RequestParam String username,
								@RequestParam String password,
								@RequestParam String fullname,
								@RequestParam String dob,
								@RequestParam String gender,
								@RequestParam String email,
								@RequestParam String phoneNumber,
								@RequestParam String telephoneNumber,
								@RequestParam String extensionNumber,
								@RequestParam String companyName,
								@RequestParam String companyAddress,
								@RequestParam(value = "businessCert", required = false) Byte[] businessCert,
								@RequestParam(value="verifyStatus", required = false, defaultValue = "false") Boolean verifyStatus,
								Model model) throws SQLException {
		businessCert = null;
		
//		SellerBean newSeller = new SellerBean(username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		Member newSeller = new Member(username, password, fullname, dob, gender, email, phoneNumber, telephoneNumber, extensionNumber, companyName, companyAddress, businessCert, verifyStatus);
		smService.insertSeller(newSeller);
		return "redirect:/SellerAll/listseller";
	}
}
