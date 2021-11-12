package com.GroupOne.Albert.registrationCommentedForTest;
//package com.GroupOne.Albert.registration;
//
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import lombok.AllArgsConstructor;
//
//@RestController
//@RequestMapping(path = "api/v1/registration")
//@AllArgsConstructor
//public class RegistrationController {
//
//	private final RegistrationService registrationService;
//	// registers user using @RequestBody containing first name, last name, email, password
//	@PostMapping
//	public String register(@RequestBody RegistrationRequest request) {
//		return registrationService.register(request);
//	}
//	// confirms token for registration
//	@GetMapping(path = "confirm")
//    public String confirm(@RequestParam("token") String token) {
//        return registrationService.confirmToken(token);
//    }
//}
