package com.GroupOne.tom.model;

import java.io.Serializable;


import org.springframework.stereotype.Component;


@Component
public class CartBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	private Integer price;
	private Integer number;
	private String category;
	
	public CartBean() {}
	
	public CartBean(Integer id, String name, Integer price, Integer number,String category) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.number= number;
		this.category=category;
	}

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

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
