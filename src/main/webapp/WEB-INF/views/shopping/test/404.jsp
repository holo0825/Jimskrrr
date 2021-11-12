<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Food Ordering HTML Template</title>
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="assets/css/icons.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/red-color.css">
<link rel="stylesheet" href="assets/css/yellow-color.css">
<link rel="stylesheet" href="assets/css/responsive.css">
</head>
<body itemscope>
	 <main>
        <div class="preloader">
            <div id="cooking">
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div id="area">
                    <div id="sides">
                        <div id="pan"></div>
                        <div id="handle"></div>
                    </div>
                    <div id="pancake">
                        <div id="pastry"></div>
                    </div>
                </div>
            </div>
        </div>
        <header class="stick">
            <div class="topbar">
                <div class="container">
                    <div class="topbar-register">
                        <a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
                        <a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
                        <a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>
                    </div>
                    <div class="social1">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                    </div>
                </div>
            </div>
            <!-- Topbar -->
            <div class="logo-menu-sec">
                <div class="container">
<!-- 					<div class="logo"> -->
<!-- 						<h1 itemprop="headline"> -->
<!-- 							<a href="index.html" title="Home" itemprop="url"><img -->
<!-- 								src="assets/images/logo2.png" alt="logo.png" itemprop="image"></a> -->
<!-- 						</h1> -->
<!-- 					</div> -->
                    <nav>
                        <div class="menu-sec">
                            <ul>
                                <li class="menu-item-has-children">
                                    <a href="#" title="HOMEPAGES" itemprop="url"><span class="red-clr"></span>首頁</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="index.html" title="HOMEPAGE 1" itemprop="url">HOMEPAGE 1</a>
                                        </li>
                                        <li>
                                            <a href="index2.html" title="HOMEPAGE 2" itemprop="url">HOMEPAGE 2</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>團購</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>活動</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>討論區</a>

                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>購物車</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="./CartList/food" itemprop="url">訂餐</a>
                                        </li>
                                        <li>
                                            <a href="./CartList/coupon" itemprop="url">團購</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>會員中心</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="./AllCarts" itemprop="url">訂單紀錄</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>

                        </div>
                    </nav>
                    <!-- Navigation -->
                </div>
            </div>
            <!-- Logo Menu Section -->
        </header>
		<!-- Header -->
	
		<!-- Responsive Header -->
		<section>
			<div class="block">
				<div style="background-image: url(assets/images/topbg.jpg);"
					class="fixed-bg"></div>
				<div class="error-page-wrapper text-center">
					<div class="error-page-inner">
						<h1 itemprop="headline">
							系統忙碌中 <span class="red-clr">Error</span>
						</h1>
						<h4 itemprop="headline">
							<span class="yellow-clr">Oops,</span>This Page Not Found!
						</h4>
						<p itemprop="description">Vivam pulput vehic Mauris porttitor
							erovel sapien Sed ut persp tatem semper mi, at ultricies odio.</p>
						<a class="brd-rd2 yellow-bg" href="#" title="" itemprop="url"><i
							class="fa fa-home"></i>BACK TO HOME</a>
						
					</div>
				</div>
				<!-- Error Page Wrapper -->
			</div>
		</section>
		<div class="bottom-bar dark-bg text-center">
			<div class="container">
				<p itemprop="description">
					&copy; 2018 <a class="red-clr" href="http://www.bootstrapmb.com"
						title="Webinane" itemprop="url" target="_blank">WEBINANE</a>. All
					Rights Reserved
				</p>
			</div>
		</div>
		<!-- Bottom Bar -->
		<div class="log-popup text-center">
			<div class="sign-popup-wrapper brd-rd5">
				<div class="sign-popup-inner brd-rd5">
					<a class="log-close-btn" href="#" title="" itemprop="url"><i
						class="fa fa-close"></i></a>
					<div class="sign-popup-title text-center">
						<h4 itemprop="headline">SIGN IN</h4>
						<span>with your social network</span>
					</div>
					<div class="popup-social text-center">
						<a class="facebook brd-rd3" href="#" title="Facebook"
							itemprop="url" target="_blank"><i class="fa fa-facebook"></i>Facebook</a><a
							class="google brd-rd3" href="#" title="Google Plus"
							itemprop="url" target="_blank"><i class="fa fa-google-plus"></i>Google</a><a
							class="twitter brd-rd3" href="#" title="Twitter" itemprop="url"
							target="_blank"><i class="fa fa-twitter"></i>Twitter</a>
					</div>
					<span class="popup-seprator text-center"><i class="brd-rd50">or</i></span>
					<form class="sign-form">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-lg-12">
								<input class="brd-rd3" type="text"
									placeholder="Username or Email">
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<input class="brd-rd3" type="password" placeholder="Password">
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<button class="red-bg brd-rd3" type="submit">SIGN IN</button>
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<a class="sign-btn" href="#" title="" itemprop="url">Not a
									member? Sign up</a><a class="recover-btn" href="#" title=""
									itemprop="url">Recover my password</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="sign-popup text-center">
			<div class="sign-popup-wrapper brd-rd5">
				<div class="sign-popup-inner brd-rd5">
					<a class="sign-close-btn" href="#" title="" itemprop="url"><i
						class="fa fa-close"></i></a>
					<div class="sign-popup-title text-center">
						<h4 itemprop="headline">SIGN UP</h4>
						<span>with your social network</span>
					</div>
					<div class="popup-social text-center">
						<a class="facebook brd-rd3" href="#" title="Facebook"
							itemprop="url" target="_blank"><i class="fa fa-facebook"></i>Facebook</a><a
							class="google brd-rd3" href="#" title="Google Plus"
							itemprop="url" target="_blank"><i class="fa fa-google-plus"></i>Google</a><a
							class="twitter brd-rd3" href="#" title="Twitter" itemprop="url"
							target="_blank"><i class="fa fa-twitter"></i>Twitter</a>
					</div>
					<span class="popup-seprator text-center"><i class="brd-rd50">or</i></span>
					<form class="sign-form">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-lg-12">
								<input class="brd-rd3" type="text" placeholder="Username">
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<input class="brd-rd3" type="email" placeholder="Email">
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<input class="brd-rd3" type="password" placeholder="Password">
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<button class="red-bg brd-rd3" type="submit">REGISTER
									NOW</button>
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12">
								<a class="sign-btn" href="#" title="" itemprop="url">Already
									Registered? Sign in</a><a class="recover-btn" href="#" title=""
									itemprop="url">Recover my password</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- Main Wrapper -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>