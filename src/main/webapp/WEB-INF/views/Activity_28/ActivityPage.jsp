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
<html>
<head>
<meta charset="UTF-8">
<title>Activity 主頁</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	
	
    <link rel="stylesheet" href="assets/css/red-color.css">
    <!-- icon -->
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
</head>
<style>
	body {
            background: #fbfbfb;
        }
        /* navbar second*/
        .btn.btn-light.ms-3 {
            margin-left: 10px;
        }
        .fonts{
            font-size: 16px;
        }
        .MR {

           margin-right: 150px;
        }
        .he{
            height:63px;
        }
        header {
            height: 70px;
        }
        .dropdown-toggle::after {
            display: inline-block;
            margin-left: 0.255em;
            vertical-align: 0.255em;
            content:"";
            border-top: 0.3em solid;
            border-right: 0.3em solid transparent;
            border-bottom: 0;
            border-left: 0.3em solid transparent;
            color:white;
        }
        /* wrapper */
        .card {
            border-radius: 16px;
            display: flex;
            flex-direction: column;
            width: 340px;
            height: 350px;
            background: #FFF;
           	
        }
        .cards {
        	
           	display: none;
        }

            /* item1 */
            .card .item1 {
                width: 100%;
   
            }


                .card .item1 img {
                    border-radius: 16px 16px 0 0;
                    display: block;
                    width: 100%;
                    
                }

            /* item2 */
            .card .item2 {
                width: 100%;
                flex: 1;
                box-sizing: border-box;
            }

                .card .item2 .textWrapper {
                    padding: 0 16px 8px;
                }

                .card .item2 p {
                    color: #505050;
                    font-size: 13px;
                    font-weight: 500;
                }

                .card .item2 h3 {
                    text-overflow: ellipsis;
                    overflow: hidden;
                    white-space: nowrap;
                    color: #000;
                    margin: 10px 0;
                }

                .card .item2 .tagWrapper {
                    border-top: 1px solid #CCC;
                    padding: 10px 16px;
                }


                .card .item2 .hashtag {
                    color: #b5bac1;
                    font-size: 14px;
                }

        .cn .card:hover {
            transform: translateY(-10px);
            transition: ease all .3s;
        }
        
        /*carousel*/
        #carouselExampleIndicators {
            padding: 80px 150px 10px 150px;
        }

        .carousel-inner {
            border-radius: 25px;
            overflow: hidden;
            width: 100%;
            height: 500px;
        }

        .carousel-control-next {
            margin-right: 50px;
            padding-right: 0px !important;
            right: 70px !important;
            top: 70px !important;
        }

        .carousel-control-prev {
            margin-left: 50px;
            padding-right: 0px !important;
            left: 70px !important;
            top: 70px !important;
        }
        /*activity*/
        .row {
            padding: 30px 0 10px;
        }

        .carousel-item {
            height: 100px;
        }

        .col-md-4 {
            padding-bottom: 20px !important;
        }

        /* header*/
        .bg-dark {
            background-color: #000000 !important;
        }
        .co {
            color: #FFFFFF !important;
        }
        .navbar-light .navbar-nav .nav-link {
            color: rgb(0,0,0);
        }
        .second_navbar {
            z-index: -1;
        }
             
        .second_navbar.active {
            top: 47px !important;
        }

        .navbar-nav li.nav-item{
            position: relative;
            padding: 0 27px;
        }

        .navbar-nav li.nav-item a {
            transition: all .3s;
        }
        
        .navbar-nav li.nav-item:hover >a {
            color: #ffbe00 !important;
            transition: all .3s linear;
        }

        .navbar-nav li.nav-item:before {
            content: "";
            width: 1px;
            height: 35px;
            background-color: #d8d7d7;
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .smart-scroll {
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            z-index: 1030;
        }

        .scrolled-down {
            transform: translateY(-100%);
            transition: all 0.2s ease-in-out;
        }

        .scrolled-up {
            transform: translateY(0);
            transition: all 0.2s ease-in-out;
        }

        /* footer */
        ._footer.dark-bg {
            background-color: #1b1b1b;
        }

        ._footer h4, ._footer a, ._footer li, ._footer p {
            color: #FFF;
        }


        ._footer a {
            font-size: 13px;
        }


        ._footer a:hover {
            color: #ea1b25;
        }

        ._footer ul {
            list-style-type: disc;
        }
        
        /* Filter DIV Elements */
        
        .show {
 			 display: block;
		}
		
		
		/* Style the buttons */
        .bttn {

            padding: 12px 16px;
            cursor: pointer;
        }

        .bttn:hover {
            
        }

        .bttn.activee {
           
         }
         /*color change*/
        .loingcolor{
        	
        	color:white;
        }
        .loingcolor:hover{
        	text-decoration:none;
        	color:red;
        }
            
</style>
<script>
       //navbar float
        window.addEventListener('scroll', function (e) {
            var method = window.scrollY <= 10 ? 'add' : 'remove'
            document.getElementsByClassName('second_navbar')[0].classList[method]("active");
        });
       

        $('body').css('padding-top', $('.navbar').outerHeight() + 'px')

        // detect scroll top or down
        $(function () {
            if ($('.smart-scroll').length > 0) { // check if element exists
                var last_scroll_top = 0;
                $(window).on('scroll', function () {
                    scroll_top = $(this).scrollTop();
                    if (scroll_top < last_scroll_top) {
                        $('.smart-scroll').removeClass('scrolled-down').addClass('scrolled-up');
                    }
                    else {
                        $('.smart-scroll').removeClass('scrolled-up').addClass('scrolled-down');
                    }
                    last_scroll_top = scroll_top;
                });
            }
        })
        
     //Filter DIV Elements
     filterSelection("all")
        function filterSelection(c) {
            var x, i;
            x = document.getElementsByClassName("cards");
            if (c == "all") c = "";
            for (i = 0; i < x.length; i++) {
                w3RemoveClass(x[i], "show");
                if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
            }
        }

        function w3AddClass(element, name) {
            var i, arr1, arr2;
            arr1 = element.className.split(" ");
            arr2 = name.split(" ");
            for (i = 0; i < arr2.length; i++) {
                if (arr1.indexOf(arr2[i]) == -1) { element.className += " " + arr2[i]; }
            }
        }

        function w3RemoveClass(element, name) {
            var i, arr1, arr2;
            arr1 = element.className.split(" ");
            arr2 = name.split(" ");
            for (i = 0; i < arr2.length; i++) {
                while (arr1.indexOf(arr2[i]) > -1) {
                    arr1.splice(arr1.indexOf(arr2[i]), 1);
                }
            }
            element.className = arr1.join(" ");
        }

        // Add active class to the current button (highlight it)
        var btnContainer = document.getElementById("myBtnContainer");
        var btns = btnContainer.getElementsByClassName("bttn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("activee");
                current[0].className = current[0].className.replace(" activee", "");
                this.className += " activee";
            });
        }
</script>
<body>
	<!--nar bar first-->
    <nav class="navbar first-navbar navbar-expand-lg navbar-light bg-dark  ">
    
    <a class="nav-link text-decoration-none co" href="<c:url value='admin/ActivityRegister' />">後端</a>
<%--     <a class="nav-link text-decoration-none co" href="<c:url value='/test' />">後端2</a> --%>
    
        <form class="form-inline my-2 my-lg-0 ml-auto" action="${pageContext.request.contextPath}/activityQuery">
		      <input class="form-control mr-sm-2" type="search" name="search" placeholder="查詢主題關鍵字" aria-label="Search" style="height: 30px;">
		      <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" type="submit">查詢</button>
		</form>
<%--         <a class="text-decoration-none co" style="font-size:x-small; padding-left: 5px;padding-right: 5px;" font color="#FFFFFF" href="<c:url value='/UserTryLogin' />">登入</a> --%>
<%--         <a class="text-decoration-none co" style="font-size:x-small; padding-right: 5px;" font color="#FFFFFF" href="<c:url value='/' />">註冊</a> --%>
<%--         <a class="text-decoration-none co" style="font-size:x-small; margin-right: 153px;" font color="#FFFFFF" href="<c:url value='/' />">賣家中心</a> --%>
        <c:choose>
             <c:when test="${user.username == null}">
             	<a class="log-popup-btn  loingcolor" style="font-size:x-small; padding-left: 5px;padding-right: 3px;" href="home" title="Login" itemprop="url">登入</a>
                <a class="sign-popup-btn loingcolor" style="font-size:x-small; padding-right: 3px;"   href="./register" title="Register" itemprop="url">註冊</a>
                <a class="sign-popup-btn loingcolor" style="font-size:x-small; margin-right: 153px;"  href="#" title="Register" itemprop="url">賣家中心</a>
             </c:when>
             <c:otherwise>
             	<span style="color:white;">${user.username}</span>&nbsp&nbsp&nbsp
             	<a class="sign-popup-btn loingcolor" href="<c:url value='/Userlogout2' />" title="Register" itemprop="url">登出</a>
             </c:otherwise>
        </c:choose>
        
        
    </nav>

    <!--nar bar second-->
    <nav class="navbar second_navbar navbar-expand-lg navbar-light bg-light active smart-scroll he shadow-sm p-3 mb-5 bg-white rounded" >
        <a class="navbar-brand" href="#">聚點食刻</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse MR" id="navbarSupportedContent" >
            <ul class="navbar-nav mx-auto">
                <li class="nav-item active">
                    <a class="nav-link font-weight-bold fonts" href="<c:url value='/GroupOneHome' />">首頁 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold fonts" href="#">餐廳</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold fonts" href="./CartList/coupon">團購</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold fonts" href="<c:url value='/ActivityPage' />">活動</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link font-weight-bold fonts" href="#">討論區</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold fonts dropdown-toggle::after" href="#" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <!-- data-toggle="dropdown" -->
                        購物車
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">訂餐</a>
                        <a class="dropdown-item" href="#">團購</a>
                        
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold fonts dropdown-toggle::after" href="#" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    會員中心</a>
                    <div class="sub-dropdown dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="./AllCarts" itemprop="url">訂單紀錄</a>
                        
                    </div>
                    
                </li>
                
            </ul>    
        </div>
    </nav>

    <!--Carouse-->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="https://static.accupass.com/eventbanner/2012280902011043009888_P520x260.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://static.accupass.com/eventbanner/2110040959211854808114.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="https://static.accupass.com/eventbanner/2109270626069305592400.jpg" alt="Third slide">
            </div>
           
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    
	<!--篩選-->
		<div id="myBtnContainer" class="" style="margin-left: 210px;">
	        <button class="bttn activee btn btn-warning font-weight-bold" onclick="filterSelection('all')">全部</button>
	        <button class="bttn btn btn-warning font-weight-bold" onclick="filterSelection('體驗')">體驗</button>
	        <button class="bttn btn btn-warning font-weight-bold" onclick="filterSelection('宣傳活動')">宣傳活動</button>
	        <button class="bttn btn btn-warning  font-weight-bold" onclick="filterSelection('比賽')">比賽</button>
	        
	    </div>
	    
    <!--各式活動-->
    <div class="container">
        <div class="row ">
            <!-- JAVA  -->
   
            <c:forEach var="activityPage" items="${activityListPage}">
                <div class="col-md-4 cn cards show ${activityPage.style} ">
                    <div class="card">
                        <div class="item1 ">
                        <!--    <a href="http://localhost:60810/index%20(2).html"></a><br> -->
                        <!-- 讀取圖片 -->
               				
                            <a href="<c:url value='/activitypage?id=${activityPage.id}' />"><img width='150'src="<c:url value='/getPictureactivity/${activityPage.id}'/>" /></a><br>
                        </div>
                        <div class="item2">
                            <div class="textWrapper">
                                <p class="text1">    <c:out value="${activityPage.schedule}" />     </p>
                                <a href="<c:url value='/activitypage?id=${activityPage.id}' />" class="text-decoration-none text-dark" style=" font-size:18px;">
                                <h6 class="font-weight-bold ">   <c:out value="${activityPage.topic}" /> </a>  </h6>
                            </div>
                            <div class="tagWrapper ">
                                <span class="hashtag font-weight-bold" style="color:blue; font-size:14px;">  <c:out value="${activityPage.style}" />   </span>
                                 <a href="<c:url value='/activitypage?id=${activityPage.id}' />">
                                <button type="button" class="btn btn-outline-danger float-right" value="">
                                剩餘:<c:out value="${activityPage.quota}" />人</button>  </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!--  -->
        </div>
    </div>
    <!-- Footer Data -->
   	<div class="block top-padd80 bottom-padd80 dark-bg _footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-lg-12">
                    <div class="footer-data">
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-lg-3">
                                <div class="widget about_widget wow fadeIn" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeIn;">
                                    <div class="logo">
                                        <h1 itemprop="headline">
                                            <a href="#" title="Home" itemprop="url"><img src="assets/images/logo.png" alt="logo.png" itemprop="image"></a>
                                        </h1>
                                    </div>
                                    <p itemprop="description">聚點食刻，共享美食每一刻！</p><p>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-lg-3">
                                <div class="widget information_links wow fadeIn" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeIn;">
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
                                <div class="widget customer_care wow fadeIn" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeIn;">
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
                                <div class="widget get_in_touch wow fadeIn" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeIn;">
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
                        <div class="bottom-bar dark-bg text-center">
                            <div class="container">
                                <p itemprop="description">
                                    &copy; 2021
                                    <a class="red-clr" href="http://www.bootstrapmb.com" title="Webinane" itemprop="url" target="_blank"></a>聚點食刻. All Rights Reserved
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- Footer Data -->
                </div>
            </div>
        </div>
    </div>
       
</body>
</html>