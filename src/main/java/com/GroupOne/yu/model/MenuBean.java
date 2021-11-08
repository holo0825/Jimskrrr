package com.GroupOne.yu.model;

import java.io.Serializable;
import java.sql.Blob;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Menu")
public class MenuBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//private Integer id; 
	@Column(name = "PRODUCTNAME")
	private String productName;
	private String fileName;    //圖片名稱
	private Blob  dishImage;	//菜單圖片
	private String remark;
	private String price;
	@Transient
	private String rstName;
//	private RestaurantBean restaurantBean;
	
	
	public MenuBean() {
	}

	public MenuBean(String productName) {
		//刪除菜色用
		this.productName = productName;
	}

//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="FK_RestaurantBean_rstName") 	
//	private RestaurantBean RestaurantBean;
	
	//提供上傳圖片功能
	@Transient
	private MultipartFile  productImage; //上傳之圖片

	public MultipartFile getProductImage() {
	    return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
	    this.productImage = productImage;
	}
	
	public MenuBean(String productName, Blob dishImage, String remark, String price) {
	
		this.productName = productName;
		this.dishImage = dishImage;
		this.remark = remark;
		this.price = price;
	}
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="FK_RestaurantBean_RstName") 
//	public RestaurantBean getRestautantBean() {
//		return RestaurantBean;
//	}
//	public void setRestautantBean(RestaurantBean rb) {
//		this.RestaurantBean = RestaurantBean;		
//	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Blob getDishImage() {
		return dishImage;
	}
	public void setDishImage(Blob dishImage) {
		this.dishImage = dishImage;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

//	public RestaurantBean getRestaurantBean() {
//		return restaurantBean;
//	}
//
//	public void setRestaurantBean(RestaurantBean restaurantBean) {
//		this.restaurantBean = restaurantBean;
//	}

	

}
