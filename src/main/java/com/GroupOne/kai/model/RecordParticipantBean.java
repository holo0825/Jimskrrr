package com.GroupOne.kai.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Record_Participant")
public class RecordParticipantBean {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer recordId;
	private String s_username; //廠商帳號
	private Integer activity_id;//活動序號
	private String activity_topic;//活動主題
	private String u_userid;//顧客帳號
	private String u_username;//顧客姓名
	private Integer u_phone;
	private String sent_email;
	private String u_styles;
	private String user_username;//買家ID
	private Date create_date;
	
	public RecordParticipantBean() {

	}

	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public String getS_username() {
		return s_username;
	}

	public void setS_username(String s_username) {
		this.s_username = s_username;
	}

	public Integer getActivity_id() {
		return activity_id;
	}

	public void setActivity_id(Integer activity_id) {
		this.activity_id = activity_id;
	}

	public String getActivity_topic() {
		return activity_topic;
	}

	public void setActivity_topic(String activity_topic) {
		this.activity_topic = activity_topic;
	}

	public String getU_userid() {
		return u_userid;
	}

	public void setU_userid(String u_userid) {
		this.u_userid = u_userid;
	}

	public String getU_username() {
		return u_username;
	}

	public void setU_username(String u_username) {
		this.u_username = u_username;
	}

	public Integer getU_phone() {
		return u_phone;
	}

	public void setU_phone(Integer u_phone) {
		this.u_phone = u_phone;
	}

	public String getSent_email() {
		return sent_email;
	}

	public void setSent_email(String sent_email) {
		this.sent_email = sent_email;
	}

	public String getU_styles() {
		return u_styles;
	}

	public void setU_styles(String u_styles) {
		this.u_styles = u_styles;
	}

	public String getUser_username() {
		return user_username;
	}

	public void setUser_username(String user_username) {
		this.user_username = user_username;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	//建構子
	public RecordParticipantBean(Integer recordId, String s_username, Integer activity_id, String activity_topic,
			String u_userid, String u_username, Integer u_phone, String sent_email, String u_styles,
			String user_username, Date create_date) {
		super();
		this.recordId = recordId;
		this.s_username = s_username;
		this.activity_id = activity_id;
		this.activity_topic = activity_topic;
		this.u_userid = u_userid;
		this.u_username = u_username;
		this.u_phone = u_phone;
		this.sent_email = sent_email;
		this.u_styles = u_styles;
		this.user_username = user_username;
		this.create_date = create_date;
	}

	
	
	
	
}
