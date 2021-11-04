package com.GroupOne.yang.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

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

import com.GroupOne.yang.model.ArticleBean;
import com.GroupOne.yang.service.ArticleService;
import com.GroupOne.yang.validate.ArticleValidator;

@Controller

public class ArticleController {

	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}

	ArticleService articleService;

	// 查詢所有文章
	@GetMapping("/_01_article/ShowArticles")
	public String showArticles(Model model) {
		List<ArticleBean> beans = articleService.getArticles();
		model.addAttribute(beans);
		return "_01_article/ShowArticles";
	}

	// 跳至新增頁面
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

	// 新增
	@PostMapping("_01_article/articles")
	public String save(@ModelAttribute ArticleBean bean, BindingResult result) {
		new ArticleValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_article/insertArticleForm";
		}
		articleService.save(bean);
		return "redirect:/_01_article/ShowArticles";
	}

	// 跳至編輯頁面
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

	// 刪除
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

	// 更新
	@PutMapping("/_01_article/articles/{id}")
	public String save(@ModelAttribute ArticleBean bean, BindingResult result, @PathVariable Integer id) {
		new ArticleValidator().validate(bean, result);
		if (result.hasErrors()) {
			return "_01_article/EditForm";
		}
		articleService.save(bean);
		return "redirect:/_01_article/ShowArticles";
	}

	// 找單筆
	@GetMapping("/_01_article/ShowOneArticle")
	public String showOneArticle(Model model, @RequestParam("id") Integer id) {
		ArticleBean articleBean = new ArticleBean();
		Optional<ArticleBean> beans = articleService.getArticleById(id);
		articleBean = beans.get();
		model.addAttribute("article",articleBean);
		System.out.println(articleBean.getTitle());
		return "_01_article/ShowOneArticle";
	}

}
