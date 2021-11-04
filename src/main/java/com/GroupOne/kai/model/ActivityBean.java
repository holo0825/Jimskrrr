package com.GroupOne.kai.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "Activity")
public class ActivityBean implements Serializable {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String username;
	private String s_email;
	private String topic;
	private String style;
	@Transient
	private String[] styles;
	private String address;
	private Integer cost;
	private String link;
	private String introduce;
	private Integer quota;
	private String schedule;
	@Transient
	private String startTime;
	@Transient
	private String endTime;
	private String notice;
	private byte[] activity_photo;
	private float bonus_point;
	private Date create_date;
	private Date revise_date;

	public ActivityBean() {

	}

	public ActivityBean(Integer id) {
		this.id = id;
	}

	// 修改
	public ActivityBean(Integer id, String username, String s_email, String topic, String style, String address, Integer cost,
			String link, String introduce, Integer quota, String schedule, String notice, byte[] activity_photo,
			float bonus_point, Date revise_date) {

		this.id = id;
		this.username = username;
		this.s_email = s_email;
		this.topic = topic;
		this.style = style;
		this.address = address;
		this.cost = cost;
		this.link = link;
		this.introduce = introduce;
		this.quota = quota;
		this.schedule = schedule;
		this.notice = notice;
		this.activity_photo = activity_photo;
		this.bonus_point = bonus_point;
		this.revise_date = revise_date;
	}

	public ActivityBean(Integer id, String username, String s_email, String topic, String style, String address, Integer cost,
			String link, String introduce, Integer quota, String schedule, String notice, byte[] activity_photo,
			float bonus_point, Date create_date, Date revise_date,CommonsMultipartFile image) {

		this.id = id;
		this.username = username;
		this.s_email = s_email;
		this.topic = topic;
		this.style = style;
		this.address = address;
		this.cost = cost;
		this.link = link;
		this.introduce = introduce;
		this.quota = quota;
		this.schedule = schedule;
		this.notice = notice;
		this.activity_photo = activity_photo;
		this.bonus_point = bonus_point;
		this.create_date = create_date;
		this.revise_date = revise_date;
		
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String[] getStyles() {
		return styles;
	}

	public void setStyles(String[] styles) {
		this.styles = styles;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Integer getQuota() {
		return quota;
	}

	public void setQuota(Integer quota) {
		this.quota = quota;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public byte[] getActivity_photo() {
		return activity_photo;
	}

	public void setActivity_photo(byte[] activity_photo) {
		this.activity_photo = activity_photo;
	}

	public float getBonus_point() {
		return bonus_point;
	}

	public void setBonus_point(float bonus_point) {
		this.bonus_point = bonus_point;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getRevise_date() {
		return revise_date;
	}

	public void setRevise_date(Date revise_date) {
		this.revise_date = revise_date;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


}
