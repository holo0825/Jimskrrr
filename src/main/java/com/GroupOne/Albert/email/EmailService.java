//package com.GroupOne.Albert.email;
//
//import javax.mail.MessagingException;
//import javax.mail.internet.MimeMessage;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.scheduling.annotation.Async;
//import org.springframework.stereotype.Service;
//
//import lombok.AllArgsConstructor;
//
//@AllArgsConstructor
//@Service
//public class EmailService implements EmailSender{
//	// The org.slf4j.Logger interface is used here to log when an email is sent
//	/*
//	 * LoggerFactory is a utility class producing Loggers for various logging APIs, 
//	 * most notably for log4j, logback and JDK 1.4 logging.
//	 * */
//	private final static Logger LOGGER = LoggerFactory
//			.getLogger(EmailService.class);
//	/*
//	 * Extended org.springframework.mail.MailSender interface for JavaMail,
//	 * supporting MIME messages both as direct arguments and through preparation callbacks. 
//	 * Typically used in conjunction with the MimeMessageHelperclass for convenient creation of JavaMail MimeMessages,including attachments etc. */
//	private final JavaMailSender mailSender;
//	// mark this as asynchronous method
//	@Override
//	@Async
//	public void send(String to, String email) {
//		try {
//			MimeMessage mimeMessage = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
//			// 1st parameter takes String text, 2nd parameter true for content type (text/html) or false for using default content type ("text/plain")
//			helper.setText(email, true);  
//			helper.setTo(to);
//			helper.setSubject("Confirm your email");
//			helper.setFrom("littleel218@gmail.com");
//			mailSender.send(mimeMessage);
//		}catch (MessagingException e) {
//			LOGGER.error("failed to send email", e);
//			throw new IllegalStateException("failed to send email");
//		}
//	}
//
//}
