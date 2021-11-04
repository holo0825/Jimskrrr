package com.GroupOne.yang.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.GroupOne.yang.model.ArticleBean;

public interface ArticleRepositoty extends JpaRepository<ArticleBean, Integer> {

}
