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
<style>
#proimg {
	width: 150px;
	height: 150px;
	/* position: absolute; */
	/* float: left; */
}

table {
	margin: auto;
	border: 3px solid gray;
}

td, th {
	/* 兩個不同的標籤有相同的屬性 */
	border: 2px solid gray;
	/* 框粗細 */
}
</style>
</head>


<body itemscope>
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
	<section>
		<div class="block">
			<div style="background-image: url(assets/images/topbg.jpg);"
				class="fixed-bg"></div>
			<div class="restaurant-searching text-center">
				<div class="restaurant-searching-inner">
					<h2 itemprop="headline">餐點管理 Manage Menu</h2>
				</div>		
			</div>
		</div>
	</section>
	
	
				<form:form action="" method='GET' modelAttribute="menuBean"
					class='form-horizontal' enctype="multipart/form-data">
					<input type="hidden" id="fn" name="turn" value="">
					<input type="hidden" id="productName" name="productName" value="">
					<input type="hidden" id="dishImage" name="dishImage" value=""> 
					<input type="hidden" id="remark" name="remark" value="">
					<input type="hidden" id="price" name="price" value="">
				</form:form>
			
	<session>
	<div class="block">
		<div class="col-md-12 col-sm-12 col-lg-12">
			<div class="sec-box">
	<table>
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
			<c:forEach var="menu" items="${menuBeanList}">
				<tr>
					<td>${menu.productName}</td>
					<td>/getPicture/${menu.dishImage}</td>
					<td>${menu.remark}</td>
					<td>${menu.price}</td>
					<td>
						<!-- 				<input type="submit" id="alt" name="alt" value="修改">  -->
						<a href="<c:url value='./updateMenu?productName=' />${menu.productName}">修改</a>
						<input type="submit" id="del" name="del" value="刪除">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
						document.forms[0].action = "./updateMenu?productName="
						document.forms[0].submit()
					})

		})
	</script>



</body>


</html>