<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/yu.css">
<link rel="stylesheet" href="../focus2/css/style.css">
</head>
<title>聚點時刻 管理員端-餐廳管理系統</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('tbody').on('click', '#del', function () { //刪除
		$(this).closest('tr').remove();
		var userName = $(this).closest('tr').children().eq(0).text();  //eq(0)欄位		
		var rstName = $(this).closest('tr').children().eq(1).text();  //eq(1)欄位
		console.log(rstName);
		console.log(productName);
			$.ajax({
				async:true,
				url: './updateRestaurantByAdmin', //控制器網址+控制器 刪除的rstName,
				type: "delete",
				data: "userName=" +userName + "&rstName="+ rstName,
				success : function() {
					// 				$("#result").html(data);
					console.log("Done");
				},
				error : function() {
					//				 					$("#ajaxDelete").prop('disabled', false).text('Error');
					console.log("Error");
				},
				complete : function() {
				}
			});
		});
	});
</script>

<!-- 前端畫面for管理員 管理餐廳 -->

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="index.html" class="brand-logo"> <img class="logo-abbr"
				src="../images/logo.png" alt=""> <img class="logo-compact"
				src="../images/logo-text.png" alt=""> <img class="brand-title"
				src="../images/logo-text.png" alt="">
			</a>
 			<div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
<!--                             <div class="search_bar dropdown"> -->
<!--                                 <span class="search_icon p-3 c-pointer" data-toggle="dropdown"> -->
<!--                                     <i class="mdi mdi-magnify"></i> -->
<!--                                 </span> -->
<!--                                 <div class="dropdown-menu p-0 m-0"> -->
<!--                                     <form> -->
<!--                                         <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
<!--                                     </form> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <!-- <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Martin</strong> has added a <strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-shopping-cart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Jennifer</strong> purchased Light Dashboard 2.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="danger"><i class="ti-bookmark"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Robin</strong> marked a <strong>ticket</strong> as unsolved.
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-heart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>David</strong> purchased Light Dashboard 1.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-image"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong> James.</strong> has added a<strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">See all notifications <i
                                            class="ti-arrow-right"></i></a>
                                </div> -->
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="./app-profile.html" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="./email-inbox.html" class="dropdown-item">
                                        <i class="icon-envelope-open"></i>
                                        <span class="ml-2">Inbox </span>
                                    </a>
                                    <a href="./page-login.html" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="quixnav">
			<div class="quixnav-scroll">
				<ul class="metismenu" id="menu">
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">會員管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">A</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">B</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.html">1</a></li>
                                    <li><a href="./email-inbox.html">2</a></li>
                                    <li><a href="./email-read.html">3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">餐廳管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">A</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">B</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.html">1</a></li>
                                    <li><a href="./email-inbox.html">2</a></li>
                                    <li><a href="./email-read.html">3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">團購管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">A</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">B</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.html">1</a></li>
                                    <li><a href="./email-inbox.html">2</a></li>
                                    <li><a href="./email-read.html">3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">銷售管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">A</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">B</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.html">1</a></li>
                                    <li><a href="./email-inbox.html">2</a></li>
                                    <li><a href="./email-read.html">3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">活動管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">A</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">B</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.html">1</a></li>
                                    <li><a href="./email-inbox.html">2</a></li>
                                    <li><a href="./email-read.html">3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">討論區管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">A</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">B</a>
                                <ul aria-expanded="false">
                                    <li><a href="./email-compose.html">1</a></li>
                                    <li><a href="./email-inbox.html">2</a></li>
                                    <li><a href="./email-read.html">3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					
					<li class="nav-label first">其他</li>
					<ul>
						<a href="">返回首頁</a>
					</ul>
				</ul>
			</div>
		</div>


		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">餐廳列表</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-responsive-sm">
									<thead>
										<tr>
											<th>#</th>
											<th>餐廳經營者</th>
											<th>經營者電話</th>
											<th>餐廳名稱</th>
											<th>餐廳地址</th>
											<th>餐廳電話</th>
											<th>編輯</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='rstName' items='${rstName}'>
											<tr>
												<td>${rstName.id}</td>
												<td>${rstName.userName}</td>
												<td>${rstName.mobile}</td>
												<td>${rstName.rstName}</td>
												<td>${rstName.rstAddress}</td>
												<td>${rstName.rstTel}</td>
												<td><input type="submit" id="del" name="del" value="下架該店"></td>
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
		<!--*******
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
					2019
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="../focus2/vendor/global/global.min.js"></script>
	<script src="../focus2/js/quixnav-init.js"></script>
	<script src="../focus2/js/custom.min.js"></script>

</body>

</html>


