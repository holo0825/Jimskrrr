package com.GroupOne.yang.service;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.GroupOne.yang.model.ArticleBean;

public interface ArticleService {
	
	Optional<ArticleBean> getArticleById(int id);
	
	List<ArticleBean> getArticles();
	
	ArticleBean save(ArticleBean bean);
	
	ArticleBean updateArticle(ArticleBean bean);
	
	void deleteArticleById(int id);
	

//	List<ArticleBean> findByCategory(String category);
//	List<String> getAllCategory();

}
