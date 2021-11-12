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
    <link rel="stylesheet" href="<c:url value='/css/jquery.dataTables.min.css' />">
    <link rel="stylesheet" href="<c:url value='/css/link.css' />">
    <style>
    	td.details-control {
        	background: url('../images/sc/details_open.png') no-repeat center center;
        	cursor: pointer;
	   	}
    	tr.shown td.details-control {
        	background: url('../images/sc/details_close.png') no-repeat center center;
    	}
    	.cancelBd{
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
	                    	<span>${user.getUsername()}</span>&nbsp&nbsp&nbsp
	                    	<a class="sign-popup-btn" href="#" title="Register" itemprop="url">登出</a>
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
								src="../assets/images/logo2.png" alt="logo.png" itemprop="image"></a>
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
                                    <a href="./Customer" title="PAGES" itemprop="url"><span class="red-clr"></span>團購</a>
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
                            訂單紀錄<br> Order Record
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
                    <li class="breadcrumb-item active">訂單紀錄</li>
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
										<table id="findAll" class="display">
											<thead>
												<tr>
													<th></th>
													<th>編號</th>
													<th>交易序號</th>
													<th>商品類別</th>
													<th>總金額</th>
													<th>點數折抵</th>
													<th>折扣後金額</th>
													<th>點數增減</th>
													<th>付款日期</th>
													<th>退款</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${allCarts}" var="allCarts">
												<tr>
													<td class="details-control"></td>
													<td>${allCarts.itemNo}</td>
													<td>${allCarts.transactionalNum}</td>
													<td>${allCarts.type}</td>
													<td>NT$ ${allCarts.amount}</td>
													
													<c:choose>
														<c:when test="${allCarts.discount == 0}">
															<td>-</td>
															<td>-</td>
														</c:when>
														<c:when test="${empty allCarts.discount}">
															<td>-</td>
															<td>-</td>
														</c:when>
														<c:otherwise>
															<td>${allCarts.discount}</td>
															<td>NT$ ${allCarts.disAmount}</td>
														</c:otherwise>
													</c:choose>
												
													<td>${allCarts.points}</td>
													<td>${allCarts.stringDate}</td>
													<c:choose>
														<c:when test="${empty allCarts.refund}">
															<td class="cancelBd"><button type="button" class="refund"><i class="fad fa-sack-dollar"></i></button></td>													
														</c:when>
														<c:otherwise>
															<td class="cancelBd">${allCarts.refund}</td>													
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>        
											</tbody>
										</table>         	
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
	<script src="<c:url value='/js/jquery.dataTables.min.js' />"></script>
	<script src="<c:url value='/js/sweetalert2@11.js' />"></script>
	<script src="<c:url value='/js/shopping/record.js' />"></script>
</body>

</html>