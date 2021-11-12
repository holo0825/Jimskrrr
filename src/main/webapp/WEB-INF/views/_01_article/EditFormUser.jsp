<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>討論區</title>
<link rel="shortcut icon" href="../../assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../../assets/css/icons.min.css">
<link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/css/animate.min.css">
<link rel="stylesheet" href="../../assets/css/main.css">
<link rel="stylesheet" href="../../assets/css/red-color.css">
<link rel="stylesheet" href="../../assets/css/yellow-color.css">
<link rel="stylesheet" href="../../assets/css/responsive.css">

<script type="text/javascript">
	function confirmDelete(id) {
		var result = confirm("確定刪除此筆記錄(帳號:" + id.trim() + ")?");
		if (result) {
			document.forms[1].putOrDelete.name = "_method";
			document.forms[1].putOrDelete.value = "DELETE";
			document.forms[1].action = "<c:url value='/_01_article/articlesUser/" + id + "' />";
			return true;
		}
		return false;
	}
	function confirmUpdate(id) {
		document.forms[1].putOrDelete.name = "_method";
		document.forms[1].putOrDelete.value = "PUT";
		document.forms[1].action = "<c:url value='/_01_article/articlesUser/" + id + "' />";
		return true;
	}
</script>
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
						<a href="#" title="Facebook" itemprop="url" target="_blank"><i
							class="fa fa-facebook-square"></i></a>
					</div>
				</div>
			</div>
			<!-- Topbar -->
			<div class="logo-menu-sec">
				<div class="container" style="margin-left: 350px;">

					<nav>
						<div class="menu-sec">
							<ul>
								<li class="menu-item-has-children"><a href="../../home"
									title="HOMEPAGES" itemprop="url"><span class="red-clr"></span>首頁</a>
									<ul class="sub-dropdown">
										<li><a href="index.html" title="HOMEPAGE 1"
											itemprop="url">HOMEPAGE 1</a></li>
										<li><a href="index2.html" title="HOMEPAGE 2"
											itemprop="url">HOMEPAGE 2</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#"
									title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
								</li>
								<li class="menu-item-has-children"><a href="#"
									title="PAGES" itemprop="url"><span class="red-clr"></span>團購</a>
								</li>
								<li class="menu-item-has-children"><a href="#"
									title="PAGES" itemprop="url"><span class="red-clr"></span>活動</a>
								</li>
								<li class="menu-item-has-children"><a
									href="../ShowArticlesUser" title="PAGES" itemprop="url"><span
										class="red-clr"></span>討論區</a></li>
								<li class="menu-item-has-children"><a href="#"
									title="PAGES" itemprop="url"><span class="red-clr"></span>購物車</a>
									<ul class="sub-dropdown">
										<li><a href="index.html" title="HOMEPAGE 1"
											itemprop="url">訂餐</a></li>
										<li><a href="index2.html" title="HOMEPAGE 2"
											itemprop="url">團購</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#"
									title="PAGES" itemprop="url"><span class="red-clr"></span>會員中心</a>
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
				<div style="background-image: url(../../assets/images/topbg.jpg);"
					class="fixed-bg"></div>
				<div class="restaurant-searching text-center">
					<div class="restaurant-searching-inner">
						<h2 itemprop="headline">
							討論區<br> Enjoy Food Together
						</h2>
					</div>
				</div>
				<!-- Restaurant Searching -->
			</div>
		</section>
		<div class="bread-crumbs-wrapper">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="../../home" title=""
						itemprop="url">首頁</a></li>
					<li class="breadcrumb-item"><a href="../ShowArticlesUser" title=""
						itemprop="url">討論區</a></li>
						<li class="breadcrumb-item active">編輯貼文
				</ol>
			</div>
		</div>
		<div id="main-wrapper">
		<div class="dropdown-menu p-0 m-0">
			<form>
				<input class="form-control" type="search" placeholder="Search"
					aria-label="Search">
			</form>
		</div>


		<div class="content-body">
			<div class="container-fluid">
				<!-- row -->
				<div align="center">
					<form:form method='POST' modelAttribute="articleBean"
						enctype="multipart/form-data">

						<input type="hidden" id='putOrDelete' value="">
						<c:if test='${articleBean.id != null}'>
							<form:hidden path="id" />
							<br>&nbsp;
			</c:if>
						<fieldset class="fieldset-auto-width">
							<legend>編輯文章</legend>
							<table>
								<tr>
									<td align='right'>標題：<br>&nbsp;
									</td>
									<td width='400'><form:input path="title" size="25"
											class="form-control" id="exampleFormControlInput1" /><br>&nbsp;
										<form:errors path="title" cssClass="error" /></td>
								</tr>
								<tr>
									<td align='right'>username：<br>&nbsp;
									</td>
									<td><form:input path="username" size="25"
											class="form-control" id="exampleFormControlInput1" /><br>&nbsp;
										<form:errors path="username" cssClass="error" /></td>
								</tr>

								<tr>
									<td align='right'>內容：<br>&nbsp;
									</td>
									<td><form:textarea path="content" size="30"
											class="form-control" id="exampleFormControlTextarea1"
											rows="3" /><br>&nbsp; <form:errors path="content"
											cssClass="error" /></td>
								</tr>
								<tr>
									<td align='right'>分類:<br>&nbsp;
									</td>
									<td><input type="radio" name="category" id="category1"
										value="中式" checked>中式 <input type="radio"
										name="category" id="category2" value="義式">義式 <input
										type="radio" name="category" id="category3" value="火鍋">火鍋
										<input type="radio" name="category" id="category4" value="牛排">牛排
										<input type="radio" name="category" id="category6" value="速食">速食<br>
										<input type="radio" name="category" id="category5"
										value="飲料冰品">飲料冰品 <input type="radio" name="category"
										id="category7" value="其他">其他</td>
								</tr>
								<tr>

									<td align='right'>圖片:<br>&nbsp;
									<td>
										<div class="form-group">
											<label class='control-label col-lg-2 col-lg-2'
												for="productImage"> </label>
											<div class='col-lg-10'>
												<form:input id="productImage" path="productImage"
													type='file' class='form:input-large' />
											</div>

										</div>
									</td>

								</tr>

								<tr>
									<td colspan='2' align='center'><input type='submit'
										value='修改' name='updateBtn'
										onclick="return confirmUpdate('${articleBean.id}');">&nbsp;
										<input type='submit' value='刪除' name='deleteBtn'
										onclick="return confirmDelete('${articleBean.id}');"></td>
								</tr>

							</table>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
			</section>
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
														src="../../assets/images/logo.png" alt="logo.png"
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
		<script src="../../assets/js/jquery.min.js"></script>
		<script src="../../assets/js/bootstrap.min.js"></script>
		<script src="../../assets/js/plugins.js"></script>
		<script src="../../assets/js/main.js"></script>
		
	</main>
</body>
</html>