<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="<c:url value='/css/yu.css' />"
	type="text/css" />
<title>Restaurant for Menu</title>
</head>
<body>
<c:forEach var='restaurant' items='${rstName}'>
	<section>
			<header>
				<h1>${restaurant.rsttName}</h1>
			</header>
	</section>
	<div align='center'>
		<a href="<c:url value='/' />">回首頁</a>
		<a href="<c:url value='/' />">會員中心</a>
		<a href="<c:url value='/' />">購物車</a>
	</div>
	
	<hr>
	<section class="container">
		<div class="row">
				<div>
					<p>地址：${restaurant.rstAddress}</p>
					<p>電話：${product.rsttel}</p>
					<p>類型：${product.category}</p>
				</div>
							
				<div>							
					<p>${menu.menuBean.productName}</p>
					<p>餐點照片：/getPicture/${menu.dishImage}</p>
					<p>價格：${menu.price}</p>
				</div>
				
				<div class="sub">
				<input type="submit" name="submit" value="新增至購物車"> 
				</div>
				
			</div>
	</section>
</c:forEach>
</body>
</html>