package com.GroupOne.Albert.members;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Collections;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.Albert.OAuth2.Provider;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *代表Member的Entity class，為了實現Spring Security會員權限分配，
 *並且簡化user和role之間@ManyToMany關聯，改成所有會員自帶一個role欄位區別
 * */

@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@Entity
@Table(name = "Member")
public class Member {
//public class Member implements UserDetails{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 所有會員ADMIN,USER,SELLER共同擁有的資料欄位
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/*
	 * 代表會員身分，
	 * 用來區別Member的role，取自MemberRole.java中的enum String資料，
	 * 建議registration用setter方法額外設定role，
	 * ADMIN管理會員資料則考慮使用setter方法或是直接納入Constructor方法一起設定
	 * */
	@Column(name = "ROLE")
	@Enumerated(EnumType.STRING)
	private MemberRole memberRole;
	
	@Column(name = "PROVIDER")
	@Enumerated(EnumType.STRING)
	private Provider provider;
	
	@Column(name = "USERNAME")
	private String username;

	@Column(name = "FULLNAME")
	private String fullname;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "PASSWORD")
	private String password;
	//------------------------------------------------------------
	// 確認密碼用的
	@Transient
	private String password1;
	//------------------------------------------------------------
	// 以下為USER和SELLER共用欄位
	@Column(name = "DOB")
	protected String dob;

	@Column(name = "GENDER")
	protected String gender;

	@Column(name = "PHONE_NUMBER")
	protected String phoneNumber;
	//------------------------------------------------------------
	// USER特有資料欄位
	@Column(name = "HOME_NUMBER")
	protected String homeNumber; // nullable

	@Column(name = "BONUS_POINT")
	protected Float bonusPoint; // nullable，剛剛註冊時給預設值為0
	//------------------------------------------------------------
	// SELLER特有資料欄位
	@Column(name = "TELEPHONE_NUMBER")
	protected String telephoneNumber;

	@Column(name = "EXTENSION_NUMBER")
	protected String extensionNumber; // nullable

	@Column(name = "COMPANY_NAME")
	protected String companyName;

	@Column(name = "COMPANY_ADDRESS")
	protected String companyAddress;

	@Column(name = "BUSINESS_CERT")
	protected Byte[] businessCert;

	@Column(name = "VERIFY_STATUS")
	protected Boolean verifyStatus; // nullable，剛剛註冊時給預設值為false
	//------------------------------------------------------------
	@Column(name = "ENABLED")
	private Boolean enabled = false; // set default as false
	
	@Column(name = "LOCKED")
	private Boolean locked = false; // set default as false
	// 新增欄位，用來存放email確認碼
	@Column(name = "verification_code", length = 64)
    private String verificationCode;

	@Column(name = "register_time")
	Timestamp registerTime;
	
	@Column(name = "member_image")
	Blob memberImage;
	
	@Column(name = "file_name")
	String fileName;
	
	@Column(name = "mime_type")
	String mimeType;
	// 用來存取圖片，但是不會進到資料庫
	@Transient
	MultipartFile memberMultipartFile;
	//------------------------------------------------------------
	// ADMIN專用Constructor
	public Member(Integer id, String username, String fullname, String email, String password) {
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
	}

	// USER UPDATE/EDIT專用Constructor
	public Member(Integer id, String username, String fullname, String email, String password, String dob,
			String gender, String phoneNumber, String homeNumber, Float bonusPoint) {
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.homeNumber = homeNumber;
		this.bonusPoint = bonusPoint;
	}
	
	// USER CREATE專用Constructor
	public Member(String username, String fullname, String email, String password, String dob,
			String gender, String phoneNumber, String homeNumber, Float bonusPoint) {
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.homeNumber = homeNumber;
		this.bonusPoint = bonusPoint;
	}

	// SELLER UPDATE/EDIT專用Constructor
	public Member(Integer id, String username, String fullname, String email, String password, String dob,
			String gender, String phoneNumber, String telephoneNumber, String extensionNumber, String companyName,
			String companyAddress, Byte[] businessCert, Boolean verifyStatus) {
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.telephoneNumber = telephoneNumber;
		this.extensionNumber = extensionNumber;
		this.companyName = companyName;
		this.companyAddress = companyAddress;
		this.businessCert = businessCert;
		this.verifyStatus = verifyStatus;
	}
	
	// SELLER CREATE/INSERT專用Constructor
	public Member(String username, String fullname, String email, String password, String dob,
			String gender, String phoneNumber, String telephoneNumber, String extensionNumber, String companyName,
			String companyAddress, Byte[] businessCert, Boolean verifyStatus) {
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.telephoneNumber = telephoneNumber;
		this.extensionNumber = extensionNumber;
		this.companyName = companyName;
		this.companyAddress = companyAddress;
		this.businessCert = businessCert;
		this.verifyStatus = verifyStatus;
	}

	//-----------------------------------------------
	// 測試註冊時確認email使用的Constructor
	public Member(	String fullname,
//					String firstName, 
//					String lastName, 
					String email, 
					String password, 
					MemberRole memberRole) {
//		this.firstName = firstName;
//		this.lastName = lastName;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.memberRole = memberRole;
		}
	//-----------------------------------------------
	
	
}
