//package com.GroupOne.Albert.registrationCommentedForTest.token;
//
//import java.time.LocalDateTime;
//import java.util.Optional;
//
//import org.springframework.stereotype.Service;
//
//import lombok.AllArgsConstructor;
//
//@Service
//@AllArgsConstructor
//public class ConfirmationTokenService {
//	
//	private final ConfirmationTokenRepository confirmationTokenRepository;
//	
//	public void saveConfirmationToken(ConfirmationToken token) {
//		confirmationTokenRepository.save(token);
//	}
//	
//	public Optional<ConfirmationToken> getToken(String token) {
//        return confirmationTokenRepository.findByToken(token);
//    }
//	// set time at which token confirmed
//	public int setConfirmedAt(String token) {
//		return confirmationTokenRepository.updateConfirmedAt(
//				token, LocalDateTime.now());
//	}
//	
//}
