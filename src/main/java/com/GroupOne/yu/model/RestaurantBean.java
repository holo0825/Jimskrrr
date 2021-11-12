package com.GroupOne.yu.model;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity 
@Table(name="restaurant")
public class RestaurantBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private String userName;  //經營者姓名
	private String mobile;  //經營者電話
	private String rstName;  //餐廳名稱
	private String license;  //經營許可證號碼
	private String rstAddress;  //餐廳地址
	private String rstTel;  //餐廳電話
	private String category;  //餐廳種類
	private String businessHour;  //營業時間	

	private byte[] rstImage; //餐廳形象照
	@Transient
	private MultipartFile image; // 拿來暫時存放 圖片 // 上傳之圖片

	private String offshelf;
	

	public RestaurantBean() {
	}
	
	public RestaurantBean(String rstName) {
		this.rstName = rstName;
	}
	

	//CRUD用
	public RestaurantBean(String userName, String mobile, String rstName, String license, String rstAddress,
			String rstTel, String category, String businessHour, byte[] rstImage) {
		this.userName = userName;
		this.mobile = mobile;
		this.rstName = rstName;
		this.license = license;
		this.rstAddress = rstAddress;
		this.rstTel = rstTel;
		this.category = category;
		this.businessHour = businessHour;
		this.rstImage = rstImage;				
	}

	
	public RestaurantBean(String userName, String mobile, String rstName, String license, String rstAddress,
			String rstTel,String category, String businessHour) {
		this.userName = userName;
		this.mobile = mobile;
		this.rstName = rstName;
		this.license = license;
		this.rstAddress = rstAddress;
		this.rstTel = rstTel;
		this.category = category;
		this.businessHour = businessHour;
	}
	
	//存到資料庫用
	public RestaurantBean(int id,String userName, String mobile, String rstName, String license, String rstAddress,
			String rstTel,String category, String businessHour) {
		super();
		this.id = id;
		this.userName = userName;
		this.mobile = mobile;
		this.rstName = rstName;
		this.license = license;
		this.rstAddress = rstAddress;
		this.rstTel = rstTel;
		this.category = category;
		this.businessHour = businessHour;
		//this.rstImage = rstImage;
	}
	
	// 提供上傳圖片功能
	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRstName() {
		return rstName;
	}

	public void setRstname(String rstName) {
		this.rstName = rstName;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getRstAddress() {
		return rstAddress;
	}

	public void setRstAddress(String rstAddress) {
		this.rstAddress = rstAddress;
	}

	public String getRstTel() {
		return rstTel;
	}

	public void setRstTel(String rstTel) {
		this.rstTel = rstTel;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBusinessHour() {
		return businessHour;
	}

	public void setBusinessHour(String businessHour) {
		this.businessHour = businessHour;
	}

//	public Set<MenuBean> getMenu() {
//		return menu;
//	}
//	public void setMenu(Set<MenuBean> menu) {
//		this.menu = menu;
//	}

	public void setRestautantBean(RestaurantBean rb) {
		
	}

	public String getOffshelf() {
		return offshelf;
	}

	public void setOffshelf(String offshelf) {
		this.offshelf = offshelf;
	}

	public byte[] getRstImage() {
		return rstImage;
	}

	public void setRstImage(byte[] rstImage) {
		this.rstImage = rstImage;
	}



}
