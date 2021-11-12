<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>聚點時刻 - 一般用戶註冊</title>
<!--     <link rel="shortcut icon" href="../../assets/images/favicon.png" type="image/x-icon"> -->
    <link rel="shortcut icon" href="<c:url value='/assets/images/favicon.png'/>" type="image/x-icon">
<!--     <link rel="stylesheet" href="../../assets/css/icons.min.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/css/icons.min.css'/>">
<!--     <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css'/>">
<!--     <link rel="stylesheet" href="../../assets/css/main.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/css/main.css'/>">
<!--     <link rel="stylesheet" href="../../assets/css/red-color.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/css/red-color.css'/>">
<!--     <link rel="stylesheet" href="../../assets/css/yellow-color.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/css/yellow-color.css'/>">
<!--     <link rel="stylesheet" href="../../assets/css/responsive.css"> -->
    <link rel="stylesheet" href="<c:url value='/assets/css/responsive.css'/>">
    <style>
        /* 套用此id的input標籤的margin-bottom設定為0 */
        #mb-0 {
            margin-bottom: 0;
        }
        /* 套用此id的input標籤的margin-bottom設定為5 */
        #mb-5 {
            margin-bottom: 5px;
        }
        /* 套用此id的元素的padding-bottom設定為5 */
        #pb-5 {
            padding-bottom: 5px;
        }
        /* 套用此id的元素的margin-left設定為28 */
        #ml-28 {
            margin-left: 28px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        // 偵測圖片上傳的事件，並且顯示圖片在網頁上
        var loadFile = function(event) {
            var image = document.getElementById('output');
            image.src = URL.createObjectURL(event.target.files[0]);
        };
     // Ajax非同步及時查詢username是否已經存在
        $(document).ready(function() {
		
			$("#username").on("input change blur", function(e) {
				$('#msg').hide();
				if ($('#username').val() == null || $('#username').val() == "") {
					$('#msg').show();
					$("#msg").html("帳號為必填欄位").css("color", "red");
				} else {
					$.ajax({
						type: 'post',
						url: "/ajaxCheckUsername",
						data: JSON.stringify({username: $('#username').val()}),
						contentType: 'application/json; charset=utf-8',
						//dataType: 'html',
						cache: false,
						aync: true,
						beforeSend: function (f) {
							
							
							$('#msg').show();
							$('#msg').html('檢查中...');
						},
						statusCode: {
						    500: function(xhr) {
						    	$('#msg').show();
						    	$("#msg").html("帳號名稱尚未註冊").css("color", "green");
						    }
						},
						success: function(msg) {
							$('#msg').show();
							if(msg !== null || msg !== "") {
								$("#msg").html("帳號名稱重複，請改用其他名稱").css("color", "red");
							} else {
								$("#msg").html("帳號名稱尚未註冊").css("color", "green");
							}
						},
						error: function(jqXHR, textStatus, errorThrown) {
							$('#msg').show();
							$("#msg").html(textStatus + " " + errorThrown).css("color", "red");
						}
					});
				}
			});
		});
     
     	// 一鍵輸入註冊資料
        function quickInput(){
			document.getElementById('username').value = 'JayChou'
			document.getElementById('password').value = 'Helloworld123';
// 			document.getElementById('password1').value = 'Helloworld123';
			document.getElementById('email').value = 'JayChou@food.com';
			document.getElementById('fullname').value = 'JayChou';
			document.getElementById('dob').value = '2000-01-01';
			document.getElementById("male").setAttribute("checked", "checked");
// 			document.getElementById("female").setAttribute("checked", "checked");
// 			document.getElementById("male").checked = true;
// 			document.getElementById("female").checked = true;
			document.getElementById('phoneNumber').value = '0988888888';
			document.getElementById('homeNumber').value = '0288888888';
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
        <header class="stick" style="text-align: center; ">
            <!-- <div class="topbar">
                <div class="container">
                    <div class="select-wrp">
                        <select data-placeholder="Feel Like Eating">
                            <option>FEEL LIKE EATING</option>
                            <option>Burger</option>
                            <option>Pizza</option>
                            <option>Fried Rice</option>
                            <option>Chicken Shots</option>
                        </select>
                    </div>
                    <div class="select-wrp">
                        <select data-placeholder="Choose Location">
                        <option>CHOOSE LOCATION</option>
                            <option>New york</option>
                            <option>Washington</option>
                            <option>Chicago</option>
                            <option>Los Angeles</option>
                        </select>
                    </div>
                    <div class="topbar-register">
                        <a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>/ <a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
                    </div>
                    <div class="social1">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                        <a href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div> -->
            <!-- Topbar -->
            <div class="logo-menu-sec">
                <div class="container" style="padding-left: 200px">
                <!-- <div class="container" style="margin-left: 930px;"> -->
                    <!-- <div class="logo "> -->
                    <!-- <h1 itemprop="headline "> -->
                    <!-- <a href="index.html " title="Home " itemprop="url "><img src="assets/images/logo2.png " alt="logo.png " itemprop="image "></a> -->
                    <!-- </h1> -->
                    <!-- </div> -->
                    <nav>
                        <div class="menu-sec ">
                            <ul>
                                <li class="menu-item-has-children ">
                                    <a href="# " title="HOMEPAGES " itemprop="url ">
                                        <!-- <span class="red-clr ">FOOD ORDERING</span> -->
                                        首頁</a>
                                    <ul class="sub-dropdown ">
                                        <li><a href="index.html " title="HOMEPAGE 1 " itemprop="url ">HOMEPAGE 1</a></li>
                                        <li><a href="index2.html " title="HOMEPAGE 2 " itemprop="url ">HOMEPAGE 2</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children ">
                                    <a href="# " title="RESTAURANTS " itemprop="url ">
                                        <!-- <span class="red-clr ">REAL FOOD</span> -->
                                        餐廳</a>
                                    <ul class="sub-dropdown ">
                                        <li><a href="restaurant-found.html " title="RESTAURANT 1 " itemprop="url ">RESTAURANT 1</a></li>
                                        <li><a href="restaurant-found2.html " title="RESTAURANT 2 " itemprop="url ">RESTAURANT 2</a></li>
                                        <li><a href="restaurant-detail.html " title="RESTAURANT DETAILS " itemprop="url ">RESTAURANT DETAILS</a></li>
                                        <li><a href="food-recipes.html " title="RESTAURANT DETAILS " itemprop="url ">FOOD
                                                RECIPES</a></li>
                                        <li><a href="our-articles.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                                ARTICLES</a></li>
                                        <li><a href="our-menu.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                                MENU</a></li>
                                        <li><a href="our-services.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                                SERVICES</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children ">
                                    <a href="# " title="PAGES " itemprop="url ">
                                        <!-- <span class="red-clr ">REAL FOOD</span> -->
                                        團購</a>
                                    <ul class="sub-dropdown ">
                                        <li class="menu-item-has-children "><a href="# " title="BLOG " itemprop="url ">BLOG</a>
                                            <ul class="sub-dropdown ">
                                                <li class="menu-item-has-children "><a href="# " title="BLOG LAYOUTS " itemprop="url ">BLOG LAYOUTS</a>
                                                    <ul class="sub-dropdown ">
                                                        <li><a href="blog-right-sidebar.html " title="BLOG WITH RIGHT SIDEBAR " itemprop="url ">BLOG
                                                                (W.R.S)</a></li>
                                                        <li><a href="blog-left-sidebar.html " title="BLOG WITH LEFT SIDEBAR " itemprop="url ">BLOG
                                                                (W.L.S)</a></li>
                                                        <li><a href="blog.html " title="BLOG WITH NO SIDEBAR " itemprop="url ">BLOG</a></li>
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children "><a href="# " title="BLOG DETAIL " itemprop="url ">BLOG DETAIL</a>
                                                    <ul class="sub-dropdown ">
                                                        <li><a href="blog-detail-right-sidebar.html " title="BLOG DETAIL WITH RIGHT SIDEBAR " itemprop="url ">BLOG DETAIL (W.R.S)</a></li>
                                                        <li><a href="blog-detail-left-sidebar.html " title="BLOG DETAIL WITH LEFT SIDEBAR " itemprop="url ">BLOG DETAIL (W.L.S)</a></li>
                                                        <li><a href="blog-detail.html " title="BLOG DETAIL WITH NO SIDEBAR " itemprop="url ">BLOG
                                                                DETAIL</a></li>
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children "><a href="# " title="BLOG FORMATES " itemprop="url ">BLOG FORMATES</a>
                                                    <ul class="sub-dropdown ">
                                                        <li><a href="blog-detail-video.html " title="BLOG DETAIL WITH VIDEO " itemprop="url ">BLOG
                                                                DETAIL (VIDEO)</a></li>
                                                        <li><a href="blog-detail-audio.html " title="BLOG DETAIL WITH AUDIO " itemprop="url ">BLOG
                                                                DETAIL (AUDIO)</a></li>
                                                        <li><a href="blog-detail-carousel.html " title="BLOG DETAIL WITH CAROUSEL " itemprop="url ">BLOG
                                                                DETAIL (CAROUSEL)</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children "><a href="# " title="SPECIAL PAGES " itemprop="url ">SPECIAL PAGES</a>
                                            <ul class="sub-dropdown ">
                                                <li><a href="404.html " title="404 ERROR " itemprop="url ">404 ERROR</a>
                                                </li>
                                                <li><a href="search-found.html " title="SEARCH FOUND " itemprop="url ">SEARCH FOUND</a></li>
                                                <li><a href="search-not-found.html " title="SEARCH NOT FOUND " itemprop="url ">SEARCH NOT FOUND</a></li>
                                                <li><a href="coming-soon.html " title="COMING SOON " itemprop="url ">COMING
                                                        SOON</a></li>
                                                <li><a href="login-register.html " title="LOGIN & REGISTER " itemprop="url ">LOGIN & REGISTER</a></li>
                                                <li><a href="price-table.html " title="PRICE TABLE " itemprop="url ">PRICE
                                                        TABLE</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children "><a href="# " title="GALLERY " itemprop="url ">GALLERY</a>
                                            <ul class="sub-dropdown ">
                                                <li><a href="gallery.html " title="FOOD GALLERY " itemprop="url ">FOOD
                                                        GALLERY</a></li>
                                                <li><a href="gallery-detail.html " title="GALLERY DETAIL " itemprop="url ">GALLERY DETAIL</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="register-reservation.html " title="REGISTER RESERVATION " itemprop="url ">REGISTER RESERVATION</a></li>
                                        <li><a href="how-it-works.html " title="HOW IT WORKS " itemprop="url ">HOW IT
                                                WORKS</a></li>
                                        <li><a href="dashboard.html " title="USER PROFILE " itemprop="url ">USER
                                                PROFILE</a></li>
                                        <li><a href="about-us.html " title="ABOUT US " itemprop="url ">ABOUT US</a></li>
                                        <li><a href="food-detail.html " title="FOOD DETAIL " itemprop="url ">FOOD
                                                DETAIL</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="contact.html " title="活動" itemprop="url ">
                                        <!-- <span class="red-clr ">REAL FOOD</span> -->
                                        活動</a>
                                </li>
                                <li>
                                    <a href="contact.html " title="討論區 " itemprop="url ">
                                        <!-- <span class="red-clr ">REAL FOOD</span> -->
                                        討論區</a>
                                </li>
                                <li>
                                    <a href="contact.html " title="購物車" itemprop="url ">
                                        <!-- <span class="red-clr ">REAL FOOD</span> -->
                                        購物車</a>
                                </li>
                                <li>
                                    <a href="contact.html " title="會員中心" itemprop="url ">
                                        <!-- <span class="red-clr ">REAL FOOD</span> -->
                                        會員中心</a>
                                </li>
                                <!-- <li><a href="contact.html " title="CONTACT US " itemprop="url "><span class="red-clr ">REAL
                                            FOOD</span>CONTACT US</a></li> -->
                                <!-- </ul><a class="red-bg brd-rd4 " href="register-reservation.html " title="Register " itemprop="url ">註冊餐廳商家</a> -->
                        </div>
                    </nav>
                    <!-- Navigation -->
                </div>
            </div>
            <!-- Logo Menu Section -->
        </header>
        <!-- Header -->
        <div class="responsive-header ">
            <div class="responsive-topbar ">
                <div class="select-wrp "><select data-placeholder="Feel Like Eating ">
                        <option>FEEL LIKE EATING</option>
                        <option>Burger</option>
                        <option>Pizza</option>
                        <option>Fried Rice</option>
                        <option>Chicken Shots</option>
                    </select></div>
                <div class="select-wrp "><select data-placeholder="Choose Location ">
                        <option>CHOOSE LOCATION</option>
                        <option>New york</option>
                        <option>Washington</option>
                        <option>Chicago</option>
                        <option>Los Angeles</option>
                    </select></div>
            </div>
            <div class="responsive-logomenu ">
                <div class="logo ">
                    <h1 itemprop="headline ">
                        <a href="index.html " title="Home " itemprop="url "><img src="assets/images/logo.png " alt="logo.png " itemprop="image "></a>
                    </h1>
                </div><span class="menu-btn yellow-bg brd-rd4 "><i class="fa fa-align-justify "></i></span>
            </div>
            <div class="responsive-menu "><span class="menu-close red-bg brd-rd3 "><i class="fa fa-close "></i></span>
                <div class="menu-lst ">
                    <ul>
                        <li class="menu-item-has-children "><a href="# " title="HOMEPAGES " itemprop="url "><span
                                    class="yellow-clr ">FOOD ORDERING</span>HOMEPAGES</a>
                            <ul class="sub-dropdown ">
                                <li><a href="index.html " title="HOMEPAGE 1 " itemprop="url ">HOMEPAGE 1</a></li>
                                <li><a href="index2.html " title="HOMEPAGE 2 " itemprop="url ">HOMEPAGE 2</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children "><a href="# " title="RESTAURANTS " itemprop="url "><span
                                    class="yellow-clr ">REAL FOOD</span>RESTAURANTS</a>
                            <ul class="sub-dropdown ">
                                <li><a href="restaurant-found.html " title="RESTAURANT 1 " itemprop="url ">RESTAURANT 1</a>
                                </li>
                                <li><a href="restaurant-found2.html " title="RESTAURANT 2 " itemprop="url ">RESTAURANT
                                        2</a></li>
                                <li><a href="restaurant-detail.html " title="RESTAURANT DETAILS " itemprop="url ">RESTAURANT DETAILS</a></li>
                                <li><a href="restaurant-detail.html " title="RESTAURANT DETAILS " itemprop="url ">RESTAURANT DETAILS</a></li>
                                <li><a href="food-recipes.html " title="RESTAURANT DETAILS " itemprop="url ">FOOD
                                        RECIPES</a></li>
                                <li><a href="our-articles.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                        ARTICLES</a></li>
                                <li><a href="our-menu.html " title="RESTAURANT DETAILS " itemprop="url ">OUR MENU</a></li>
                                <li><a href="our-services.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                        SERVICES</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children "><a href="# " title="PAGES " itemprop="url "><span
                                    class="yellow-clr ">REAL FOOD</span>PAGES</a>
                            <ul class="sub-dropdown ">
                                <li class="menu-item-has-children "><a href="# " title="BLOG " itemprop="url ">BLOG</a>
                                    <ul class="sub-dropdown ">
                                        <li class="menu-item-has-children "><a href="# " title="BLOG LAYOUTS " itemprop="url ">BLOG LAYOUTS</a>
                                            <ul class="sub-dropdown ">
                                                <li><a href="blog-right-sidebar.html " title="BLOG WITH RIGHT SIDEBAR " itemprop="url ">BLOG (W.R.S)</a></li>
                                                <li><a href="blog-left-sidebar.html " title="BLOG WITH LEFT SIDEBAR " itemprop="url ">BLOG (W.L.S)</a></li>
                                                <li><a href="blog.html " title="BLOG WITH NO SIDEBAR " itemprop="url ">BLOG</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children "><a href="# " title="BLOG DETAIL " itemprop="url ">BLOG DETAIL</a>
                                            <ul class="sub-dropdown ">
                                                <li><a href="blog-detail-right-sidebar.html " title="BLOG DETAIL WITH RIGHT SIDEBAR " itemprop="url ">BLOG
                                                        DETAIL (W.R.S)</a></li>
                                                <li><a href="blog-detail-left-sidebar.html " title="BLOG DETAIL WITH LEFT SIDEBAR " itemprop="url ">BLOG DETAIL
                                                        (W.L.S)</a></li>
                                                <li><a href="blog-detail.html " title="BLOG DETAIL WITH NO SIDEBAR " itemprop="url ">BLOG DETAIL</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children "><a href="# " title="BLOG FORMATES " itemprop="url ">BLOG FORMATES</a>
                                            <ul class="sub-dropdown ">
                                                <li><a href="blog-detail-video.html " title="BLOG DETAIL WITH VIDEO " itemprop="url ">BLOG DETAIL (VIDEO)</a></li>
                                                <li><a href="blog-detail-audio.html " title="BLOG DETAIL WITH AUDIO " itemprop="url ">BLOG DETAIL (AUDIO)</a></li>
                                                <li><a href="blog-detail-carousel.html " title="BLOG DETAIL WITH CAROUSEL " itemprop="url ">BLOG DETAIL
                                                        (CAROUSEL)</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children "><a href="# " title="SPECIAL PAGES " itemprop="url ">SPECIAL PAGES</a>
                                    <ul class="sub-dropdown ">
                                        <li><a href="404.html " title="404 ERROR " itemprop="url ">404 ERROR</a></li>
                                        <li><a href="search-found.html " title="SEARCH FOUND " itemprop="url ">SEARCH
                                                FOUND</a></li>
                                        <li><a href="search-not-found.html " title="SEARCH NOT FOUND " itemprop="url ">SEARCH NOT FOUND</a></li>
                                        <li><a href="coming-soon.html " title="COMING SOON " itemprop="url ">COMING
                                                SOON</a></li>
                                        <li><a href="login-register.html " title="LOGIN & REGISTER " itemprop="url ">LOGIN
                                                & REGISTER</a></li>
                                        <li><a href="price-table.html " title="PRICE TABLE " itemprop="url ">PRICE
                                                TABLE</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children "><a href="# " title="GALLERY " itemprop="url ">GALLERY</a>
                                    <ul class="sub-dropdown ">
                                        <li><a href="gallery.html " title="FOOD GALLERY " itemprop="url ">FOOD GALLERY</a>
                                        </li>
                                        <li><a href="gallery-detail.html " title="GALLERY DETAIL " itemprop="url ">GALLERY
                                                DETAIL</a></li>
                                    </ul>
                                </li>
                                <li><a href="register-reservation.html " title="REGISTER RESERVATION " itemprop="url ">REGISTER RESERVATION</a></li>
                                <li><a href="how-it-works.html " title="HOW IT WORKS " itemprop="url ">HOW IT WORKS</a>
                                </li>
                                <li><a href="dashboard.html " title="USER PROFILE " itemprop="url ">USER PROFILE</a></li>
                                <li><a href="about-us.html " title="ABOUT US " itemprop="url ">ABOUT US</a></li>
                                <li><a href="food-detail.html " title="FOOD DETAIL " itemprop="url ">FOOD DETAIL</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html " title="CONTACT US " itemprop="url "><span class="yellow-clr ">REAL
                                    FOOD</span>CONTACT US</a></li>
                    </ul>
                </div>
                <div class="topbar-register "><a class="log-popup-btn " href="# " title="Login " itemprop="url ">LOGIN</a>/
                    <a class="sign-popup-btn " href="# " title="Register " itemprop="url ">REGISTER</a></div>
                <div class="social1 "><a href="# " title="Facebook " itemprop="url " target="_blank "><i
                            class="fa fa-facebook-square "></i></a><a href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i></a><a href="# " title="Google Plus " itemprop="url " target="_blank "><i class="fa fa-google-plus "></i></a></div>
                <div class="register-btn "><a class="yellow-bg brd-rd4 " href="register-reservation.html " title="Register " itemprop="url ">REGISTER RESTAURANT</a></div>
            </div>
            <!-- Responsive Menu -->
        </div>
        <!-- Responsive Header -->
        <section>
            <div class="block ">
<!--                 <div class="fixed-bg " style="background-image: url(assets/images/topbg.jpg); "></div> -->
                <div class="fixed-bg " style="background-image: url(<c:url value='/assets/images/topbg.jpg'/>); "></div>
                <div class="page-title-wrapper text-center ">
                    <div class="col-md-12 col-sm-12 col-lg-12 ">
                        <div class="page-title-inner ">
                            <h1 itemprop="headline ">登入及註冊</h1>
                            <!-- <span style="font-size: 50px;">Enjoy Food Together</span> -->
                            <span style="font-size: 50px;">一般用戶註冊</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="bread-crumbs-wrapper ">
            <div class="container ">
                <ol class="breadcrumb ">
                    <li class="breadcrumb-item "><a href="<c:url value='/'/>" title=" " itemprop="url ">首頁</a></li>
                    <li class="breadcrumb-item active ">登入及註冊</li>
                </ol>
            </div>
        </div>
        <section>
            <!-- <div class="block top-padd30" style="margin-left: 300px;"> -->
            <div class="block top-padd30">
                <div class="container">
                    <div class="row ">
                        <div class="col-md-12 col-sm-12 col-lg-12 ">
                            <div class="login-register-wrapper ">
                                <div class="row ">

                                    <div class="col-md-6 col-sm-12 col-lg-6 ">
                                        <div class="sign-popup-wrapper brd-rd5 ">
                                            <div class="sign-popup-inner brd-rd5 " style="padding-bottom: 39.15px;">
                                                <div class="sign-popup-title text-center ">
                                                    <h4 itemprop="headline " style="font-weight: bolder;">一般用戶註冊</h4><span>使用第三方註冊</span>
                                                </div>
                                                <div class="popup-social text-center ">
                                                    <a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank ">
                                                        <i class="fa fa-facebook "></i>Facebook
                                                    </a>
                                                    <a class="google brd-rd3 " href="/oauth2/authorization/google" title="Google Plus " itemprop="url " target="_blank ">
                                                        <i class="fa fa-google-plus "></i>Google
                                                    </a>
                                                    <a class="github brd-rd3 " href="# " title="GitHub " itemprop="url " target="_blank ">
                                                        <i class="fa fa-github "></i>GitHub
                                                    </a>
                                                </div>
                                                <span class="popup-seprator text-center ">
                                                    <i class="brd-rd50 ">或者</i>
                                                </span>
                                                <!--form標籤開始-->
                                                <form:form class="sign-form " action="./process_user" method="POST" modelAttribute="userRegisterBean" enctype='multipart/form-data'>
                                                    <div class="row ">
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="text" id="username" name="username" placeholder="帳號 " autofocus="autofocus" required="required"/>
                                                        </div>
                                                        <!--檢查username重複時顯示的警示訊息-->
                                                        <div class=" col-sm-12  " id="msg" style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "username" cssClass = "error" /></div>

                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="email" id="email" name="email" placeholder="Email " />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "email" cssClass = "error" /></div>
                                                       
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="password" id="password" name="password" placeholder="密碼 " />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "password" cssClass = "error" /></div>
                                                        
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="password" id="password1" name="password1" placeholder="確認密碼 " />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "password1" cssClass = "error" /></div>
                                                    </div>
                                                <!-- </form> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-lg-6 ">
                                        <div class="sign-popup-wrapper brd-rd5 ">
                                            <div class="sign-popup-inner brd-rd5 ">
                                                <!-- <div class="sign-popup-title text-center ">
                                                    <h4 itemprop="headline ">註冊</h4><span>使用第三方註冊</span>
                                                </div>
                                                <div class="popup-social text-center ">
                                                    <a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank ">
                                                        <i class="fa fa-facebook "></i>Facebook
                                                    </a>
                                                    <a class="google brd-rd3 " href="# " title="Google Plus " itemprop="url " target="_blank ">
                                                        <i class="fa fa-google-plus "></i>Google
                                                    </a>
                                                    <a class="github brd-rd3 " href="# " title="GitHub " itemprop="url " target="_blank ">
                                                        <i class="fa fa-github "></i>GitHub
                                                    </a>
                                                </div>
                                                <span class="popup-seprator text-center "><i
                                                        class="brd-rd50 ">或者</i></span> -->
                                                <!-- <form class="sign-form "> -->
                                                <div class="sign-form ">

                                                    <div class="row ">
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input class="brd-rd3 " style="background-color: #fff; font-size: 20px; text-align: center; color: black; font-weight: bold;" type="text" value="請填寫個人資料" disabled="disabled">
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="text" id="fullname" name="fullname" placeholder="姓名" />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "fullname" cssClass = "error" /></div>
                                                        
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="date" id="dob" name="dob" placeholder="yyyy/mm/dd" />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "dob" cssClass = "error" /></div>
                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 " style="padding-bottom: 0; border: grey 1px solid;"> -->
                                                        
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 " >
                                                            <div style="padding-left: 30px; padding-top: 5px; background: rgb(246, 246, 246); margin-bottom: 10px;">
                                                                <label for="" style="font-size: 15px; float: left; margin-top: 10px; margin-bottom: 0;">性別：</label>
                                                                <label class="" style="margin-left: 25px; margin-right: 25px;" >
                                                                    <input  type="radio" class="" id="male" name="gender" value="男" style="float: left; height: 14px; margin-bottom: 0;" /><span style="float: left;">男</span>
                                                                </label>
                                                                <!-- <label for="" style="font-size: 25px;">男</label> -->
                                                                <label class="">
                                                                    <input  type="radio" class="" id=""female name="gender" value="女" style="float: left; height: 14px; margin-bottom: 0;" /><span style="float: left;">女</span>
                                                                </label>
                                                                <!-- <label for="" style="font-size: 25px;">女</label> -->
                                                            </div>
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "gender" cssClass = "error" /></div>
                                                        
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="text" id="phoneNumber" name="phoneNumber" placeholder="手機號碼 ex. 09XXXXXXXX" />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "phoneNumber" cssClass = "error" /></div>
                                                                                                                    
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="text" id="homeNumber" name="homeNumber" placeholder="家裡電話 ex. 02XXXXXXXX" />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "homeNumber" cssClass = "error" /></div>                                                
                                                        <!--圖片顯示區塊-->
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <img id="output" width="400" />	
                                                        </div>
                                                        <!--上傳照片-->
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input  class="brd-rd3 " style="font-size: 15px; margin-bottom: 5px;" type="file"  accept="image/*" name="memberMultipartFile" id="file2"  onchange="loadFile(event)" />
                                                        </div>
                                                        <div class=" col-sm-12  " style="padding-bottom: 5px; margin-left: 28px; color: red;"><form:errors path = "memberMultipartFile" cssClass = "error" /></div>                                                        
                                                        <!--註冊表單送出按鈕-->
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <button class="red-bg brd-rd3 " style="font-size: 20px;" type="submit ">立即註冊</button>
                                                            <input type="button" class="btn btn-info" value="商家用戶註冊一鍵輸入" onclick='quickInput();'>
                                                        </div>
                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <a class="sign-btn " href="# " title=" " itemprop="url " style="font-size: 15px;">已經註冊了嗎？ 登入</a>
                                                            <a class="recover-btn " href="# " title=" " itemprop="url " style="font-size: 15px;">忘記密碼</a>
                                                        </div> -->
                                                    </div>
                                                </div>    
                                                </form:form>
                                                <!--form標籤結束-->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-6 col-sm-12 col-lg-6 ">
                                        <div class="sign-popup-wrapper brd-rd5 ">
                                            <div class="sign-popup-inner brd-rd5 ">
                                                <div class="sign-popup-title text-center ">
                                                    <h4 itemprop="headline ">SIGN UP</h4><span>with your social
                                                        network</span>
                                                    </div>
                                                    <div class="popup-social text-center "><a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank "><i
                                                        class="fa fa-facebook "></i>Facebook</a><a class="google brd-rd3 " href="# " title="Google Plus " itemprop="url " target="_blank "><i
                                                            class="fa fa-google-plus "></i>Google</a><a class="twitter brd-rd3 " href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i>Twitter</a></div>
                                                            <span class="popup-seprator text-center "><i
                                                        class="brd-rd50 ">or</i></span>
                                                <form class="sign-form ">
                                                    <div class="row ">
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><input class="brd-rd3 " type="text " placeholder="Username ">
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input class="brd-rd3 " type="email " placeholder="Email ">
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input class="brd-rd3 " type="password " placeholder="Password ">
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><button class="red-bg brd-rd3 " type="submit ">REGISTER
                                                                NOW</button></div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <a class="sign-btn " href="# " title=" " itemprop="url ">Already Registered? Sign in</a>
                                                            <a class="recover-btn " href="# " title="" itemprop="url ">Recover my password</a>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="block top-padd80 bottom-padd80 dark-bg ">
                <div class="container ">
                    <div class="row ">
                        <div class="col-md-12 col-sm-12 col-lg-12 ">
                            <div class="footer-data ">
                                <div class="row ">
                                    <div class="col-md-3 col-sm-6 col-lg-3 ">
                                        <div class="widget about_widget wow fadeIn " data-wow-delay="0.1s ">
                                            <div class="logo ">
                                                <h1 itemprop="headline ">
                                                    <a href="# " title="Home " itemprop="url "><img src="assets/images/logo.png " alt="logo.png " itemprop="image "></a>
                                                </h1>
                                            </div>
                                            <p itemprop="description ">Food Ordering is a Premium HTML Template. Best choice for your online store. Let purchase it to enjoy now</p>
                                            <div class="social2 "><a class="brd-rd50 " href="# " title="Facebook " itemprop="url " target="_blank "><i class="fa fa-facebook "></i></a><a class="brd-rd50 " href="# " title="Google Plus " itemprop="url
                " target="_blank "><i class="fa fa-google-plus "></i></a>
                                                <a class="brd-rd50 " href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i></a><a class="brd-rd50 " href="# " title="Pinterest " itemprop="url " target="_blank "><i
                                                        class="fa fa-pinterest "></i></a></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3 ">
                                        <div class="widget information_links wow fadeIn " data-wow-delay="0.2s ">
                                            <h4 class="widget-title " itemprop="headline ">INFORMATION</h4>
                                            <ul>
                                                <li><a href="# " title=" " itemprop="url ">Careers</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Investor Relations</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Press Releases</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Shop with Points</a></li>
                                                <li><a href="# " title=" " itemprop="url ">More Branches</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3 ">
                                        <div class="widget customer_care wow fadeIn " data-wow-delay="0.3s ">
                                            <h4 class="widget-title " itemprop="headline ">CUSTOMER CARE</h4>
                                            <ul>
                                                <li><a href="# " title=" " itemprop="url ">Returns</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Shipping Info</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Gift Cards</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Size Guide</a></li>
                                                <li><a href="# " title=" " itemprop="url ">Money Back</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3 ">
                                        <div class="widget get_in_touch wow fadeIn " data-wow-delay="0.4s ">
                                            <h4 class="widget-title " itemprop="headline ">GET IN TOUCH</h4>
                                            <ul>
                                                <li><i class="fa fa-map-marker "></i>123 New Design Str, ABC Building, melbourne, Australia.</li>
                                                <li><i class="fa fa-phone "></i>(0044) 8647 1234 587</li>
                                                <li><i class="fa fa-envelope "></i><a href="# " title=" " itemprop="url ">hello@yourdomain.com</a></li>
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
        <!-- footer -->
        <div class="bottom-bar dark-bg text-center ">
            <div class="container ">
                <p itemprop="description ">&copy; 2018 <a class="red-clr " href="http://www.bootstrapmb.com " title="Webinane " itemprop="url " target="_blank ">WEBINANE</a>. All Rights Reserved</p>
            </div>
        </div>
        <!-- Bottom Bar -->

        <div class="sign-popup text-center ">
            <div class="sign-popup-wrapper brd-rd5 ">
                <div class="sign-popup-inner brd-rd5 "><a class="sign-close-btn " href="# " title=" " itemprop="url "><i
                            class="fa fa-close "></i></a>
                    <div class="sign-popup-title text-center ">
                        <h4 itemprop="headline ">SIGN UP</h4><span>with your social network</span>
                    </div>
                    <div class="popup-social text-center "><a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank "><i class="fa fa-facebook "></i>Facebook</a><a class="google brd-rd3 " href="# " title="Google Plus
                " itemprop="url " target="_blank "><i
                                class="fa fa-google-plus "></i>Google</a><a class="twitter brd-rd3 " href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i>Twitter</a>
                    </div><span class="popup-seprator text-center "><i class="brd-rd50 ">or</i></span>
                    <form class="sign-form ">
                        <div class="row ">
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="text " placeholder="Username "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="email " placeholder="Email "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="password " placeholder="Password "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><button class="red-bg brd-rd3 " type="submit ">REGISTER NOW</button></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><a class="sign-btn " href="# " title=" " itemprop="url ">Already Registered? Sign in</a><a class="recover-btn " href="# " title=" " itemprop="url ">Recover my password</a></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="log-popup text-center ">
            <div class="sign-popup-wrapper brd-rd5 ">
                <div class="sign-popup-inner brd-rd5 "><a class="log-close-btn " href="# " title=" " itemprop="url "><i
                            class="fa fa-close "></i></a>
                    <div class="sign-popup-title text-center ">
                        <h4 itemprop="headline ">SIGN IN</h4><span>with your social network</span>
                    </div>
                    <div class="popup-social text-center "><a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank "><i class="fa fa-facebook "></i>Facebook</a><a class="google brd-rd3 " href="# " title="Google Plus
                " itemprop="url " target="_blank "><i
                                class="fa fa-google-plus "></i>Google</a><a class="twitter brd-rd3 " href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i>Twitter</a>
                    </div><span class="popup-seprator text-center "><i class="brd-rd50 ">or</i></span>
                    <form class="sign-form ">
                        <div class="row ">
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="text " placeholder="Username or Email "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="password " placeholder="Password "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><button class="red-bg brd-rd3 " type="submit ">SIGN
                                    IN</button></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><a class="sign-btn " href="# " title=" " itemprop="url ">Not a member? Sign up</a><a class="recover-btn " href="# " title=" " itemprop="url ">Recover my password</a></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="sign-popup text-center ">
            <div class="sign-popup-wrapper brd-rd5 ">
                <div class="sign-popup-inner brd-rd5 "><a class="sign-close-btn " href="# " title=" " itemprop="url "><i
                            class="fa fa-close "></i></a>
                    <div class="sign-popup-title text-center ">
                        <h4 itemprop="headline ">SIGN UP</h4><span>with your social network</span>
                    </div>
                    <div class="popup-social text-center "><a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank "><i class="fa fa-facebook "></i>Facebook</a><a class="google brd-rd3 " href="# " title="Google Plus
                " itemprop="url " target="_blank "><i
                                class="fa fa-google-plus "></i>Google</a><a class="twitter brd-rd3 " href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i>Twitter</a>
                    </div><span class="popup-seprator text-center "><i class="brd-rd50 ">or</i></span>
                    <form class="sign-form ">
                        <div class="row ">
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="text " placeholder="Username "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="email " placeholder="Email "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><input class="brd-rd3 " type="password " placeholder="Password "></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><button class="red-bg brd-rd3 " type="submit ">REGISTER NOW</button></div>
                            <div class="col-md-12 col-sm-12 col-lg-12 "><a class="sign-btn " href="# " title=" " itemprop="url ">Already Registered? Sign in</a><a class="recover-btn " href="# " title=" " itemprop="url ">Recover my password</a></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <!-- Main Wrapper -->
<!--     <script src="../../assets/js/jquery.min.js "></script> -->
    <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<!--     <script src="../../assets/js/bootstrap.min.js "></script> -->
    <script src="<c:url value='/assets/js/bootstrap.min.js'/>"></script>
<!--     <script src="../../assets/js/plugins.js "></script> -->
    <script src="<c:url value='/assets/js/plugins.js'/>"></script>
<!--     <script src="../../assets/js/main.js "></script> -->
    <script src="<c:url value='/assets/js/main.js'/>"></script>
</body>

</html>