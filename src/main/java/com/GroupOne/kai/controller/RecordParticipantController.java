package com.GroupOne.kai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.kai.model.RecordParticipantBean;
import com.GroupOne.kai.service.RecordParticipantService;

@Controller
public class RecordParticipantController {
	
	RecordParticipantService recordParticipantService;

	public RecordParticipantController(RecordParticipantService recordParticipantService) {
		
		this.recordParticipantService = recordParticipantService;
	}
	
	//[後端]顯示所有顧客資料
	@GetMapping("/RecordParticipantBack")
	public String list(Model model) {
			List<RecordParticipantBean> recordParticipantList = recordParticipantService.selectAllUsers();
			//抓 JSP的<c:forEach var="..." items="${...}">存回model.addAttribute
			model.addAttribute("recordParticipantList", recordParticipantList);

			
			return "RecordParticipantBack";
		}
	
	//[前端]Post帶資料新增 抓ID問題要處里
	@PostMapping("/GroupOne_Activity/activitypage")
	public String RecordParticipantInsert(@ModelAttribute("RecordParticipant") RecordParticipantBean recordParticipant) {
			RecordParticipantBean recordParticipantBean = new RecordParticipantBean();
			ActivityBean activityBean = new ActivityBean();
			System.out.println("******************"+recordParticipant.getRecordId());

			return "redirect:/RecordParticipantBack";

		}
		
	//[前端]先Get新增V
	@PostMapping("/activitypage{id}")
	public String processRecordParticipantInsert1(
			@ModelAttribute("RecordParticipant") RecordParticipantBean recordParticipant 
				,@PathVariable Integer id,Model model) {
						
		System.out.println("+++POST++立即澳名按下++++++>"+recordParticipant.getActivity_topic());
		model.addAttribute("RecordParticipant",recordParticipant);

		return "redirect:/activitypage?id={id}";
		
		}
	//[後端]確認刪除ID後V
		@GetMapping("/delete")
		public String delete(@RequestParam Integer id) {
			recordParticipantService.deleteRecordParticipant(id);
			
			return "redirect:/RecordParticipantBack";
		}
	
	
}
