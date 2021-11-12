package com.GroupOne.yang.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.yang.model.ArticleBean;
import com.GroupOne.yang.service.ArticleService;
import com.GroupOne.yang.validate.ArticleValidator;

@Controller

public class ArticleController {

	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}

	ArticleService articleService;
	ServletContext servletContext;

	@Autowired
	public ArticleController(ArticleService articleService, ServletContext servletContext) {
		this.articleService = articleService;
		this.servletContext = servletContext;
	}

	// 管理員查詢所有文章
	@GetMapping("/_01_article/ShowArticles")
	public String showArticles(Model model) {
		List<ArticleBean> beans = articleService.getArticles();
		model.addAttribute(beans);
		return "_01_article/ShowArticles";
	}

	// 管理員 跳至新增頁面
	@GetMapping("/_01_article/insertArticle")
	public String sendEmptyForm(Model model) {
		return "_01_article/insertArticleForm";
	}

	@ModelAttribute
	public ArticleBean m1() {
		ArticleBean bean = new ArticleBean();
		Timestamp tsTimestamp = new Timestamp(System.currentTimeMillis());
		bean.setRegisterTime(tsTimestamp);
		return bean;
	}

	// 管理員新增
	@PostMapping("_01_article/articles")
	public String save(@ModelAttribute("articleBean") ArticleBean bean, BindingResult result) {
		new ArticleValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_article/insertArticleForm";
		}
		MultipartFile productImage = bean.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		System.out.println(originalFilename);
		bean.setFilename(originalFilename);
		// 建立Blob物件 交由Hibernate寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setArticleImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
			}

		} else {

		}
		// ------------------------
		articleService.save(bean);
		// ------------------------
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, bean.getId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}
		return "redirect:/_01_article/ShowArticles";
	}

	// 管理員跳至編輯頁面
	@GetMapping("_01_article/articles/{id}")
	public String sendArticleForm(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("無效ID");
		}
		Optional<ArticleBean> optional = articleService.getArticleById(id);
		if (optional.isPresent()) {
			ArticleBean bean = optional.get();
			model.addAttribute(bean);
		}
		return "/_01_article/EditForm";
	}

	// 管理員刪除
	@DeleteMapping("/_01_article/articles/{id}")
	public String deleteArticle(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("無效ID");
		}
		Optional<ArticleBean> optional = articleService.getArticleById(id);
		if (optional.isPresent()) {
			articleService.deleteArticleById(id);
		} else {
			throw new RuntimeException("文章不存在 id=" + id);
		}
		return "redirect:/_01_article/ShowArticles";
	}

	// 管理員更新
	@PutMapping("/_01_article/articles/{id}")
	public String update(@ModelAttribute ArticleBean bean, BindingResult result, @PathVariable Integer id) {
		new ArticleValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_article/EditForm";
		}
		MultipartFile productImage = bean.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		System.out.println(originalFilename);
		bean.setFilename(originalFilename);
		// 建立Blob物件 交由Hibernate寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setArticleImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
			}
		}
		// ------------------------
		articleService.save(bean);
		// ------------------------
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, bean.getId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}
		return "redirect:/_01_article/ShowArticles";
	}

	// 管理員找單筆
	@GetMapping("/_01_article/ShowOneArticle")
	public String showOneArticle(Model model, @RequestParam("id") Integer id) {
		ArticleBean articleBean = new ArticleBean();
		Optional<ArticleBean> beans = articleService.getArticleById(id);
		articleBean = beans.get();
		model.addAttribute("article", articleBean);
		System.out.println(articleBean.getTitle());
		return "_01_article/ShowOneArticle";
	}

	// 訪客查詢所有文章
	@GetMapping("/ShowArticlesGuest")
	public String showArticlesGuest(Model model) {
		List<ArticleBean> beans = articleService.getArticles();
		model.addAttribute(beans);
		return "_01_article/ShowArticlesGuest";
	}

	// 訪客找單筆
	@GetMapping("/_01_article/ShowOneArticleGuest")
	public String showOneArticleGuest(Model model, @RequestParam("id") Integer id) {
		ArticleBean articleBean = new ArticleBean();
		Optional<ArticleBean> beans = articleService.getArticleById(id);
		articleBean = beans.get();
		model.addAttribute("article", articleBean);
		System.out.println(articleBean.getTitle());
		return "_01_article/ShowOneArticleGuest";
	}

//	// 顯示所有category
//	@GetMapping("/queryByCategory")
//	public String getCategoryList(Model model) {
//		List<String> list = articleService.getAllCategory();
//		model.addAttribute("categoryList", list);
//		return "_01_article/ShowArticlesGuest";
//	}
//	//訪客依category查
//	@GetMapping("/articles/{category}")
//	public String findArticleByCategory(
//		@PathVariable("category") String category,Model model
//){
//		List<ArticleBean> articles = articleService.findByCategory(category);
//		model.addAttribute("articles",articles);
//		return "ShowArticlesGuest";
//	}
//
	// 會員查詢所有文章
	@GetMapping("/_01_article/ShowArticlesUser")
	public String showArticlesUser(Model model) {
		List<ArticleBean> beans = articleService.getArticles();
		model.addAttribute(beans);
		return "_01_article/ShowArticlesUser";
	}

	// 會員跳至新增頁面
	@GetMapping("/_01_article/insertArticleUser")
	public String sendEmptyFormUser(Model model) {
		return "_01_article/insertArticleUser";
	}

	// 會員新增貼文
	@PostMapping("_01_article/articlesUser")
	public String saveUser(@ModelAttribute("articleBean") ArticleBean bean, BindingResult result) {
		new ArticleValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_article/insertArticleUser";
		}
		MultipartFile productImage = bean.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		System.out.println(originalFilename);
		bean.setFilename(originalFilename);
		// 建立Blob物件 交由Hibernate寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setArticleImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
			}
		}
		// ------------------------
		articleService.save(bean);
		// ------------------------
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, bean.getId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}
		return "redirect:/_01_article/ShowArticlesUser";
	}

	// 會員找單筆
	@GetMapping("/_01_article/ShowOneArticleUser")
	public String showOneArticleUser(Model model, @RequestParam("id") Integer id) {
		ArticleBean articleBean = new ArticleBean();
		Optional<ArticleBean> beans = articleService.getArticleById(id);
		articleBean = beans.get();
		model.addAttribute("article", articleBean);
		System.out.println(articleBean.getTitle());
		return "_01_article/ShowOneArticleUser";
	}

	// 跳至編輯頁面
	@GetMapping("_01_article/articlesUser/{id}")
	public String sendArticleFormUser(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("無效ID");
		}
		Optional<ArticleBean> optional = articleService.getArticleById(id);
		if (optional.isPresent()) {
			ArticleBean bean = optional.get();
			model.addAttribute(bean);
		}
		return "/_01_article/EditFormUser";
	}

	// 會員更新
	@PutMapping("/_01_article/articlesUser/{id}")
	public String updateUser(@ModelAttribute ArticleBean bean, BindingResult result, @PathVariable Integer id) {
		new ArticleValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_article/EditFormUser";
		}
		MultipartFile productImage = bean.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		System.out.println(originalFilename);
		bean.setFilename(originalFilename);
		// 建立Blob物件 交由Hibernate寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setArticleImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
			}
		}
		// ------------------------
		articleService.save(bean);
		// ------------------------
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, bean.getId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}
		return "redirect:/_01_article/ShowArticlesUser";
	}

	// 會員刪除
	@DeleteMapping("/_01_article/articlesUser/{id}")
	public String deleteArticleUser(Model model, @PathVariable(required = false) Integer id) {
		if (id == null) {
			throw new RuntimeException("無效ID");
		}
		Optional<ArticleBean> optional = articleService.getArticleById(id);
		if (optional.isPresent()) {
			articleService.deleteArticleById(id);
		} else {
			throw new RuntimeException("文章不存在 id=" + id);
		}
		return "redirect:/_01_article/ShowArticlesUser";
	}
}