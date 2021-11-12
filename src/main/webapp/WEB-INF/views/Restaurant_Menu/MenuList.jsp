<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>餐點清單管理</title>
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
<style>
/* #proimg { */
/* 	width: 150px; */
/* 	height: 150px; */
/* 	/* position: absolute; */ */
/* 	/* float: left; */ */
/* } */

table {
	margin: auto;
	border: 3px dashed gray;
}

/* td, th { */
/* 	/* 兩個不同的標籤有相同的屬性 */ */
/* 	border: 2px solid gray; */
/* 	/* 框粗細 */ */
/* } */
</style>
</head>

<body itemscope>
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
							src="../assets/images/logo2.png" alt="logo.png" itemprop="image"></a>
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
					<h2 itemprop="headline">菜單列表 Menu List</h2>
				</div>
			</div>
		</div>
	</section>

	<div class="bread-crumbs-wrapper">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="./ManageMenu" title=" " itemprop="url">菜單管理</a></li>
				<li class="breadcrumb-item active">菜單列表</li>
			</ol>
		</div>
	</div>

	<form:form action="" method='GET' modelAttribute="menuBean"
		class='form-horizontal' enctype="multipart/form-data">
		<input type="hidden" id="fn" name="turn" value="">
		<input type="hidden" id="productName" name="productName" value="">
		<input type="hidden" id="dishImage" name="dishImage" value="">
		<input type="hidden" id="remark" name="remark" value="">
		<input type="hidden" id="price" name="price" value="">
	</form:form>

	<session>
	<div class="container">
		<div class="col-lg-12">
			<div class="card">
				<div class="block">
					<div class="col-md-12 col-sm-12 col-lg-12">
						<div class="sec-box">
							<table class="table">
								<thead>
									<tr>
										<th>菜名</th>
										<th>照片</th>
										<th>菜色描述</th>
										<th>單價</th>
										<th colspan="4">編輯</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="menu" items="${productName}">
										<tr>
											<td>${menu.productName}</td>
											<%-- 								<td>/getPicture/${menu.dishImage}</td> --%>			
											<td><img src="<c:url value='/getMenuPicture/${menu.productName}'/>"  width='120' height='90'>	</td>							
											<td>${menu.remark}</td>
											<td>${menu.price}</td>
											<td>
												<!-- 				<input type="submit" id="alt" name="alt" value="修改">  -->
												<a
												href="<c:url value='./updateMenu?productName=' />${menu.productName}">修改</a>
												<input type="submit" id="del" name="del" value="刪除">
											</td>
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
	</session>

	<!-- 	<script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
	<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>

	<script>
		$(function() {

			//刪除菜單
			$('tbody').on(
					'click',
					'#del',
					function() {
						let productName = $(this).parent().parent().children()
								.eq(0).text()
						$('#productName').val(productName)

						let remark = $(this).parent().parent().children().eq(1)
								.text()
						$('#remark').val(remark)

						let price = $(this).parent().parent().children().eq(2)
								.text()
						$('#price').val(price)

						$("#fn").val('fn1')
						document.forms[0].action = "./deleteMenu"
						document.forms[0].submit()

					})

			//修改菜單
			$('tbody').on(
					'click',
					'#alt',
					function() {
						let productName = $(this).parent().parent().children()
								.eq(0).text()
						$('#productName').val(productName)

						let remark = $(this).parent().parent().children().eq(1)
								.text()
						$('#remark').val(remark)

						let price = $(this).parent().parent().children().eq(2)
								.text()
						$('#price').val(price)

						$("#fn").val('fn')
						document.forms[0].action = "/updateMenu?productName="
						document.forms[0].submit()
					})

		})
	</script>
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
												itemprop="url">hello@yourdomain.com</a></li>
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