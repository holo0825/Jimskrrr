package com.GroupOne.Albert.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.GroupOne.Albert.members.Member;
import com.GroupOne.Albert.members.oldusers.UserBean;
import com.GroupOne.Albert.service.UserManageService;
@SessionAttributes(names = "user")
@Controller
@RequestMapping("/user")
public class UserEditProfileController {

	UserManageService userManageService;
	
	@Autowired
	public UserEditProfileController(UserManageService userManageService) {
		this.userManageService = userManageService;
	}

	@GetMapping("/UserEditProfile")
	public String userEditProfile(Model model, HttpServletRequest request) {
//		UserBean existingUser = (UserBean)request.getSession().getAttribute("user");
		Member existingUser = (Member)request.getSession().getAttribute("user");
		if (existingUser == null) { 
			return "redirect:/login";
		}
		return "userEditProfile";
	}

	@GetMapping("/UpdateUserProfile")
	public String updateUserProfile(@RequestParam(value="id", required=false) Integer id,
									@RequestParam(value="username", required=false) String username,
									@RequestParam(value="password", required=false) String password,
									@RequestParam(value="fullname", required=false) String fullname,
									@RequestParam(value="dob", required=false) String dob,
									@RequestParam(value="gender", required=false) String gender,
									@RequestParam(value="email", required=false) String email,
									@RequestParam(value="phoneNumber", required=false) String phoneNumber,
									@RequestParam(value="homeNumber", required=false) String homeNumber,
									@RequestParam(value="bonusPoint", defaultValue="0") Float bonusPoint,
									Model model, HttpServletRequest request) throws SQLException {

//		UserBean existingUser = (UserBean)request.getSession().getAttribute("user");
//		Member existingUser = (Member)request.getSession().getAttribute("user");
		Member existingUser = (Member) model.getAttribute("user");
		if (existingUser == null) {
			return "redirect:/login";
		}

		
//		UserBean updateUserProfileBean;
		Member updateUserProfileBean;
//		if (username != null) {
//			updateUserProfileBean = new UserBean(id, username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
			updateUserProfileBean = new Member(id, username, password, fullname, dob, gender, email, phoneNumber, homeNumber, bonusPoint);
			if (updateUserProfileBean != null) {
				userManageService.updateUser(updateUserProfileBean);
//				request.getSession().setAttribute("user", updateUserProfileBean);
				model.addAttribute("user", updateUserProfileBean);
			}
//		}
		return "redirect:/user/home";
	}
}
