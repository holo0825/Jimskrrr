package com.GroupOne.Albert.recaptcha.responsemodel;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.List;
// Model class which will be used to map the incoming response from google's REST API
//Lombok annotations
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CaptchaResponse {
	// test if the client reCAPTCHA response is valid or not
    boolean success;
    
    @JsonProperty("challenge_ts")
    LocalDateTime challengeTs;
    
    String hostname;
    
    // look at the error codes if the client reCAPTCHA response is invalid
    // Property name refers to name used externally, as the field name in JSON objects. 
    @JsonProperty("error-codes")
    List<String> errorCodes;
}
