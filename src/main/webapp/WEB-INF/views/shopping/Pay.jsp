<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>聚點食刻</title>
    <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../assets/css/icons.min.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/red-color.css">
    <link rel="stylesheet" href="../assets/css/yellow-color.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <style>
    	.paybox{
            height: 75px;
            text-align: center;
        }
    </style>
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
                    <c:choose>
	                    <c:when test="${empty user}">
	                        <a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
	                        <a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
	                        <a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>
	                    </c:when>
	                    <c:otherwise>
	                    	<span>${user.getUsername()}</span>
	                    </c:otherwise>
                    </c:choose>
                    </div>
                    <div class="social1">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                    </div>
                </div>
            </div>
            <!-- Topbar -->
            <div class="logo-menu-sec">
                <div class="container" style="margin-left: 350px;">

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
        <section>
            <div class="block">
                <div style="background-image: url(../assets/images/topbg.jpg);" class="fixed-bg"></div>
                <div class="restaurant-searching text-center">
                    <div class="restaurant-searching-inner">
                        <h2 itemprop="headline">
                            聚點食刻<br> Enjoy Food Together
                        </h2>
                        
                </div>

                <!-- <img class="bottom-clouds-mockup" src="assets/images/resource/clouds.png" alt="clouds.png" itemprop="image"> -->
            </div>
            <!-- Restaurant Searching -->
            </div>
        </section>
        <div class="bread-crumbs-wrapper">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#" title="" itemprop="url">首頁</a></li>
                    <li class="breadcrumb-item active">付款成功</li>
                </ol>
            </div>
        </div>
        <section>
            <div class="block less-spacing gray-bg top-padd30">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="sec-box">
                                  <div class="loc-map" id="loc-map">
                                    <div class="shopping_div">
                                    	<div class="paybox">
                                    	<h2>付款成功 !</h2>
										</div>
                                    	<div class="paybox"><button id="back"><i class="fas fa-undo-alt"></i>按此回首頁</button></br>
                                    		<p class="payboxp">(3秒後自動換頁)</p>
										</div>
                                    </div>
                                  </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="block top-padd80 bottom-padd80 dark-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="footer-data">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget about_widget wow fadeIn" data-wow-delay="0.1s">
                                            <div class="logo">
                                                <h1 itemprop="headline">
                                                    <a href="#" title="Home" itemprop="url"><img src="../assets/images/logo.png" alt="logo.png" itemprop="image"></a>
                                                </h1>
                                            </div>
                                            <p itemprop="description">聚點食刻，共享美食每一刻！
                                                <p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget information_links wow fadeIn" data-wow-delay="0.2s">
                                            <h4 class="widget-title" itemprop="headline">About Shop</h4>
                                            <ul>
                                                <li>
                                                    <a href="#" title="" itemprop="url">購物須知</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">退換貨政策</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">付款方式</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget customer_care wow fadeIn" data-wow-delay="0.3s">
                                            <h4 class="widget-title" itemprop="headline">關於我們</h4>
                                            <ul>
                                                <li>
                                                    <a href="#" title="" itemprop="url">會員條款</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">隱私權保護政策</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">關於聚點食刻</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget get_in_touch wow fadeIn" data-wow-delay="0.4s">
                                            <h4 class="widget-title" itemprop="headline">聯絡我們</h4>
                                            <ul>
                                                <li>
                                                    <i class="fa fa-envelope"></i>
                                                    <a href="#" title="" itemprop="url">eattogether@food.com</a>
                                                </li>
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
                    &copy; 2021
                    <a class="red-clr" href="http://www.bootstrapmb.com" title="Webinane" itemprop="url" target="_blank"></a>聚點食刻. All Rights Reserved
                </p>
            </div>
        </div>
    </main><!-- Main Wrapper -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/google-map-int.js"></script>
    <script src="../assets/js/main.js"></script>
    <script src="http://ditu.google.cn/maps/api/js?v=3.exp"></script>
    <script src="http://www.google.cn/recaptcha/api.js"></script>
    <script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
    <script>
	    $(function(){
	        $('#back').on('click',function(){
	            location.href = '<c:url value='/home' />'
	        })
	
	        setTimeout(function(){
	            window.location.href ="<c:url value='AllCarts' />"
	        },3000)
	    })
	</script>
</body>

</html>