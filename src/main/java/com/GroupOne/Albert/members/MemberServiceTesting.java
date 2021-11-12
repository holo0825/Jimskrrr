package com.GroupOne.Albert.members;
//package com.GroupOne.Albert.members;
//
//import java.time.LocalDateTime;
//import java.util.Optional;
//import java.util.UUID;
//
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import com.GroupOne.Albert.registration.token.ConfirmationToken;
//import com.GroupOne.Albert.registration.token.ConfirmationTokenService;
//
//import lombok.AllArgsConstructor;
//// This is how we find users once we try to login
//@Service
//@AllArgsConstructor
//public class MemberService {
////public class MemberService implements UserDetailsService{
//	
//	private final static String USER_NOT_FOUND_MSG =
//			"user with email %s not found";
//	private final MemberRepository memberRepository;
//	private final BCryptPasswordEncoder bCryptPasswordEncoder;
//	private final ConfirmationTokenService confirmationTokenService;
//	
//	
//	
////	@Override
////	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
////		return memberRepository.findByEmail(email)
////				.orElseThrow(() -> 
////						new UsernameNotFoundException(
////								String.format(USER_NOT_FOUND_MSG, email)));
////	}
//	
//	// return email verifcation link as String
//	public String signUpMember(Member member) {
//		boolean memberExists = memberRepository
//				.findByEmail(member.getEmail())
//				.isPresent();
////		Optional<AppUser> userEmail = appUserRepository
////				.findByEmail(appUser.getEmail());
////		boolean userExists = userEmail.isPresent();
//		if (memberExists) {
//			// TODO check of attributes are the same and
//			// TODO if email not confirmed send confirmation email
//			
//			throw new IllegalStateException("email already taken");
//		}
//		// encodes user password when email is not taken
//		String encodedPassword = bCryptPasswordEncoder
//				.encode(member.getPassword());
//		// change password to encoded password
//		member.setPassword(encodedPassword);
//		// saves a user into database
//		memberRepository.save(member);
//		
//		String token = UUID.randomUUID().toString(); // generate random UUID string
//		// TODO: Send confirmation token
//		ConfirmationToken confirmationToken = new ConfirmationToken(
//				token,
//				LocalDateTime.now(),
//				LocalDateTime.now().plusMinutes(15),
//				member
//		);
//		
//		confirmationTokenService.saveConfirmationToken(confirmationToken); // save confirmation token through Service class
//		
////		TODO: SEND EMAIL
//		
//		return token; // return the confirmation token string
//	}
//
//	public int enableAppUser(String email) {
//		return memberRepository.enableMember(email);
//	}
//}
