package com.GroupOne.shoppingcarts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes({"payProcess","productNameS","numberS"})
public class PayFinishController {

	@GetMapping("/PayFinish")
	public String removePayProcess(Model model,SessionStatus status) {
		status.setComplete();
		System.out.println("Remove payProcess and productNameS and numberS");
		return "shopping/Pay";
	}
}
