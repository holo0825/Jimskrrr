package com.GroupOne.yu.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Menu")
public class MenuBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String rstName;
	private String productName;

	private String fileName; // 圖片名稱
	//private Blob dishImage; // 菜單圖片
	private byte[] dishImage;
	@Transient
	private MultipartFile coverImage; // 拿來暫時存放 圖片 // 上傳之圖片

	private String remark;
	private String price;
	private String offshelf;

	public MenuBean() {

	}

	public MenuBean(String rstName, String productName, String fileName, byte[] dishImage, MultipartFile coverImage,
			String remark, String price) {
		super();
		this.rstName = rstName;
		this.productName = productName;
		this.fileName = fileName;
		this.dishImage = dishImage;
		this.coverImage = coverImage;
		this.remark = remark;
		this.price = price;
	}

	//含id所有建構子
	public MenuBean(Integer id, String rstName, String productName, String fileName, byte[] dishImage, String remark,
			String price) {
		this.id = id;
		this.rstName = rstName;
		this.productName = productName;
		this.fileName = fileName;
		this.dishImage = dishImage;
		this.remark = remark;
		this.price = price;
	}

	//賣家刪除菜單用
	public MenuBean(String productName) {
		this.productName = productName;
	}



	// 提供上傳圖片功能
	public MultipartFile getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(MultipartFile coverImage) {
		this.coverImage = coverImage;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRstName() {
		return rstName;
	}

	public void setRstName(String rstName) {
		this.rstName = rstName;
	}

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

	public byte[] getDishImage() {
		return dishImage;
	}

	public void setDishImage(byte[] dishImage) {
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

	public String getOffshelf() {
		return offshelf;
	}

	public void setOffshelf(String offshelf) {
		this.offshelf = offshelf;
	}



	
	//GET SET
	
}
