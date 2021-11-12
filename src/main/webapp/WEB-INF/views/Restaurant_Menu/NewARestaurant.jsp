<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New A Restaurant</title>
<link rel="shortcut icon" href="../assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../assets/css/icons.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/main.css">
<link rel="stylesheet" href="../assets/css/red-color.css">
<link rel="stylesheet" href="../assets/css/yellow-color.css">
<link rel="stylesheet" href="../assets/css/responsive.css">
<link rel="stylesheet" href="../css/yu.css">
</head>

<!-- 前端畫面for賣家創建餐廳 -->

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
									<li><a href="<c:url value='/ManageRestaurant' />">餐廳管理</a></li>
									<li><a href="<c:url value='/ManageMenu' />">菜單管理</a></li>
								</ul></li>
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
	<section>
		<div class="block">
			<div style="background-image: url(../assets/images/topbg.jpg);"
				class="fixed-bg"></div>
			<div class="restaurant-searching text-center">
				<div class="restaurant-searching-inner">
					<h2 itemprop="headline">建立餐廳 <br>New Your Restaurant</h2>
				</div>

			</div>
		</div>
	</section>
	 <div class="bread-crumbs-wrapper">
            <div class="container">
                <ol class="breadcrumb">
                   <li class="breadcrumb-item"><a href="./ManageRestaurant" title="" itemprop="url">餐廳管理</a></li>
                    <li class="breadcrumb-item active">建立餐廳</li>
                </ol>
            </div>
        </div>
    <form:form action="./OpenSuccess" method='POST' modelAttribute="restaurantBean" class='form-horizontal'
			enctype="multipart/form-data" >
        <br>
 
        <fieldset>
            <legend>基本資料<em>(必填)</em></legend>

            <!-- restaurant縮寫rst -->     
            
            <div class="st1">
                <label>經營者姓名：</label>
                <form:input type="text" path="userName" value="" size="10" /> 
                <span id="usernamesp"></span><br>           
           		<form:errors path="userName" cssClass="error" />
            </div>

            <div class="st1">
                <label>經營者電話：</label>
                <form:input type="text" path="mobile" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="12" /> 
                <span id="mobsp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="Mobile" cssClass="error" />
            </div>

            <div class="st1">
                <label>餐廳名稱：</label>
                <form:input type="text" path="rstName" id="rstName" value="" size="10" /> 
                <span id="rstnamesp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="RstName" cssClass="error" />
            </div>
 
            <div class="st1">
                <label>證照號碼：</label>
                <form:input type="text" path="license" id="license" value="" size="20" /> 
                <span class="ps">(必填)</span>
                <form:errors path="License" cssClass="error" />
            </div> 

            <div class="st1">
                <label for="rstAddress">餐廳地址：</label>
                <form:input type="text" path="rstAddress" id="rstAddress" value="" size="50" /> 
                <span id="rstaddsp"></span><br>
                <form:errors path="RstAddress" cssClass="error" />
            </div>

            <div class="st1">
                <label>餐廳電話：</label>
                <form:input type="text" path="rstTel" id="rstTel" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="12" /> 
                <span id="rsttelsp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="RstTel" cssClass="error" />

            </div>

            <div class="st1">
                <label>餐廳類型：</label>
                <form:input type="text" path="category" id="category" value="" size="20" /> 
                <span class="ps">(日式、中式、義式、韓式、台式、美式...etc.)</span>
            </div>

            <div class="st1">
                <label>營業時間<span class="ps">(請以24小時制填寫)：</span></label>
                <form:input type="text" path="businessHour" id="businessHour" value="" size="20" />                               
            </div>

			<div class="st1">
				<label>餐廳形象照： </label>
				<form:input type="file" accept="image/*" path="rstImage" value="" id="rstImage" /> 
			</div>

		</fieldset>
        
        <div class="sub">
        	<input type="submit" name="submit" style="width:200px;height:30px; font-size: medium;" value="完成">    
            <input type="reset" style="width:200px;height:30px; font-size: medium;" value="清除">
        </div>
    	</form:form>
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
													src="../assets/images/logo.png" alt="logo.png"
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
												itemprop="url">eattogerther@food.com</a></li>
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
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>