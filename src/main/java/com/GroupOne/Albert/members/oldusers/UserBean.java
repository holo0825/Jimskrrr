package com.GroupOne.Albert.members.oldusers;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

// 所有買家會員相關功能共用Persistance Class (JavaBean)

@Entity @Table(name="USER_DETAILS")
public class UserBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="ID")
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	protected Integer id;
	
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
	
	@Column(name="HOME_NUMBER")
	protected String homeNumber; // nullable
	
	@Column(name="BONUS_POINT")
	protected Float bonusPoint; // nullable

	public UserBean() {
		super();
	}
	
	// insert user用 除了id以外對應全部欄位
	public UserBean(String username, String password, String fullName, String dob, String gender, String email,
			String phoneNumber, String homeNumber, Float bonusPoint) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullName;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.homeNumber = homeNumber;
		this.bonusPoint = bonusPoint;
	}
	
	
	// update user用 對應全部欄位
	public UserBean(int id, String username, String password, String fullname, String dob, String gender, String email,
			String phoneNumber, String homeNumber, Float bonusPoint) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.homeNumber = homeNumber;
		this.bonusPoint = bonusPoint;
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

	public void setFullname(String fullName) {
		this.fullname = fullName;
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

	public String getHomeNumber() {
		return homeNumber;
	}

	public void setHomeNumber(String homeNumber) {
		this.homeNumber = homeNumber;
	}

	public Float getBonusPoint() {
		return bonusPoint;
	}

	public void setBonusPoint(Float bonusPoint) {
		this.bonusPoint = bonusPoint;
	}

}
