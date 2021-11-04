package com.GroupOne.Albert.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

// 所有賣家會員相關功能共用Persistance Class (JavaBean)

@Entity @Table(name="SELLER_DETAILS")
public class SellerBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="ID")
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	protected int id;
	
	@Column(name="USERNAME")
	protected String username;
	
	@Column(name="PASSWORD")
	protected String password;
	
	@Column(name="FULL_NAME")
	protected String fullname;
	
	@Column(name="DOB")
	protected String dob;
	
	@Column(name="GENDER")
	protected String gender;
	
	@Column(name="EMAIL")
	protected String email;
	
	@Column(name="PHONE_NUMBER")
	protected String phoneNumber;
	
	@Column(name="TELEPHONE_NUMBER")
	protected String telephoneNumber;
	
	@Column(name="EXTENSION_NUMBER")
	protected String extensionNumber; //nullable
	
	@Column(name="COMPANY_NAME")
	protected String companyName;
	
	@Column(name="COMPANY_ADDRESS")
	protected String companyAddress;
	
	@Column(name="BUSINESS_CERT")
	protected Byte[] businessCert;
	
	@Column(name="VERIFY_STATUS")
	protected Boolean verifyStatus; //nullable

	public SellerBean() {
		super();
	}
	
	// update seller用 對應全部欄位
	public SellerBean(String username, String password, String fullname, String dob, String gender, String email,
			String phoneNumber, String telephoneNumber, String extensionNumber, String companyName,
			String companyAddress, Byte[] businessCert, Boolean verifyStatus) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.telephoneNumber = telephoneNumber;
		this.extensionNumber = extensionNumber;
		this.companyName = companyName;
		this.companyAddress = companyAddress;
		this.businessCert = businessCert;
		this.verifyStatus = verifyStatus;
	}

	// insert seller用 除了id以外對應全部欄位
	public SellerBean(int id, String username, String password, String fullname, String dob, String gender, String email,
			String phoneNumber, String telephoneNumber, String extensionNumber, String companyName,
			String companyAddress, Byte[] businessCert, Boolean verifyStatus) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.telephoneNumber = telephoneNumber;
		this.extensionNumber = extensionNumber;
		this.companyName = companyName;
		this.companyAddress = companyAddress;
		this.businessCert = businessCert;
		this.verifyStatus = verifyStatus;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getTelephoneNumber() {
		return telephoneNumber;
	}


	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}


	public String getExtensionNumber() {
		return extensionNumber;
	}


	public void setExtensionNumber(String extensionNumber) {
		this.extensionNumber = extensionNumber;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public String getCompanyAddress() {
		return companyAddress;
	}


	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}


	public Byte[] getBusinessCert() {
		return businessCert;
	}


	public void setBusinessCert(Byte[] businessCert) {
		this.businessCert = businessCert;
	}


	public Boolean getVerifyStatus() {
		return verifyStatus;
	}


	public void setVerifyStatus(Boolean verifyStatus) {
		this.verifyStatus = verifyStatus;
	}
	
	
}
	