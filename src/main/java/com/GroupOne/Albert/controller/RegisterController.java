package com.GroupOne.Albert.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.GroupOne.Albert.model.AdminBean;
import com.GroupOne.Albert.model.SellerBean;
import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.SellerRegisterService;
import com.GroupOne.Albert.service.UserRegisterService;

//import com.mvc.bean.RegisterBean;
//import com.mvc.dao.RegisterDao;

// User註冊和Seller註冊專用的Controller

@Controller
@RequestMapping("/Register")
public class RegisterController {

	UserRegisterService userRegisterService;
	SellerRegisterService sellerRegisterService;
	
	ServletContext servletContext;
	
	//接收Dao執行完回傳的字串用，作為後續判斷轉傳頁面的依據
	String registerStatus;
	
	@Autowired
	public RegisterController(UserRegisterService userRegisterService, SellerRegisterService sellerRegisterService, ServletContext servletContext) {
		super();
		this.userRegisterService = userRegisterService;
		this.sellerRegisterService = sellerRegisterService;
		this.servletContext = servletContext;
	}
	
	@GetMapping("/UserTryRegister")
	public String userTryRegister(Model model) {
//		UserBean userRegister = new UserBean();
//		UserBean userRegister = null; // 千萬不可以設定為null，如果下一頁的modelAttribute必須接受一個名為userRegister的物件，會出現錯誤
//		model.addAttribute("userRegister", userRegister);
		return "userRegister";
		// userRegister.jsp 為買家用戶註冊頁面
	}

	@GetMapping("/SellerTryRegister")
	public String sellerTryRegister(Model model) {
//		SellerBean sellerRegister = new SellerBean();
//		SellerBean sellerRegister = null; // 千萬不可以設定為null，如果下一頁的modelAttribute必須接受一個名為sellerRegister的物件，會出現錯誤
//		model.addAttribute("sellerRegister", sellerRegister);
		return "sellerRegister";
		// sellerRegister.jsp 為賣家用戶註冊頁面
	}
	
	@GetMapping("/insertuser")
	public String registerUser(@RequestParam String username,
							   @RequestParam String password,
							   @RequestParam String fullname,
							   @RequestParam String dob,
							   @RequestParam String gender,
							   @RequestParam String email,
							   @RequestParam String phoneNumber,
							   @RequestParam String homeNumber,
							   @RequestParam(value="bonusPoint", required = false) Float bonusPoint,
							   Model model) {
		bonusPoint = (float) 0;
		UserBean userBean = new UserBean(username,password,fullname,dob,gender,email,phoneNumber,homeNumber,bonusPoint);
//		registerStatus = registerDao.registerUser(userBean);
//		registerStatus = rService.registerUser(userBean);
		registerStatus = userRegisterService.registerUser(userBean);
		String destPage = "";
		if (registerStatus.equals("買家用戶註冊成功！")) {
			System.out.println(registerStatus);
			destPage = "redirect:/UserTryLogin";
		} else if (registerStatus.equals("買家用戶註冊失敗，請再次確認")) {
			System.out.println(registerStatus);
			destPage = "userRegister";
		}
		return destPage;
	}

	@GetMapping("/insertseller")
	public String registerSeller(@RequestParam String username,
								 @RequestParam String password,
								 @RequestParam String fullname,
								 @RequestParam(required=false) String dob,
								 @RequestParam(required=false) String gender,
								 @RequestParam String email,
								 @RequestParam String phoneNumber,
								 @RequestParam String telephoneNumber,
								 @RequestParam(required=false) String extensionNumber,
								 @RequestParam String companyName,
								 @RequestParam String companyAddress,
								 @RequestParam(value = "businessCert", required = false) Byte[] businessCert,
//								 @RequestParam(value="verifyStatus", required = false) Boolean verifyStatus,
								 Model model) {
		businessCert = null;
		Boolean verifyStatus = false;
		SellerBean sellerBean = new SellerBean(username,password,fullname,
											   dob,gender,email,phoneNumber,
											   telephoneNumber,extensionNumber,companyName,
											   companyAddress,businessCert,verifyStatus);
//		registerStatus = registerDao.registerSeller(sellerBean);
//		registerStatus = rDao.registerSeller(sellerBean);
		registerStatus = sellerRegisterService.registerSeller(sellerBean);
		String destPage = "";
		if (registerStatus.equals("賣家用戶註冊成功！")) {
			System.out.println(registerStatus);
			destPage = "redirect:/SellerTryLogin";
		} else if (registerStatus.equals("賣家用戶註冊失敗，請再次確認")) {
			System.out.println(registerStatus);
			destPage = "sellerRegister";
		}
		return destPage;
	}
	

				

		/*	

			// 判斷身分及註冊是否成功，決定導向哪個頁面
			if (registerStatus.equals("買家用戶註冊成功！")) // On success, you can display a message to user on Home page
			{
				request.getRequestDispatcher("/userLogin.jsp").forward(request, response);
			} else if (registerStatus.equals("賣家用戶註冊成功！")) {
				request.getRequestDispatcher("/sellerLogin.jsp").forward(request, response);

				// On Failure, display a meaningful message to the User.
			} else if (registerStatus.equals("買家用戶註冊失敗，請再次確認")) {
				request.setAttribute("errMessage", registerStatus);
				request.getRequestDispatcher("/UserRegisterFrom.jsp").forward(request, response);

				// On Failure, display a meaningful message to the User.
			} else if (registerStatus.equals("賣家用戶註冊失敗，請再次確認")) {
				request.setAttribute("errMessage", registerStatus);
				request.getRequestDispatcher("/SellerRegisterForm.jsp").forward(request, response);

			}

		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
			if (action.equals("insertUser")) {
				request.setAttribute("errMessage", "買家資料輸入錯誤，請再次確認");
				request.getRequestDispatcher("/UserRegisterForm.jsp").forward(request, response);

			} else if (action.equals("insertSeller")) {
				request.setAttribute("errMessage", "賣家資料輸入錯誤，請再次確認");
				request.getRequestDispatcher("/SellerRegisterForm.jsp").forward(request, response);

			}

		}
	
	*/

}