package com.GroupOne.tom.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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

	
	public SellerProductBean() {}
	
	public SellerProductBean(Integer id, String name, Integer price, Integer people, Date date) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.people = people;
		this.date = date;
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

	

}
