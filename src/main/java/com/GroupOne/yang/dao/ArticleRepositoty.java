package com.GroupOne.yang.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.yang.model.ArticleBean;

public interface ArticleRepositoty extends JpaRepository<ArticleBean, Integer> {

	Optional<ArticleBean> findByCategory(String category);

}
