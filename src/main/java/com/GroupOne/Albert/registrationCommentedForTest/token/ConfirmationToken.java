//package com.GroupOne.Albert.registrationCommentedForTest.token;
//
//import java.time.LocalDateTime;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.SequenceGenerator;
//
//import com.GroupOne.Albert.members.Member;
//
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//@Getter
//@Setter
//@NoArgsConstructor
//@Entity
//public class ConfirmationToken {
//
//	@SequenceGenerator(
//			name = "confirmation_token_sequence",
//			sequenceName = "confirmation_token_sequence",
//			allocationSize = 1
//	)
//	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE,
//					generator = "confirmation_token_sequence"
//	)
//	private Long id;
//	
//	@Column(nullable = false)
//	private String token;
//	
//	@Column(nullable = false)
//	private LocalDateTime createdAt; // time at which token created
//
//	@Column(nullable = false)
//	private LocalDateTime expiresAt; // time at which token expires
//
//	private LocalDateTime confirmedAt; // time at which token confirmed
//	
//	// a user can have many confirmation tokens
//	@ManyToOne
//	@JoinColumn(
//			nullable = false,
//			name = "member_id"
//	)
//	private Member member;
//	
//	public ConfirmationToken(String token, 
//							 LocalDateTime createdAt, 
//							 LocalDateTime expiredAt,
//							 Member member) {
//		this.token = token;
//		this.createdAt = createdAt;
//		this.expiresAt = expiredAt;
//		this.member = member;
//	}
//	
//	
//	
//}
