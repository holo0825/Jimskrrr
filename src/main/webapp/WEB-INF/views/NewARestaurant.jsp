<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>New A Restaurant</title>
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

<body>
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
					<h2 itemprop="headline">建立餐廳 <br>New Your Restaurant</h2>
				</div>

			</div>
		</div>
	</section>

    <form:form action="./OpenSuccess" method='POST' modelAttribute="restaurantBean" class='form-horizontal'
			enctype="multipart/form-data" >
        <br>
 
        <fieldset>
            <legend>基本資料<em>(必填)</em></legend>

            <!-- restaurant縮寫rst -->
            <div class="st1">
                <label for="userName">經營者姓名：</label>
                <input type="text" id="userName" value="" size="10" name="userName" required>
                <span id="usernamesp"></span><br>
                <span class="ps">(1.必填 2.至少兩個字 3.必為中文)</span>
           		<form:errors path="userName" cssClass="error" />
            </div>

            <div class="st1">
                <label for="">經營者電話：</label>
                <input type="text" id="mobile" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=12 name="mobile" required></input>
                <span id="mobsp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="Mobile" cssClass="error" />
            </div>

            <div class="st1">
                <label for="rstname">餐廳名稱：</label>
                <input type="text" id="rstname" value="" size="10" name="rstname" required>
                <span id="rstnamesp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="RstName" cssClass="error" />
            </div>
 
            <div class="st1">
                <label for="license">證照號碼：</label>
                <input type="text" id="license" value="" size="20" name="license" required>
                <span id="licensesp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="License" cssClass="error" />
            </div> 

            <div class="st1">
                <label for="rstaddress">餐廳地址：</label>
                <input type="text" id="rstaddress" value="" size="50" name="rstaddress" required>
                <span id="rstaddsp"></span><br>
                <span class="ps">(1.必填 2.必為中文 3.至少8個字)</span>
                <form:errors path="RstAddress" cssClass="error" />
            </div>

            <div class="st1">
                <label for="">餐廳電話：</label>
                <input type="text" id="telephone" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=12 name="rsttel" required></input>
                <span id="rsttelsp"></span>
                <span class="ps">(必填)</span>
                <form:errors path="Rsttel" cssClass="error" />

            </div>

            <div class="st1">
                <label for="">餐廳類型：</label>
                <input type="text" id="category" value="" size=20 name="category">
                <span class="ps">(日式、中式、義式、韓式、台式、美式...etc.)</span>
            </div>

            <div class="st1">
                <label for="">營業時間<span class="ps">(請以24小時制填寫)：</span></label>
                <input type="text" id="businesshour" value="" size="20" name="businesshour">
                
                
            </div>



        </fieldset>
        
        <div class="sub">
        	<input type="submit" name="submit" style="width:200px;height:30px; font-size: medium;" value="完成">    

            <input type="reset" style="width:200px;height:30px; font-size: medium;" value="清除">

        </div>
    	</form:form>

</body>
</html>