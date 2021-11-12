<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐廳</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="./assets/css/icons.min.css">
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/main.css">
<link rel="stylesheet" href="./assets/css/red-color.css">
<link rel="stylesheet" href="./assets/css/yellow-color.css">
<link rel="stylesheet" href="./assets/css/responsive.css">

</head>

<!-- 前端畫面 買家餐廳首頁 -->

<body>
   <header>
		<div class="topbar">
			<div class="container">
				<div class="topbar-register">
					<a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
					<a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
					<a href="<c:url value='/seller/ManageRestaurant' />">賣家中心</a>
				</div>
				<div class="social1">
					<a href="#" title="Facebook" itemprop="url" target="_blank"><i
						class="fa fa-facebook-square"></i></a>
				</div>
			</div>
		</div>
		<!-- Topbar -->
		<div class="logo-menu-sec">
			<div class="container" style="margin-left: 250px;">
				<div class="logo">
					<h1 itemprop="headline">
						<a href="index.html" title="Home" itemprop="url"><img
							src="assets/images/logo2.png" alt="logo.png" itemprop="image"></a>
					</h1>
				</div>

				<nav>
					<div class="menu-sec">
						<ul>
							<li class="menu-item-has-children"><a href="#"
								title="HOMEPAGES" itemprop="url"><span class="red-clr"></span>首頁</a>
							</li>
							<li class="menu-item-has-children"><a href="#"
								title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
							</li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>團購</a></li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>活動</a></li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>討論區</a></li>
							<li class="menu-item-has-children"><a href="#" title="PAGES"
								itemprop="url"><span class="red-clr"></span>會員中心</a></li>
						<li class="menu-item-has-children"><i class="fas fa-shopping-cart"><a href="./TwoCart">購物車</a></i></li>
						</ul>
						
						
					</div>
				</nav>
				<!-- Navigation -->
			</div>
		</div>
	</header>
    
    <section>
		<div class="block">
			<div style="background-image: url(assets/images/topbg.jpg);"
				class="fixed-bg"></div>
			<div class="restaurant-searching text-center">
				<div class="restaurant-searching-inner">
					<h2 itemprop="headline">
						餐廳 <br>Restaurant
					</h2>
				</div>

			</div>
		</div>
	</section>
	<div class="bread-crumbs-wrapper">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href=./ManageRestaurant
					" title="" itemprop="url">首頁</a></li>
				<li class="breadcrumb-item active">餐廳首頁</li>
			</ol>
		</div>
	</div>
   

    <div style="text-align:center">
    <h2 style="color:#BB5E00; margin:auto; font-size:xx-large"><a href="<c:url value='/searchallrestaurant' />">查詢所有餐廳</a></h2>
    </div>
     

<footer>
		<div class="block top-padd80 bottom-padd80 dark-bg">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-lg-12">
						<div class="footer-data">
							<div class="row">
								<div class="col-md-3 col-sm-6 col-lg-3">
									<div class="widget about_widget wow fadeIn"
										data-wow-delay="0.1s">
										<div class="logo">
											<h1 itemprop="headline">
												<a href="#" title="Home" itemprop="url"><img
													src="assets/images/logo.png" alt="logo.png"
													itemprop="image"></a>
											</h1>
										</div>
										<p itemprop="description">聚點食刻，共享美食每一刻！
										<p>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 col-lg-3">
									<div class="widget information_links wow fadeIn"
										data-wow-delay="0.2s">
										<h4 class="widget-title" itemprop="headline">About Shop</h4>
										<ul>
											<li><a href="#" title="" itemprop="url">購物須知</a></li>
											<li><a href="#" title="" itemprop="url">退換貨政策</a></li>
											<li><a href="#" title="" itemprop="url">付款方式</a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 col-lg-3">
									<div class="widget customer_care wow fadeIn"
										data-wow-delay="0.3s">
										<h4 class="widget-title" itemprop="headline">關於我們</h4>
										<ul>
											<li><a href="#" title="" itemprop="url">會員條款</a></li>
											<li><a href="#" title="" itemprop="url">隱私權保護政策</a></li>
											<li><a href="#" title="" itemprop="url">關於聚點食刻</a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-3 col-sm-6 col-lg-3">
									<div class="widget get_in_touch wow fadeIn"
										data-wow-delay="0.4s">
										<h4 class="widget-title" itemprop="headline">聯絡我們</h4>
										<ul>
											<li><i class="fa fa-envelope"></i> <a href="#" title=""
												itemprop="url">eattogether@food.com</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Footer Data -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="bottom-bar dark-bg text-center">
		<div class="container">
			<p itemprop="description">
				&copy; 2021 <a class="red-clr" href="http://www.bootstrapmb.com"
					title="Webinane" itemprop="url" target="_blank"></a>聚點食刻. All
				Rights Reserved
			</p>
		</div>
	</div>
	</main>
	<script src="./assets/js/jquery.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>
</body>

</html>
