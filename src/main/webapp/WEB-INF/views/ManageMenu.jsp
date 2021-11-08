<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<html>
<head>
<meta charset="UTF-8">
<title>>聚點時刻 Enjoy Food Together</title>

<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="assets/css/icons.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/red-color.css">
<link rel="stylesheet" href="assets/css/yellow-color.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<link rel="stylesheet" href="assets/css/yu.css">
</head>
<body>
	<header>
		<div class="topbar">
			<div class="container">
				<div class="topbar-register">
					<a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
					<a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
					<a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>
				</div>
				<div class="social1">
					<a href="#" title="Facebook" itemprop="url" target="_blank"><i
						class="fa fa-facebook-square"></i></a>
				</div>
			</div>
		</div>
		<div class="logo-menu-sec">
			<div class="container" style="margin-left: 450px;">

				<nav>
					<div class="menu-sec">
						<ul>
							<li class="menu-item-has-children"><a href="#"
								title="HOMEPAGES" itemprop="url"><span class="red-clr"></span>首頁</a>
							</li>
							<li class="menu-item-has-children"><a href="#"
								title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
								<ul class="sub-dropdown">
									<li><a href="index.html" title="HOMEPAGE 1" itemprop="url">餐廳管理</a></li>
									<li><a href="index2.html" title="HOMEPAGE 2" itemprop="url">菜單管理</a></li>
								</ul>
							</li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>團購</a></li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>活動</a></li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>討論區</a></li>							
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>會員中心</a></li>
						</ul>
					</div>
				</nav>
				<!-- Navigation -->
			</div>
		</div>		
	</header>
	<hr>
	<div style="text-align:center; font-size:200%;">
	<table style="margin:center;">
		<tr>		
				<a href="<c:url value='/addmenu' />">新增菜單</a><BR>
		</tr>
		<tr>	
				<a href="<c:url value='/searchallmenu' />">查詢店裡所有菜單</a><BR>
		</tr>
		<tr>	
			<!--	<a href="<c:url value='/searchonedish' />">查詢單一菜單</a><BR>  -->
		</tr>
		<tr>	
				<a href="<c:url value='/top' />">回餐廳首頁</a><BR>
		</tr>
	</table>
	</div>

</body>
</html>
