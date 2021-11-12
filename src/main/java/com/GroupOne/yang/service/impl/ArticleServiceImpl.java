package com.GroupOne.yang.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.GroupOne.yang.dao.ArticleRepositoty;
import com.GroupOne.yang.model.ArticleBean;
import com.GroupOne.yang.service.ArticleService;

@Repository
@Transactional
public class ArticleServiceImpl implements ArticleService{
	
	ArticleRepositoty articleRepositoty;
	@Autowired
	public ArticleServiceImpl(ArticleRepositoty articleRepositoty) {
		this.articleRepositoty = articleRepositoty;
	}

	@Override
	public Optional<ArticleBean> getArticleById(int id) {
		return articleRepositoty.findById(id);
	}

	@Override
	public List<ArticleBean> getArticles() {
		return articleRepositoty.findAll();
	}

	@Override
	public ArticleBean save(ArticleBean bean) {
		return articleRepositoty.save(bean);
	}

	@Override
	public ArticleBean updateArticle(ArticleBean bean) {
		return articleRepositoty.save(bean);
	}

	@Override
	public void deleteArticleById(int id) {
		articleRepositoty.deleteById(id);
	}

//	@Override
//	public List<ArticleBean> findByCategory(String category) {
//		return articleRepositoty.findByCategory(category);
//	}
//
//	@Override
//	public List<String> getAllCategory() {
//		return articleRepositoty.getAllCategory();
//	}
	
}
