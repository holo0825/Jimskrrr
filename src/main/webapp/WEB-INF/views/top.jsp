<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<style>
        
</style>
<link rel='stylesheet' href="<c:url value='/css/yu.css' />"
	type="text/css" />
</head>
<body>
    <header><h1>聚點時刻 Enjoy Food Together</h1></header>

    <span style="float: right;margin-right: 40px;">
        <a href="./">會員登入</a> 
       <a href="<c:url value='/ManageRestaurant' />">賣家餐廳管理中心</a> 
        <a href="./TwoCart">購物車</a></span>
    <br>

    <h2 style="color:#BB5E00; margin-left: 100px; font-size:xx-large">團購享優惠</h2>

    
    <h2 style="color:#BB5E00; margin-left: 100px; font-size:xx-large">今晚吃些什麼......？</h2><br>
    
    <a href="<c:url value='/searchallrestaurant' />">查詢所有餐廳</a> 

        
</body>
</html>
