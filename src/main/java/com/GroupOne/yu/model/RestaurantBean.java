package com.GroupOne.yu.model;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="restaurant")
public class RestaurantBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="USERNAME")
	//@GeneratedValue(strategy= GenerationType.AUTO)
	private String userName;  //經營者姓名
	private String mobile;  //經營者電話
	private String rstname;  //餐廳名稱
	private String license;  //經營許可證號碼
	private String rstaddress;  //餐廳地址
	private String rsttel;  //餐廳電話
	private String category;  //餐廳種類
	private String businesshour;  //營業時間
	//private Blob rstImage; //餐廳形象照
//	private MenuBean menuBean;
	
	
//	@OneToMany(mappedBy="restaurantBean")
//	private Set<MenuBean> menu = new LinkedHashSet<>();

	public RestaurantBean() {
		//super();
	}

	public RestaurantBean(String rstname) {
		super();
		this.rstname = rstname;
	}


	public RestaurantBean(String userName, String mobile, String rstname, String license, String rstaddress,
			String rsttel,String category, String businesshour) {
		super();
		this.userName = userName;
		this.mobile = mobile;
		this.rstname = rstname;
		this.license = license;
		this.rstaddress = rstaddress;
		this.rsttel = rsttel;
		this.category = category;
		this.businesshour = businesshour;
		//this.rstImage = rstImage;
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

	public String getRstname() {
		return rstname;
	}

	public void setRstname(String rstname) {
		this.rstname = rstname;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getRstaddress() {
		return rstaddress;
	}

	public void setRstaddress(String rstaddress) {
		this.rstaddress = rstaddress;
	}

	public String getRsttel() {
		return rsttel;
	}

	public void setRsttel(String rsttel) {
		this.rsttel = rsttel;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBusinesshour() {
		return businesshour;
	}

	public void setBusinesshour(String businesshour) {
		this.businesshour = businesshour;
	}

//	public Set<MenuBean> getMenu() {
//		return menu;
//	}
//	public void setMenu(Set<MenuBean> menu) {
//		this.menu = menu;
//	}

	public void setRestautantBean(RestaurantBean rb) {
		
	}

//	public Blob getRstImage() {
//		return rstImage;
//	}
//
//	public void setRstImage(Blob rstImage) {
//		this.rstImage = rstImage;
//	}


}
