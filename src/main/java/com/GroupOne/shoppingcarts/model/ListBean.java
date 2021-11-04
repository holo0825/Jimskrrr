package com.GroupOne.shoppingcarts.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "list")
public class ListBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int itemNo;
	private String productName;
	private int number;
	private int price;
	private String exist;
	
	public ListBean() {
		super();
	}
	
	public ListBean(int id, int itemNo, String productName, int number, int price, String exist) {
		super();
		this.id = id;
		this.itemNo = itemNo;
		this.productName = productName;
		this.number = number;
		this.price = price;
		this.exist = exist;
	}

	public ListBean(int itemNo) {
		super();
		this.itemNo = itemNo;
	}

	public ListBean(int itemNo, String productName, int number, int price) {
		super();
		this.itemNo = itemNo;
		this.productName = productName;
		this.number = number;
		this.price = price;
	}
	public ListBean(int number,int itemNo, String productName) {   //測試用
		super();
		this.number = number;
		this.itemNo = itemNo;
		this.productName = productName;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getExist() {
		return exist;
	}
	public void setExist(String exist) {
		this.exist = exist;
	}
	
	
}
