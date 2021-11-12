package com.GroupOne.yang.model;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "article4")
public class ArticleBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String username;
	private String title;
	private String content;
	private String category;
	private Timestamp registerTime;
	private Blob articleImage;
	
	@Transient
	private String filename;
	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public ArticleBean(String username, String title, String content, String category, Timestamp registerTime) {
		this.username = username;
		this.title = title;
		this.content = content;
		this.category = category;
		this.registerTime = registerTime;
	}

	public ArticleBean(String username, String title, String content, String category, Timestamp registerTime,
			Blob articleImage) {
		this.username = username;
		this.title = title;
		this.content = content;
		this.category = category;
		this.registerTime = registerTime;
		this.articleImage = articleImage;
	}

	public Blob getArticleImage() {
		return articleImage;
	}

	public void setArticleImage(Blob articleImage) {
		this.articleImage = articleImage;
	}

	public ArticleBean() {
	}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}
	@Transient
	 int VerificationCode;
	 
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
	
}
