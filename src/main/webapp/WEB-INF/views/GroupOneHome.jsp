<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Food Ordering HTML Template</title>
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="assets/css/icons.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
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
                        <!-- <a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
                         <a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
                         <a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>-->
                        
                        <c:choose>
                            <c:when test="${user.username == null}">
                                <a  href="home" title="Login" itemprop="url">登入</a>
                                <a  href="./register" title="Register" itemprop="url">註冊</a>
                                <a  href="home" title="Register" itemprop="url">賣家中心</a>
                            </c:when>
                            <c:otherwise>
                                <span>${user.getUsername()}</span>&nbsp&nbsp&nbsp
                                <a class="sign-popup-btn" href="logout" title="Register" itemprop="url">登出</a>
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
                                    <a href="./home" title="HOMEPAGES" itemprop="url"><span class="red-clr"></span>首頁</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="./top" title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="./groupbuy/customer" title="PAGES" itemprop="url"><span class="red-clr"></span>團購</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="<c:url value='/ActivityPage' />" title="PAGES" itemprop="url"><span class="red-clr"></span>活動</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="./ShowArticlesGuest" title="PAGES" itemprop="url"><span class="red-clr"></span>討論區</a>

                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>購物車</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="<c:url value='/user/CartList/food' />" title="food" itemprop="url">訂餐</a>
                                        </li>
                                        <li>
                                            <a href="<c:url value='/user/CartList/coupon' />" title="coupon" itemprop="url">團購</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="PAGES" itemprop="url"><span class="red-clr"></span>會員中心</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="<c:url value='/user/AllCarts' />" itemprop="url">訂單紀錄</a>
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
                <div style="background-image: url(assets/images/topbg.jpg);" class="fixed-bg"></div>
                <div class="restaurant-searching text-center">
                    <div class="restaurant-searching-inner">
                        <h2 itemprop="headline">
                            聚點食刻<br>Enjoy Food Together
                        </h2>

                    </div>

        <img class="bottom-clouds-mockup" src="assets/images/resource/clouds.png" alt="clouds.png" itemprop="image">
    </div>
    <!-- Restaurant Searching -->
</div>
        </section>
        <section>
            <div class="block remove-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="title1-wrapper text-center">
                                <div class="title1-inner">
                                    <span>Featured Restaurant</span>
                                    <h2 itemprop="headline">精選餐廳</h2>
                                    <p itemprop="description">本站精選多家美味餐廳提供顧客選擇</p>
                                </div>
                            </div>
                            <div class="top-restaurants-wrapper">
                                <ul class="restaurants-wrapper style2">
                                    <li class="wow bounceIn" data-wow-delay="0.2s">
                                        <div class="top-restaurant">
                                            <a class="brd-rd50" href="#" title="Restaurant 1" itemprop="url"><img src="assets/images/resource/top-restaurant1.png" alt="top-restaurant1.png" itemprop="image"></a>
                                        </div>
                                    </li>
                                    <li class="wow bounceIn" data-wow-delay="0.4s">
                                        <div class="top-restaurant">
                                            <a class="brd-rd50" href="#" title="Restaurant 2" itemprop="url"><img src="assets/images/resource/top-restaurant2.png" alt="top-restaurant2.png" itemprop="image"></a>
                                        </div>
                                    </li>
                                    <li class="wow bounceIn" data-wow-delay="0.6s">
                                        <div class="top-restaurant">
                                            <a class="brd-rd50" href="#" title="Restaurant 3" itemprop="url"><img src="assets/images/resource/top-restaurant3.png" alt="top-restaurant3.png" itemprop="image"></a>
                                        </div>
                                    </li>
                                    <li class="wow bounceIn" data-wow-delay="0.8s">
                                        <div class="top-restaurant">
                                            <a class="brd-rd50" href="#" title="Restaurant 4" itemprop="url"><img src="assets/images/resource/top-restaurant4.png" alt="top-restaurant4.png" itemprop="image"></a>
                                        </div>
                                    </li>
                                    <li class="wow bounceIn" data-wow-delay="1s">
                                        <div class="top-restaurant">
                                            <a class="brd-rd50" href="#" title="Restaurant 5" itemprop="url"><img src="assets/images/resource/top-restaurant5.png" alt="top-restaurant5.png" itemprop="image"></a>
                                        </div>
                                    </li>
                                    <li class="wow bounceIn" data-wow-delay="1.2s">
                                        <div class="top-restaurant">
                                            <a class="brd-rd50" href="#" title="Restaurant 5" itemprop="url"><img src="assets/images/resource/top-restaurant6.png" alt="top-restaurant6.png" itemprop="image"></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- top resturents -->
        <section>
            <div class="block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="title1-wrapper text-center">
                                <div class="title1-inner">
                                    <span>Maybe you want some......?</span>
                                    <h3 itemprop="headline">你可能會想吃的......？</h3>
                                </div>
                            </div>
                            <div class="row remove-ext5">
                                <div class="col-md-4 col-sm-6 col-lg-4">
                                    <div class="popular-dish-box wow fadeIn" data-wow-delay="0.2s">
                                        <div class="popular-dish-thumb">
                                            <a href="food-detail.html" title="" itemprop="url"><img src="assets/images/resource/popular-dish-img1.jpg" alt="popular-dish-img1.jpg" itemprop="image"></a>


                                        </div>
                                        <div class="popular-dish-info">
                                            <h4 itemprop="headline">
                                                <a href="food-detail.html" title="" itemprop="url">菜名</a>
                                            </h4>
                                            <p itemprop="description">菜色介紹</p>
                                            <span class="price">$價格</span>
                                            <a class="brd-rd2" href="food-detail.html" title="Order Now" itemprop="url">了解更多</a>
                                            <div class="restaurant-info">
                                                <div class="restaurant-info-inner">
                                                    <h6 itemprop="headline">
                                                        <a href="restaurant-detail.html" title="" itemprop="url">餐廳名稱</a>
                                                    </h6>
                                                    <span class="red-clr">餐廳地址</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Popular Dish Box -->
                                </div>
                                <div class="col-md-4 col-sm-6 col-lg-4">
                                    <div class="popular-dish-box wow fadeIn" data-wow-delay="0.4s">
                                        <div class="popular-dish-thumb">
                                            <a href="food-detail.html" title="" itemprop="url"><img src="assets/images/resource/popular-dish-img2.jpg" alt="popular-dish-img2.jpg" itemprop="image"></a>
                                        </div>
                                        <div class="popular-dish-info">
                                            <h4 itemprop="headline">
                                                <a href="food-detail.html" title="" itemprop="url">菜名</a>
                                            </h4>
                                            <p itemprop="description">菜色介紹</p>
                                            <span class="price">$價格</span>
                                            <a class="brd-rd2" href="food-detail.html" title="Order Now" itemprop="url">了解更多</a>
                                            <div class="restaurant-info">
                                                <div class="restaurant-info-inner">
                                                    <h6 itemprop="headline">
                                                        <a href="restaurant-detail.html" title="" itemprop="url">餐廳名稱
                                                        </a>
                                                    </h6>
                                                    <span class="red-clr">餐廳地址</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Popular Dish Box -->
                                </div>
                                <div class="col-md-4 col-sm-6 col-lg-4">
                                    <div class="popular-dish-box wow fadeIn" data-wow-delay="0.6s">
                                        <div class="popular-dish-thumb">
                                            <a href="food-detail.html" title="" itemprop="url"><img src="assets/images/resource/popular-dish-img3.jpg" alt="popular-dish-img3.jpg" itemprop="image"></a>
                                        </div>
                                        <div class="popular-dish-info">
                                            <h4 itemprop="headline">
                                                <a href="food-detail.html" title="" itemprop="url">菜名</a>
                                            </h4>
                                            <p itemprop="description">菜色介紹</p>
                                            <span class="price">$價格</span>
                                            <a class="brd-rd2" href="food-detail.html" title="Order Now" itemprop="url">了解更多</a>
                                            <div class="restaurant-info">
                                                <div class="restaurant-info-inner">
                                                    <h6 itemprop="headline">
                                                        <a href="restaurant-detail.html" title="" itemprop="url">餐廳名稱</a>
                                                    </h6>
                                                    <span class="red-clr">餐廳地址</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Popular Dish Box -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- choose and enjoy meal -->
        <section>
            <div class="block grayish low-opacity ">
                <div class="fixed-bg" style="background-image: url(assets/images/pattern.png)"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="filters-wrapper">
                                <div class="title1-wrapper text-center">
                                    <div class="title1-inner">
                                        <span>Buy Together Eat Together Fat Together</span>
                                        <h3 itemprop="headline">「相聚」享好康 -- 精選團購優惠</h3>
                                    </div>
                                </div>
                                <div class="filters-inner">
                                    <div class="row">
                                        <div class="masonry">
                                            <div class="col-md-6 col-sm-6 col-lg-6 filter-item filter-item1">
                                                <div class="featured-restaurant-box style2 brd-rd12 wow fadeIn" data-wow-delay="0.1s">
                                                    <div class="featured-restaurant-thumb">
                                                        <a href="restaurant-detail.html" title="" itemprop="url"><img src="assets/images/resource/most-popular-img1-1.png" alt="most-popular-img1-1.png" itemprop="image"></a>
                                                    </div>
                                                    <div class="featured-restaurant-info">
                                                        <span class="red-clr">團購截止日：即日起~2021/11/30</span>
                                                        <h4 itemprop="headline">
                                                            <a href="restaurant-detail.html" title="" itemprop="url">優惠券名稱</a>
                                                        </h4>
                                                        <span class="food-types">簡介:</span>
                                                        <span class="price">$優惠價：</span>
                                                        <ul class="post-meta">
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>購買條件限制：
                                                            </li>
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>成團條件：
                                                            </li>
                                                            <li>
                                                                <i class="flaticon-money"></i>付款方式：信用卡、匯款
                                                            </li>
                                                        </ul>
                                                        <span class="post-likes style2 red-clr"><i class="fa fa-heart-o"></i>19</span>
                                                        <a class="brd-rd5" href="restaurant-detail.html" title="Order Online">立即搶購</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-lg-6 filter-item filter-item2">
                                                <div class="featured-restaurant-box style2 brd-rd12 wow fadeIn" data-wow-delay="0.2s">
                                                    <div class="featured-restaurant-thumb">
                                                        <a href="restaurant-detail.html" title="" itemprop="url"><img src="assets/images/resource/most-popular-img1-2.png" alt="most-popular-img1-2.png" itemprop="image"></a>
                                                    </div>
                                                    <div class="featured-restaurant-info">
                                                        <span class="red-clr">團購截止日：即日起~2021/11/30</span>
                                                        <h4 itemprop="headline">
                                                            <a href="restaurant-detail.html" title="" itemprop="url">優惠券名稱</a>
                                                        </h4>
                                                        <span class="food-types">簡介:</span>
                                                        <span class="price">$優惠價：</span>
                                                        <ul class="post-meta">
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>購買條件限制：
                                                            </li>
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>成團條件：
                                                            </li>
                                                            <li>
                                                                <i class="flaticon-money"></i>付款方式：信用卡、匯款
                                                            </li>
                                                        </ul>
                                                        <span class="post-likes style2 red-clr"><i class="fa fa-heart-o"></i>18</span>
                                                        <a class="brd-rd5" href="restaurant-detail.html" title="Order Online">立即搶購</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-lg-6 filter-item filter-item3">
                                                <div class="featured-restaurant-box style2 brd-rd12 wow fadeIn" data-wow-delay="0.3s">
                                                    <div class="featured-restaurant-thumb">
                                                        <a href="restaurant-detail.html" title="" itemprop="url"><img src="assets/images/resource/most-popular-img1-3.png" alt="most-popular-img1-3.png" itemprop="image"></a>
                                                    </div>
                                                    <div class="featured-restaurant-info">
                                                        <span class="red-clr">團購截止日：即日起~2021/11/30</span>
                                                        <h4 itemprop="headline">
                                                            <a href="restaurant-detail.html" title="" itemprop="url">優惠券名稱</a>
                                                        </h4>
                                                        <span class="food-types">簡介:</span>
                                                        <span class="price">$優惠價：</span>
                                                        <ul class="post-meta">
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>購買條件限制：
                                                            </li>
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>成團條件：
                                                            </li>
                                                            <li>
                                                                <i class="flaticon-money"></i>付款方式：信用卡、匯款
                                                            </li>
                                                        </ul>
                                                        <span class="post-likes style2 red-clr"><i class="fa fa-heart-o"></i>17</span>
                                                        <a class="brd-rd5" href="restaurant-detail.html" title="Order Online">立即搶購</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-lg-6 filter-item filter-item1 filter-item2 filter-item3">
                                                <div class="featured-restaurant-box style2 brd-rd12 wow fadeIn" data-wow-delay="0.4s">
                                                    <div class="featured-restaurant-thumb">
                                                        <a href="restaurant-detail.html" title="" itemprop="url"><img src="assets/images/resource/most-popular-img1-4.png" alt="most-popular-img1-4.png" itemprop="image"></a>
                                                    </div>
                                                    <div class="featured-restaurant-info">
                                                        <span class="red-clr">團購截止日：即日起~2021/11/30</span>
                                                        <h4 itemprop="headline">
                                                            <a href="restaurant-detail.html" title="" itemprop="url">優惠券名稱</a>
                                                        </h4>
                                                        <span class="food-types">簡介:</span>
                                                        <span class="price">$優惠價：</span>
                                                        <ul class="post-meta">
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>購買條件限制：
                                                            </li>
                                                            <li>
                                                                <i class="fa fa-check-circle-o"></i>成團條件：
                                                            </li>
                                                            <li>
                                                                <i class="flaticon-money"></i>付款方式：信用卡、匯款
                                                            </li>
                                                        </ul>
                                                        <span class="post-likes style2 red-clr"><i class="fa fa-heart-o"></i>13</span>
                                                        <a class="brd-rd5" href="restaurant-detail.html" title="Order Online">立即搶購</a>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="rite-meta"><a href="#" title="" class="view-more">查看更多優惠！</a></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Filters Wrapper -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="block blackish low-opacity">
                <div class="fixed-bg" style="background-image: url(assets/images/parallax1.jpg);"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="title1-wrapper text-center">
                                <div class="title1-inner">
                                    <h2 class="text-white" itemprop="headline">簡單步驟即可享受美食！</h2>
                                </div>
                            </div>
                            <div class="remove-ext text-center">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4 col-lg-4">
                                        <div class="step-box wow fadeIn" data-wow-delay="0.2s">
                                            <i><img src="assets/images/resource/setp-img1.png" alt="setp-img1.png" itemprop="image"><span class="brd-rd50 red-bg">1</span></i>
                                            <div class="setp-box-inner">
                                                <h4 itemprop="headline">探索想吃的食物</h4>
                                                <p itemprop="description">多種風格的餐廳以及美食供您選擇！</p>
                                            </div>
                                        </div>
                                        <!-- Step Box -->
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-lg-4">
                                        <div class="step-box wow fadeIn" data-wow-delay="0.4s">
                                            <i><img src="assets/images/resource/setp-img2.png" alt="setp-img2.png" itemprop="image"><span class="brd-rd50 red-bg">2</span></i>
                                            <div class="setp-box-inner">
                                                <h4 itemprop="headline">加入購物車</h4>
                                                <p itemprop="description">想吃什麼放進去就對了！</p>
                                            </div>
                                        </div>
                                        <!-- Step Box -->
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-lg-4">
                                        <div class="step-box wow fadeIn" data-wow-delay="0.6s">
                                            <i><img src="assets/images/resource/setp-img3.png" alt="setp-img3.png" itemprop="image"><span class="brd-rd50 red-bg">3</span></i>
                                            <div class="setp-box-inner">
                                                <h4 itemprop="headline">結帳</h4>
                                                <p itemprop="description">拿出你的魔法小卡！</p>
                                            </div>
                                        </div>
                                        <!-- Step Box -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="block">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="title1-wrapper text-center">
                                <div class="title1-inner">
                                    <h2 itemprop="headline">熱力「聚」集 -- 活動專區</h2>
                                </div>
                            </div>
                            <div class="featured-restaurants-wrapper">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-lg-6">
                                        <div class="featured-restaurants-list">
                                            <div class="featured-restaurant-box wow fadeIn" data-wow-delay="0.1s">
                                                <div class="featured-restaurant-thumb">
                                                    <a href="#" title="" itemprop="url"><img class="brd-rd2" src="assets/images/resource/Activitysmall3.jpg" alt="Activitysmall3.jpg" itemprop="image"></a>
                                                </div>
                                                <div class="featured-restaurant-info">
                                                    <span class="red-clr">活動區間:2021/10/28-2021/10/31</span>
                                                    <h4 itemprop="headline">
                                                        <a href="#" title="" itemprop="url">經典普洱茶品茶會</a>
                                                    </h4>
                                                    <span>提到普洱茶您想到的是什麼？身價飆漲千倍的投資商品？能降血脂的健康飲品？港式飲茶必備的選擇？其實普洱茶沒有那麼複雜，好的普洱茶也不是天價茶，身為在六大茶系中唯一的全發酵茶，不僅咖啡因比較少，對於心血管還能達到保健的效果呢！</span>
                                                   
                                                </div>
                                            </div>
                                            <div class="featured-restaurant-box wow fadeIn" data-wow-delay="0.2s">
                                                <div class="featured-restaurant-thumb">
                                                    <a href="#" title="" itemprop="url"><img class="brd-rd2" src="assets/images/resource/featured-restaurant-img2.jpg" alt="featured-restaurant-img2.jpg" itemprop="image"></a>
                                                </div>
                                                <div class="featured-restaurant-info">
                                                    <span class="red-clr">活動區間:2021/11/23-2021/11/30</span>
                                                    <h4 itemprop="headline">
                                                        <a href="#" title="" itemprop="url">肉食系!手作PIZZA｜廚藝｜教室｜料理｜小班制</a>
                                                    </h4>
                                                    <span>繼上回的蔬食pizza廣受好評，大家敲碗想再上肉食pizza，除了經典培根芝麻葉披薩，還有多種肉食口味等你來品嚐！</span>
                                                    
                                                </div>
                                            </div>
                                            <div class="featured-restaurant-box wow fadeIn" data-wow-delay="0.3s">
                                                <div class="featured-restaurant-thumb">
                                                    <a href="#" title="" itemprop="url"><img class="brd-rd2" src="assets/images/resource/Activitysmall4.jpg" alt="Activitysmall4.jpg" itemprop="image"></a>
                                                </div>
                                                <div class="featured-restaurant-info">
                                                    <span class="red-clr">活動區間:2021/10/21-2021/10/30</span>
                                                    <h4 itemprop="headline">
                                                        <a href="#" title="" itemprop="url">酉鬼啤酒全臺巡演｜兩歲生日喝喝喝</a>
                                                    </h4>
                                                    <span>酉鬼啤酒要兩歲了！感謝大家一直以來對我們的支持與愛護。眼看疫情趨緩，是時候以慶生之名把大家揪在一起開心</span>
                                                    
                                                </div>
                                             </div>
                                        </div>
                                    <!-- Featured Restaurants List -->
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-lg-6">
                                        <div class="featured-restaurant-gallery">
                                            <div class="featured-restaurant-carousel">
                                                <div class="featured-restaurant-thumb">
                                                    <img class="brd-rd2" src="assets/images/resource/Activity1.jpg" alt="Activity1.jpg" itemprop="image">
                                                </div>
                                                <div class="featured-restaurant-thumb">
                                                    <img class="brd-rd2" src="assets/images/resource/Activity2.jpg" alt="Activity2.jpg" itemprop="image">
                                                </div>
                                            </div>
                                            <div class="featured-restaurant-box">
                                                <div class="featured-restaurant-info">
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Featured Restaurant Gallery -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="block bottom-padd210">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title1-wrapper text-center">
                                <div class="title1-inner">
                                    <span>Discuss and Share with Everybody</span>
                                    <h2 itemprop="headline">討論區精選文章</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-lg-4">
                            <div class="article-dev wow fadeIn" data-wow-delay="0.2s">
                                <figure><img src="assets/images/resource/article1.jpg" alt=""></figure>
                                <div class="article-data">
                                    <div class="article-info-meta">
                                        <a href="#" title="">2021-10-31</a>
                                        <a href="#" title="">By JackeyLee</a>
                                    </div>
                                    <div class="article-meta">
                                        <h3>
                                            <a href="#" title="">精選評價燒肉吃到飽</a>
                                        </h3>
                                        <div class="like-meta">
                                            <span><i class="fa fa-heart-o"></i>12</span>
                                            <span><i class="fa fa-comment-o"></i>7</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-lg-4">
                            <div class="article-dev wow fadeIn" data-wow-delay="0.4s">
                                <figure><img src="assets/images/resource/article2.jpg" alt=""></figure>
                                <div class="article-data">
                                    <div class="article-info-meta">
                                        <a href="#" title="">2021-10-11</a>
                                        <a href="#" title="">By Iamadog</a>
                                    </div>
                                    <div class="article-meta">
                                        <h3>
                                            <a href="#" title="">光棍節有人要一起吃飯讓單身狗不再孤單嗎？(內有餐廳資訊)</a>
                                        </h3>
                                        <div class="like-meta">
                                            <span><i class="fa fa-heart-o"></i>0</span>
                                            <span><i class="fa fa-comment-o"></i>11</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-lg-4">
                            <div class="article-dev wow fadeIn" data-wow-delay="0.6s">
                                <figure><img src="assets/images/resource/article3.jpg" alt=""></figure>
                                <div class="article-data">
                                    <div class="article-info-meta">
                                        <a href="#" title="">2021-11-25</a>
                                        <a href="#" title="">By CatMeowMeow222</a>
                                    </div>
                                    <div class="article-meta">
                                        <h3>
                                            <a href="#" title="">十大聖誕大餐選擇評比</a>
                                        </h3>
                                        <div class="like-meta">
                                            <span><i class="fa fa-heart-o"></i>25</span>
                                            <span><i class="fa fa-comment-o"></i>12</span>
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
                                                    <a href="#" title="Home" itemprop="url"><img src="assets/images/logo.png" alt="logo.png" itemprop="image"></a>
                                                </h1>
                                            </div>
                                            <p itemprop="description">聚點食刻，共享美食每一刻！<p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget information_links wow fadeIn" data-wow-delay="0.2s">
                                            <h4 class="widget-title" itemprop="headline">購物流程</h4>
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
                                                    <a href="#" title="" itemprop="url">hello@yourdomain.com</a>
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
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
</body>
</html>