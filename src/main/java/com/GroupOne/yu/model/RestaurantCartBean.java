//package com.GroupOne.yu.model;
//
//import java.io.Serializable;
//
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//
//import org.springframework.stereotype.Component;
//
//
//@Component
//public class RestaurantCartBean implements Serializable{
//
//	private static final long serialVersionUID = 1L;
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
//	private String id;
//	private String rstName;
//	private String productName;
//	private String price;
//	private String number;
//	private String category;
//	
//	public RestaurantCartBean() {
//	}
//
//	public RestaurantCartBean(String id, String rstName, String productName, String price, String number, String category) {
//		this.id = id;
//		this.rstName = rstName;
//		this.productName = productName;
//		this.price = price;
//		this.number = number;
//		this.category = category;
//	}
//
//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}
//	
//	public String getRstName() {
//		return rstName;
//	}
//
//	public void setRstName(String rstName) {
//		this.rstName = rstName;
//	}
//
//	public String getProductName() {
//		return productName;
//	}
//
//	public void setProductName(String productName) {
//		this.productName = productName;
//	}
//
//	public String getPrice() {
//		return price;
//	}
//
//	public void setPrice(String price) {
//		this.price = price;
//	}
//
//	public String getNumber() {
//		return number;
//	}
//
//	public void setNumber(String number) {
//		this.number = number;
//	}
//
//	public String getCategory() {
//		return category;
//	}
//
//	public void setCategory(String category) {
//		this.category = category;
//	}
//
//	public static long getSerialversionuid() {
//		return serialVersionUID;
//	}
//
//
//	
//}
