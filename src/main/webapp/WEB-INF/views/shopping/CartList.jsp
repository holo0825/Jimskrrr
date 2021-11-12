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
    <link rel="shortcut icon" href="../../assets/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../../assets/css/icons.min.css">
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/main.css">
    <link rel="stylesheet" href="../../assets/css/red-color.css">
    <link rel="stylesheet" href="../../assets/css/yellow-color.css">
    <link rel="stylesheet" href="../../assets/css/responsive.css">
	<link rel="stylesheet" href="<c:url value='/css/link.css' />">
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
                <div class="container">
                	<div class="logo">
						<h1 itemprop="headline">
							<a href="index.html" title="Home" itemprop="url"><img
								src="../../assets/images/logo2.png" alt="logo.png" itemprop="image"></a>
						</h1>
					</div>
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
                                            <a href="<c:url value='/user/CartList/food' />" itemprop="url">訂餐</a>
                                        </li>
                                        <li>
                                            <a href="<c:url value='/user/CartList/coupon' />" itemprop="url">團購</a>
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
                <div style="background-image: url(../../assets/images/topbg.jpg);" class="fixed-bg"></div>
                <div class="restaurant-searching text-center">
                    <div class="restaurant-searching-inner">
                        <h2 itemprop="headline">
                            購物車<br> Shopping Cart
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
                    <li class="breadcrumb-item active">購物車</li>
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
                                    <c:choose>
                                    <c:when test="${no == -1}">
                                    	<h2 id="noBuy">目前沒有待結帳商品</h2>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="" method="POST" name="shoppingCarts">
                                            <input type="hidden" name="username" value="${info}">
                                            <input type="hidden" id="itemNo" name="itemNo" value="${no}">
                                            <hr>
                                            <div >
                                                <table class="shopping_table">
                                                    <thead class="shopping_thead">
                                                        <tr>
                                                            <th class="pn" colspan="2">商品</th>
                                                            <th class="pr">單價(NT$)</th>
                                                            <th class="nu">數量</th>
                                                            <th class="tdB"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="item">
                                                    <c:forEach items="${cartList}" var="cartList">
                                                    <tr class="itr">
                                                    
                                                    <c:choose>
	                                                    <c:when test="${type == 'coupon' }">
	                                                    	<td>123</td>
	                                                    </c:when>
	                                                    <c:when test="${type == 'food' }">
	                                                    	<td>456</td>
	                                                    </c:when>
	                                                    <c:otherwise>
	                                                        <td class="tdimg" align="center"><img class="img" src="../../images/sc/NoImage.jpg"></td>                                                    
	                                                    </c:otherwise>
                                                    </c:choose>
                                                        
                                                        
                                                        <input type="hidden" class="productName" name="productName" value="${cartList.productName}">
                                                        <td class="tp">${cartList.productName}</td>
                                                        <input type="hidden" class="price" name="price" value="${cartList.price}">
                                                        <td class="tdalign">${cartList.price}</td>
                                                        <td class="tdnu">
                                                            <button type="button" class="minus"><i class="fas fa-minus"></i></button>
                                                            <input type="number" class="number"  size="5" min="1" max="" name="number" value="${cartList.number}">
                                                            <button type="button" class="plus"><i class="fas fa-plus"></i></button>
                                                        </td>
                                                        <td class="tbdel"><button type="button" class="delete"><i class="fas fa-trash-alt"></i></button></td>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                </div>
                                                <div style="float: left;">
                                                    <p>目前持有 <span id="nowPoint" style="color:rgb(0, 191, 255);font-size: 20px;">${havePoint}</span> 點</p>
                                                <input type="radio" id="usePoint" value="0">使用點數折抵(1點=1元)
                                                    <div id="discountDiv" style="display: none;">
                                                        <input type="radio" class="disRadio" name="discount" value="20">20點
                                                        <input type="radio" class="disRadio" name="discount" value="50">50點
                                                        <input type="radio" class="disRadio" name="discount" value="100">100點
                                                        <input type="radio" class="disRadio" name="discount" value="200">200點
                                                        <input type="radio" class="disRadio" name="discount" value="500">500點
                                                    </div>
                                                </div>
                                                <table class="tap2">
                                                    <tr>
                                                        <th class="ap">總金額(NT$)</th>
                                                        <input type="hidden" id="amount" name="amount" value="">
                                                        <th class="ap"><span id="apa"></span></th>
                                                        <th class="ap">點數</th>
                                                        <input type="hidden" id="point" name="point" value="">
                                                        <th class="ap"><span id="app"></span></th>
                                                    </tr>
                                                    <tr id="trDis" style="display: none;">
                                                        <th class="ap">(折扣)</th>
                                                        <input type="hidden" id="disAmount" name="disAmount" value="">
                                                        <th class="ap" id="disa"></th>
                                                        <input type="hidden" id="disPoint" name="disPoint" value="">
                                                        <th class="ap"></th>
                                                        <th class="ap" id="disp"></th>
                                                    </tr>
                                                </table>
                                        </form>
                                        <div class="confirm">
                                                <button id="updata" class="btn btn-danger">
                                                    <i class="fas fa-edit">確認訂單內容</i>
                                                </button>
                                                <button id="pay" class="btn btn-danger" disabled>
                                                    <i class="fas fa-shopping-basket">付款</i>
                                                </button>
                                        </div>
                                    </c:otherwise>
                                    </c:choose>
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
                                                    <a href="#" title="Home" itemprop="url"><img src="../../assets/images/logo.png" alt="logo.png" itemprop="image"></a>
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
    <script src="../../assets/js/jquery.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/plugins.js"></script>
    <script src="../../assets/js/google-map-int.js"></script>
    <script src="../../assets/js/main.js"></script>
<!--     <script src="http://ditu.google.cn/maps/api/js?v=3.exp"></script> -->
<!--     <script src="http://www.google.cn/recaptcha/api.js"></script> -->
    <script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
	<script src="<c:url value='/js/sweetalert2@11.js' />"></script>
	<script src="<c:url value='/js/shopping/cart.js' />"></script>
</body>

</html>