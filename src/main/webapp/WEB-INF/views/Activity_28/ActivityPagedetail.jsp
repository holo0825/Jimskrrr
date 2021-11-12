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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script async defer
  			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4sJcyr1SmUcw0Q9ip67Dm4sklL_szfFk&callback=initMap">
	</script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- icon -->
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
    
    <title>card-detail</title>
</head>

<style>
	/* navbar */
    body {
        background: #fbfbfb;
    }
    /* navbar second*/
    .btn.btn-light.ms-3 {
        margin-left: 10px;
    }

    .fonts {
        font-size: 16px;
    }

    .MR {
        margin-right: 203px;
    }

    .he {
        height: 63px;
    }

    header {
        height: 70px;
    }

    .dropdown-toggle::after {
        display: inline-block;
        margin-left: 0.255em;
        vertical-align: 0.255em;
        content: "";
        border-top: 0.3em solid;
        border-right: 0.3em solid transparent;
        border-bottom: 0;
        border-left: 0.3em solid transparent;
        color: white;
    }
    /*jumbotron */
    #row {
        padding: 70px 0;
    }
    

    .jumbotron {
        padding-top: 15px;
        background: #FFFFFF;
    }

    .img-fluid {
        padding-bottom: 45px;
    }
    /*立即報名 */
    .bn {
        padding-top: 15px;
        text-align: center;
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

    .navbar-nav li.nav-item {
        position: relative;
        padding: 0 27px;
    }

        .navbar-nav li.nav-item a {
            transition: all .3s;
        }

        .navbar-nav li.nav-item:hover > a {
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
    /*報名確認 */
    .mrml{
    	
	    margin-left: auto;
	    margin-right:auto;

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
    
    //一鍵輸入
    let no = 1000;
    let index = 0;
    
    var nameid= ["a2152265", 'tony5566','coding789'];
    var byname= ["張震嶽", "柯震東","姚中仁"];
    var phone= ["0972643298", '0963158752','0912759356'];
    var email= ["coding00825@gmail.com", 'coding00825@gmail.com','coding00825@gmail.com'];
    function quickInput(){
     document.getElementById('nameid').value = nameid[index];
     document.getElementById('name').value = byname[index];
     document.getElementById('phone').value = phone[index];
     document.getElementById('e-mail').value = email[index];
     
     
     index++;
        if (index >= nameid.length) {
         index = 0 ;
     }
     
    }
  //GOOGLE MAP API  
//  // 用戶輸入的地址
//     var address= "";
//     // 地址轉經緯度後結果
//     var data = {
//            lat:"",
//            lng:""
//     }
//     var map;
//     var geocoder;
//     function initMap() {
//         // 建立 geocoder 物件實例
//         map = new google.maps.Map(document.getElementById('map'), {
//           center: {lat: 25.04, lng: 121.512},
//           zoom: 18
//         });
//         geocoder = new google.maps.Geocoder();
//         // 請 Google Maps API 依據地址轉換成經緯度
//     }
//     $(function(){
//         address = $("#address").val()
//         console.log("輸入地址:"+address);
//         geocoder.geocode( { 'address': address}, function(results, status) {
//             if (status == 'OK') {
//                 // 若轉換成功...
//                 data.lat = results[0].geometry.location.lat();
//                 data.lng = results[0].geometry.location.lng();
//                 map.setCenter({lat: data.lat , lng: data.lng})
//                 console.log("lat"+data.lat+", lng:"+data.lng);
//             } else {
//                 // 若轉換失敗...
//                 console.log(status)
//             }
//         });
// });

</script>
<body>

	<!--nar bar first-->
    <nav class="navbar first-navbar navbar-expand-lg navbar-light bg-dark " style="height: 46px;">
        <form class="form-inline my-2 my-lg-0 ml-auto">
		      
		</form>
<!--         <a class="text-decoration-none co" style="font-size:x-small; padding-left: 5px;padding-right: 5px;" font color="#FFFFFF">登入</a> -->
<!--         <a class="text-decoration-none co" style="font-size:x-small; padding-right: 5px;" font color="#FFFFFF">註冊</a> -->
<!--         <a class="text-decoration-none co" style="font-size:x-small; margin-right: 153px;" font color="#FFFFFF">賣家中心</a> -->
        
        <c:choose>
             <c:when test="${user.username==null}">
             	<a class="log-popup-btn  loingcolor" style="font-size:x-small; padding-right: 3px;" href="<c:url value='/UserTryLogin' />" title="Login" itemprop="url">登入</a>
                <a class="sign-popup-btn loingcolor" style="font-size:x-small; padding-right: 3px;"   href="./register" title="Register" itemprop="url">註冊</a>
                <a class="sign-popup-btn loingcolor" style="font-size:x-small; margin-right: 160px;"  href="#" title="Register" itemprop="url">賣家中心</a>
             </c:when>
             <c:otherwise>
             	<span style="color:white;">${user.username}</span>&nbsp&nbsp&nbsp
             	<a class="sign-popup-btn loingcolor" href="<c:url value='/Userlogout2' />" title="Register" itemprop="url">登出</a>
             </c:otherwise>
        </c:choose>
    </nav>

    <!--nar bar second-->
    <nav class="navbar second_navbar navbar-expand-lg navbar-light bg-light active smart-scroll he shadow-sm p-3 mb-5 bg-white rounded">
        <a class="navbar-brand" href="#">聚點食刻</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse MR" id="navbarSupportedContent">
        
        	<a href="<c:url value='/GroupOneHome' />" title="GroupOneHome" itemprop="url">
						<img style="width:150px;margin-top: 5px;" src="assets/images/icon_get_together.png" alt="Logo.png" itemprop="image">
			</a>
            <ul class="navbar-nav mx-auto">
                <li class="nav-item active">
                    <a class="nav-link font-weight-bold fonts" href="<c:url value='/GroupOneHome' />">首頁 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold fonts" href="#">餐廳</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold fonts" href="#">團購</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold fonts" href="<c:url value='/ActivityPage' />">活動</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link font-weight-bold fonts" href="<c:url value='/ShowArticlesGuest' />">討論區</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold fonts dropdown-toggle::after" href="#" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <!-- data-toggle="dropdown" -->
                        購物車
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<c:url value='/user/CartList/food' />">訂餐</a>
                        <a class="dropdown-item" href="<c:url value='/user/CartList/coupon' />">團購</a>

                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link font-weight-bold fonts dropdown-toggle::after" href="#" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    會員中心</a>
                    <div class="sub-dropdown dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<c:url value='/user/AllCarts' />" itemprop="url">訂單紀錄</a>
                        
                    </div>
                </li>
            </ul>
        </div>
    </nav>

        
    <div class="container ">
        <div class="row"id="row">
<%--         	<c:forEach var="activityPage" items="${activityListdetail}"> --%>
            <div class="jumbotron">
                <div>
                	
                    <img src="<c:url value='/getPictureactivity/${activityListdetail.id}'/>" class="img-fluid" width="1500" alt="Responsive image">
                </div>

                <div>
                    <h3 class="display-9"><c:out value="${activityListdetail.topic}" /></h3>
                    <hr class="my-4">
                </div>

                <h5 class="row1 display-5 font-weight-bold">活動行程(時間)</h5>
                <p><c:out value="${activityListdetail.schedule}" /></p>
                

                <h5 class="row1 display-5 font-weight-bold " >活動地點</h5>
                <a href="" class="text-decoration-none" target="_blank" id="address"><c:out value="${activityListdetail.address}" /></a><br>

                <h5 class="row1 display-5 font-weight-bold">類型 </h5>
                <p><c:out value="${activityListdetail.style}" /></p>

                <h5 class="row1 display-5 font-weight-bold">相關連結</h5>
                <a href="" class="text-decoration-none" target="_blank"><c:out value="${activityListdetail.link}" /></a>

                <h5 class="row1 display-5 font-weight-bold">聯絡廠商email</h5>
                <p><c:out value="${activityListdetail.s_email}" /></p>

                <h5 class="row1 display-5 font-weight-bold">活動介紹</h5>
                <p class="text-monospace"><c:out value="${activityListdetail.introduce}" /></p>

                <h5 class="row1 display-5 font-weight-bold">參與費用</h5>
                <p><c:out value="${activityListdetail.cost}" />元</p>

                <h5 class="row1 display-5 font-weight-bold" >活動名額</h5>
                <p><c:out value="${activityListdetail.quota}" />人</p>

                <h5 class="row1 display-5 font-weight-bold" >注意事項</h5>
                <p style=" color:#ff0000;"><c:out value="${activityListdetail.notice}" /></p>

                <h5 class="row1 display-5 font-weight-bold" >點數</h5>
                <p><c:out value="${activityListdetail.bonus_point}" /></p>
                
                <div id="map"></div>
                
                <div style="text-align:center">
                    <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB4sJcyr1SmUcw0Q9ip67Dm4sklL_szfFk&q=${activityListdetail.address}" allowfullscreen width="1000" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
                
 			<form:form  method="POST" onsubmit="return" modelAttribute="RecordParticipant">
                <div class="bn">
                    <!-- Button 報名參加 -->
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#staticBackdrop">
                        <a role="button">立即報名</a>
                    </button>

                    <!-- Modal -->
                   
                    <div class="modal fade " id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">報名確認</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                    <!--     <form class="needs-validation" novalidate>  -->
                                			<c:if test="${!empty user}">
                                        	<div class="form-group text-left col-md-8 mrml" >
                                                <label for="validationCustom01">使用者名稱</label><br>
                                                 <span style="color:balck;">${user.username}</span>
                                                
                                            </div>
                                            </c:if>
                                            <div class="form-group text-left col-md-8 mrml" >
                                                <label for="validationCustom01" >帳號</label>
                                                 <form:input type="text" path="u_userid"  Class="form-control" id="nameid" value="" required="required" />
                                                
                                            </div>
                                            <div class="form-group text-left col-md-8 mrml">
                                                <label for="validationCustom02">姓名</label>
                                                <form:input type="text" path="u_username" Class="form-control" id="name" value="" required="required"/>
                                                
                                            </div>
                                            <div class="form-group text-left col-md-8 mrml">
                                                <label for="validationCustom03">電話</label>
                                                <form:input type="text" path="u_phone"  Class="form-control" id="phone" value="" required="required" />
                                                
                                            </div>
                                            
                                            <div class="form-group text-left col-md-8 mrml">
                                                <label for="validationCustom04">Email</label>
                                                <form:input type="text" path="sent_email" Class="form-control" id="e-mail" value=""  required="required" />
                                                
                                            </div>

                                        
                                        
                                        <div class="form-group">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                <label class="form-check-label" for="invalidCheck">
                                                    已確認報名資料正確
                                                </label>
                                                <div class="invalid-feedback">
                                                    提交前請先同意輸入資料是否正確
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
											<input id="onejan" type="button" class="btn btn-outline-info" value="一鍵輸入用戶"  onclick='quickInput();' >  <br>
<!--                                        <button type="button" class="btn btn-outline-info">一鍵輸入</button> -->
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
											<a href='/GroupOne_Activity/activitypage${activityListdetail.id}'  onclick="return(confirm('確認報名？'))" >
											<button type="submit" name="submit" class="btn btn-primary">確認送出</button></a>
                                           
                                        </div>
                    <!--       </form> -->            
 								
                                    <script>
                                        // Example starter JavaScript for disabling form submissions if there are invalid fields
                                        (function () {
                                            'use strict';
                                            window.addEventListener('load', function () {
                                                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                                var forms = document.getElementsByClassName('needs-validation');
                                                // Loop over them and prevent submission
                                                var validation = Array.prototype.filter.call(forms, function (form) {
                                                    form.addEventListener('submit', function (event) {
                                                        if (form.checkValidity() === false) {
                                                            event.preventDefault();
                                                            event.stopPropagation();
                                                        }
                                                        form.classList.add('was-validated');
                                                    }, false);
                                                });
                                            }, false);
                                        })();
                                    </script>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </form:form>
     <%--  </c:forEach> --%>
    </div>
 
    <div class="block top-padd80 bottom-padd80 dark-bg _footer" style="height: 280px;">
        <div class="container" style="padding-top: 90px;">
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