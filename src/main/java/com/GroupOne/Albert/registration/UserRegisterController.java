package com.GroupOne.Albert.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.GroupOne.Albert.OAuth2.Provider;
import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.MemberRole;
import com.GroupOne.Albert.members.oldusers.AdminBean;
import com.GroupOne.Albert.members.oldusers.SellerBean;
import com.GroupOne.Albert.members.oldusers.UserBean;
import com.GroupOne.Albert.service.SellerRegisterService;
import com.GroupOne.Albert.service.UserRegisterService;

import com.GroupOne.Albert.registration.service.MemberService;
import com.GroupOne.Albert.registration.validator.SellerRegisterValidator;
//import _00_init.util.GlobalService;
import com.GroupOne.Albert.registration.validator.UserRegisterValidator;

//import com.mvc.bean.RegisterBean;
//import com.mvc.dao.RegisterDao;

// User註冊和Seller註冊專用的Controller

@Controller
@RequestMapping("/register")
public class UserRegisterController {

	private static Logger log = LoggerFactory.getLogger(UserRegisterController.class);	
	String rootDirectory = "d:\\images";
//	String inputDataForm = "_01_register/registerForm";
	MemberService memberService;
	BCryptPasswordEncoder passwordEncoder;
	
	//-----------------------------------------------------
	UserRegisterService userRegisterService;
	SellerRegisterService sellerRegisterService;
	
	ServletContext servletContext;
	
	//接收Dao執行完回傳的字串用，作為後續判斷轉傳頁面的依據
	String registerStatus;
	//-----------------------------------------------------
	
	@Autowired
	public UserRegisterController(UserRegisterService userRegisterService, 
							  SellerRegisterService sellerRegisterService, 
							  ServletContext servletContext, 
							  BCryptPasswordEncoder passwordEncoder,
							  MemberService memberService) {
		this.userRegisterService = userRegisterService;
		this.sellerRegisterService = sellerRegisterService;
		this.servletContext = servletContext;
		this.passwordEncoder = passwordEncoder;
		this.memberService = memberService;
	}
	
//	@GetMapping("/register/user")
	@GetMapping("/user")
	public String showUserRegistrationForm(Model model) {
//	    model.addAttribute("userRegisterBean", new Member());
	    return "register_user";
	}

////	@GetMapping("/register/seller")
//	@GetMapping("/seller")
//	public String showSellerRegistrationForm(Model model) {
//		model.addAttribute("sellerRegisterBean", new Member());
//		return "register_seller";
//	}
	
	@PostMapping("/process_user")
	public String processUserRegister(Model model,
									  @RequestParam String username,
									  @RequestParam String email,
									  @RequestParam String password,
									  @RequestParam String password1,
									  @RequestParam String fullname,
									  @RequestParam String dob,
									  @RequestParam String gender,
									  @RequestParam String phoneNumber,
									  @RequestParam(required = false) String homeNumber,
									  @RequestParam MultipartFile memberMultipartFile,
									  @ModelAttribute("userRegisterBean") Member userRegisterBean,
									  BindingResult result,
									  RedirectAttributes redirectAttributes
									  ) {
		userRegisterBean.setUsername(username);
		userRegisterBean.setEmail(email);
		
		userRegisterBean.setPassword(password);
		userRegisterBean.setPassword1(password1);
		
		userRegisterBean.setFullname(fullname);
		userRegisterBean.setDob(dob);
		userRegisterBean.setGender(gender);
		userRegisterBean.setPhoneNumber(phoneNumber);
		if (homeNumber!=null) {
			userRegisterBean.setHomeNumber(homeNumber);
		}
		userRegisterBean.setMemberMultipartFile(memberMultipartFile);
		
		UserRegisterValidator validator = new UserRegisterValidator();
		validator.validate(userRegisterBean, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("有錯誤：" + error);
//			}
//			return inputDataForm;
			return "register_user";
		}
		
		MultipartFile picture = userRegisterBean.getMemberMultipartFile();
		String originalFilename = picture.getOriginalFilename();
		
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			userRegisterBean.setFileName(originalFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				userRegisterBean.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
        String mimeType = servletContext.getMimeType(originalFilename); 
        userRegisterBean.setMimeType(mimeType);
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		userRegisterBean.setRegisterTime(registerTime);
		
		// 檢查 memberId是否重複
		if (memberService.findByUsername(userRegisterBean.getUsername()) != null) {
//		if (memberService.existsById(userRegisterBean.getMemberId())) {
			result.rejectValue("username", "", "帳號已存在，請重新輸入");
//			result.rejectValue("memberId", "", "帳號已存在，請重新輸入");
//			return inputDataForm;
			return "register_user";
		}
		
//		bean.setPassword(GlobalService.getMD5Endocing(
//				GlobalService.encryptString(userRegisterBean.getPassword())));
		userRegisterBean.setPassword(passwordEncoder.encode(userRegisterBean.getPassword()));
		
		userRegisterBean.setMemberRole(MemberRole.ROLE_USER);
		userRegisterBean.setProvider(Provider.LOCAL);
		userRegisterBean.setBonusPoint((float) 0);
		userRegisterBean.setEnabled(false);
		
		try {
			memberService.save(userRegisterBean);
			log.info("寫入MemberBean物件：" + userRegisterBean);
			redirectAttributes.addFlashAttribute("SUCCESS", "會員: " + userRegisterBean.getUsername() +  "資料新增成功");
		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("username", "", "發生異常，請通知系統人員..." + ex.getMessage());
//			result.rejectValue("memberId", "", "發生異常，請通知系統人員..." + ex.getMessage());
//			return inputDataForm;
			return "/register/user";
		}
		// 將上傳的檔案移到指定的資料夾, 目前註解此功能
//		String ext = "";
//		if (originalFilename.lastIndexOf(".") > -1) {
//			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		}
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "MemberImage_" + bean.getMemberId() + ext);
//			picture.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		redirectAttributes.addFlashAttribute("register_success", "恭喜您成功註冊為一般會員，請先確認您的信箱");
		
//		return "redirect:/";
		return "redirect:/login";
	}

		
		@ModelAttribute("userRegisterBean")
		public Member prepareUserMemberBean(HttpServletRequest req) {
			Member userRegisterBean = new Member();
//			memberBean.setTotalAmt(0.0);
//			memberBean.setUnpaid_amount(0.0);
//			memberBean.setUserType("M");
			return userRegisterBean;
		}

}