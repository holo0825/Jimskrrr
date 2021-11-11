package com.GroupOne.kai.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.Albert.model.AdminBean;
import com.GroupOne.Albert.model.UserBean;
import com.GroupOne.Albert.service.UserRegisterService;
import com.GroupOne.kai.model.ActivityBean;
import com.GroupOne.kai.model.RecordParticipantBean;
import com.GroupOne.kai.service.ActivityService;
import com.GroupOne.kai.service.RecordParticipantService;

@SessionAttributes({"admin", "user"})
@Controller
public class ActivityController {

	ActivityService activityService;
	RecordParticipantService recordParticipantService;
	UserRegisterService userRegisterService;
	
	//mail
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	public ActivityController(ActivityService activityService,RecordParticipantService recordParticipantService) {
		this.recordParticipantService=recordParticipantService;
		this.activityService = activityService;
	}
	//[前端]活動卡V
	@GetMapping("/ActivityList")
	public String gotoactivityPage( Model model) {
		List<ActivityBean> activityList = activityService.selectAllUsers();
		System.out.println("-------------ActivityPage-----活動卡V-----");
		model.addAttribute("activityListPage", activityList);
		model.addAttribute("activityPage", new ActivityBean());
		return "Activity_28/ActivityPage";
	}
	
	//[前端]活動卡內容ActivityPagedetail V
	@GetMapping("/activitypage")
	public String gotoactivitydetail( @RequestParam("id")Integer id,Model model) {
		ActivityBean activityBean=new ActivityBean();
		Optional<ActivityBean> activityList = activityService.selectOneUsers(id);
		activityBean = activityList.get();
		model.addAttribute("activityListdetail", activityBean);
		System.out.println("-------------activitypage--------活動卡內容V--"+activityBean.getTopic());
		model.addAttribute("RecordParticipant",new RecordParticipantBean());
		System.out.println("-----------已加入空RecordParticipant進入session------");
		return "Activity_28/ActivityPagedetail";
	}
	
	
	
	//[前端]活動卡-內容V+報名
		@PostMapping("/activitypage")
		public String processgotoactivitydetail(
				@RequestParam("id")int id,
				@ModelAttribute("RecordParticipant") RecordParticipantBean rpBean,
				//使用SessionAttributes引入UserBean user
				@ModelAttribute("user") UserBean usBean,
				Model model) {
			System.out.println("------------------立即報名送出-----------------------"+rpBean.getU_phone());
			System.out.println("------------------立即報名送出---------------------id--"+id);
			System.out.println("--------username----"+usBean.getUsername());
			model.addAttribute("RecordParticipant",rpBean);
			Optional<ActivityBean> ab ;
			ab= activityService.selectOneUsers(id);
			String topic = ab.get().getTopic();
			String style = ab.get().getStyle();
			RecordParticipantBean rb =new RecordParticipantBean();
			rb.setS_username("asd123");
			rb.setActivity_id(id);
			rb.setActivity_topic(topic);
			rb.setU_userid(rpBean.getU_userid());
			rb.setU_username(rpBean.getU_username());
			rb.setU_phone(rpBean.getU_phone());
			rb.setSent_email(rpBean.getSent_email());
			rb.setU_styles(style);
			rb.setUser_username(usBean.getUsername());
			rb.setCreate_date(new Date());
			System.out.println("*************************************************");
			System.out.println(topic+rpBean.getU_userid()+","+rpBean.getU_username()+","+rpBean.getU_phone()+","+rpBean.getSent_email()
			+","+style+","+new Date());
			int quota =ab.get().getQuota()-1;
			if (quota>0) {
				recordParticipantService.updatequota(id,quota);
			}else {
				return "Activity_28/ActivitySignUpError";
			}
			recordParticipantService.insertRecordParticipant(rb);
			model.addAttribute("ab",ab);
			//更新人數，ab.get().getQuota()遠本人數
			//quota原本人數減1，再去recordParticipantService塞入值
			
			
			//寄信
			SimpleMailMessage message =new SimpleMailMessage();
			  message.setTo("coding00825@gmail.com");
			  message.setSubject("聚點食刻-活動小組");
			  message.setText("感謝您報名參加此次'異國料理輕鬆做'的活動，"
			  		+ "您在聚點食刻報名的活動已完成。"
					+ "\r\n"
					+ "請留意活動時間：2021/11/20 2pm-3pm(1:30開放入場)，謝謝您");
			  
			  mailSender.send(message);
			return "Activity_28/ActivitySignUpSuccess";
		}
	
	//一開始活動頁V
	@GetMapping("/ActivityPage")
	public String index(Model model, @ModelAttribute("user") UserBean usmb) {
		System.out.println("-------------/----------");
		List<ActivityBean> activityList = activityService.selectAllUsers();
		model.addAttribute("activityListPage", activityList);
		model.addAttribute("activityPage", new ActivityBean());
		System.out.println("admin"+usmb.getUsername());
		return "Activity_28/ActivityPage";
	}
	
	//[後端]顯示所有資料V(舊版沒有再用)
	@RequestMapping("/ActivityRegister")
	public String list(Model model) {
		List<ActivityBean> activityList = activityService.selectAllUsers();
		System.out.println("-------------ActivityRegister----------");
		model.addAttribute("activityList", activityList);
		model.addAttribute("activity", new ActivityBean());
		
		return "Activity_28/ActivityRegister";
	}
	
	//[後端]查詢主題關鍵字V(舊版沒有再用)
//		@GetMapping("/activityQuery")
//		public String activityQuery(@RequestParam String search, Model model) {
//			System.out.println("-------------activityQuery----------");
//			List<ActivityBean> activityList = activityService.selectSearchTopic(search);
//			model.addAttribute("activityList", activityList);
//			model.addAttribute("activity", new ActivityBean());
//			
//			return "Activity_28/ActivityRegister";
//		}
	//[前端]查詢主題關鍵字V
		@GetMapping("/activityQuery")
		public String activityQuery(@RequestParam String search, Model model) {
			System.out.println("-------------activityQuery----------");
			List<ActivityBean> activityListPage = activityService.selectSearchTopic(search);
			model.addAttribute("activityListPage", activityListPage);
			model.addAttribute("activityPage", new ActivityBean());
					
			return "Activity_28/ActivityPage";
		}
		
	//[後端]新增V
	@PostMapping("/activityInsert")
	public String activityInsert(@ModelAttribute("activity") ActivityBean activity, @RequestParam MultipartFile image) {
		
		activityService.insertActivity(activity, image);
		return "Activity_28/ActivityInsertSuccess";

	}
	
	//[後端]修改 get到edit紐進修改頁V
	@GetMapping("/activityEdit")
	public String edit(@ModelAttribute("activity") ActivityBean activityBean,
			@RequestParam Integer id, Model model) {
		
		ActivityBean activity = activityService.selectSearchId(id).get();
		String[] schedule = activity.getSchedule().split("-");
		activity.setStartTime(schedule[0]);
		activity.setEndTime(schedule[1]);
		if(activity.getStyle() != null && activity.getStyle().length() != 0)
			
		activity.setStyles(activity.getStyle().split(","));
		model.addAttribute("activity", activity);
		
		return "Activity_28/Edit";
	}
	
	//修改完V
		@PostMapping("/activityUpdate")
		public String activityUpdate(@ModelAttribute("activity") ActivityBean activity, @RequestParam MultipartFile image) {
			activityService.editActivity(activity, image);
			
			return "redirect:/ActivityRegister";

	}
		
	//[後端]刪除 get delete紐進到刪除確認頁V
	@GetMapping("/activityDelete")
	public String toDelete(@RequestParam Integer id, Model model) {
		ActivityBean activity = activityService.selectSearchId(id).get();
		if(activity.getStyle() != null && activity.getStyle().length() != 0)
			activity.setStyles(activity.getStyle().split(","));
		model.addAttribute("activity", activity);
		
		return "Activity_28/DeleteConfirm";
	}

	//[後端]確認刪除ID後V
	@PostMapping("/activityDelete")
	public String delete(@RequestParam Integer id) {
		activityService.deleteActivity(id);
		
		return "redirect:/ActivityRegister";
	}
	
	
	//[後台]1
	@GetMapping("/test")
	public String test( Model model) {
	
				
		return "/Test";
	}
	//[首頁]2
	@GetMapping("/GroupOneHome")
	public String home( Model model) {
	
				
		return "GroupOneHome";
	}
	
	//冠宇logout方法
	@GetMapping("/Userlogout2")
	public String userLogout(Model model, SessionStatus status) {

		UserBean loggedInUser = (UserBean) model.getAttribute("user");
		if (loggedInUser != null) {
			status.setComplete(); // 清除該Controller類別列出的@SessionAttributes
		}


		return "redirect:/ActivityPage";
	}

}
