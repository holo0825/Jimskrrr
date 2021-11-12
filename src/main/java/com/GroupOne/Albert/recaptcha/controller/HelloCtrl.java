package com.GroupOne.Albert.recaptcha.controller;

import com.GroupOne.Albert.recaptcha.annotation.RequiresCaptcha;
import com.GroupOne.Albert.recaptcha.exception.ForbiddenException;
import com.GroupOne.Albert.recaptcha.model.HelloDto;
import com.GroupOne.Albert.recaptcha.model.HelloResponseDto;
import com.GroupOne.Albert.recaptcha.service.ValidateCaptcha;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
// Controller class injected with the service dependency whose method will be used to validate the incoming captcha response
//Lombok annotation for logger
@Slf4j
//Spring annotations
@RestController
@RequestMapping("/api")
public class HelloCtrl {

    //injected to validate the captcha response coming in the request.
    @Autowired
    ValidateCaptcha service;

    //URL - http://localhost:9001/api/welcome
    @PostMapping("/welcome")
    @ResponseStatus(code = HttpStatus.OK)
    //custom annotation
    @RequiresCaptcha
    public HelloResponseDto welcome(@RequestBody final HelloDto dto) 
    		throws ForbiddenException {
    	
//    	final boolean isValidCaptcha = service.validateCaptcha(dto.getCaptchaResponse());
//        if (!isValidCaptcha) {
//            log.info("Throwing forbidden exception as the captcha is invalid.");
//            throw new ForbiddenException("INVALID_CAPTCHA");
//        }
        
        return new HelloResponseDto("Greetings " + dto.getName());
    }
}
