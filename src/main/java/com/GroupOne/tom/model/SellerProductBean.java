package com.GroupOne.tom.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity @Table(name = "ProductImformation")
public class SellerProductBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="PRODUCT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="PRODUCT_NAME")
	private String name;
	
	@Column(name="PRICE")
	private Integer price;
	
	@Column(name="PEOPLE_ENOUGH")
	private Integer people;
 
	@Column(name="END_DATE")
	private Date date;
	
	@Column(name="IMG")
	private byte[] picture;
	
	@Column(name="PEOPLENOW")
	private Integer peopleNow;
	
	@Column(name="INTRODUCE_PRODUCT")
	private String introduceProduct;
	
	@Column(name="SELLERID")
	private Integer sellerID;
	

	
	
	
	public SellerProductBean() {}
	
	public SellerProductBean(Integer id, String name, Integer price, Integer people,
			 Date date,byte[] picture,Integer peopleNow,String introduceProduct,Integer sellerID) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.people = people;
		this.date = date;
		this.picture = picture;
		this.introduceProduct = introduceProduct;
		this.peopleNow = peopleNow;
		this.sellerID = sellerID;
	}
	
	
	@Transient
	 Integer VerificationCode;
	 
	 //-----------------上傳'檔案(船幾個就要有幾份)-------------------------------
	  @Transient  //@Transient告訴spring要忽略  我們自己要用來裝圖片的
	  private MultipartFile  productImage;  //jsp中 form:input 的path屬性

	  public MultipartFile getProductImage() {
	      return productImage;
	  }

	  public void setProductImage(MultipartFile productImage) {
	      this.productImage = productImage;
	  }
	//---------------------------------------------------------------------
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public Integer getPeopleNow() {
		return peopleNow;
	}

	public void setPeopleNow(Integer peopleNow) {
		this.peopleNow = peopleNow;
	}

	public Integer getSellerId() {
		return sellerID;
	}

	public void setSellerId(Integer sellerID) {
		this.sellerID = sellerID;
	}


	public String getIntroduceProduct() {
		return introduceProduct;
	}

	public void setIntroduceProduct(String introduceProduct) {
		this.introduceProduct = introduceProduct;
	}
	
	
	

}
