<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>聚點時刻 後臺系統</title>
<link rel="shortcut icon" href="../assets/images/favicon.png"
	type="image/x-icon">
<link href="../focus2/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/jquery.dataTables.min.css' />">
<%-- <link rel="stylesheet" href="<c:url value='/css/link.css' />"> --%>
<style>
.p1 {
	text-align: center;
}

.span1 {
	font-size: 30px;
}

#piechart_3d {
	margin: auto
}
</style>
</head>


<!-- 前端畫面for管理員 管理菜單 -->
<!-- 前端畫面for管理員 非法食品?特殊食品? -->

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
					<span class="line"></span><span class="line"></span><span
						class="line"></span>
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
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-bell"></i>
									<div class="pulse-css"></div>
							</a> <!-- <div class="dropdown-menu dropdown-menu-right">
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
                                </div> --></li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-account"></i>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="./app-profile.html" class="dropdown-item"> <i
										class="icon-user"></i> <span class="ml-2">Profile </span>
									</a> <a href="./email-inbox.html" class="dropdown-item"> <i
										class="icon-envelope-open"></i> <span class="ml-2">Inbox
									</span>
									</a> <a href="./page-login.html" class="dropdown-item"> <i
										class="icon-key"></i> <span class="ml-2">Logout </span>
									</a>
								</div></li>
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
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">會員管理</span></a>
						<ul aria-expanded="false">
							<li><a href="./index.html">A</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">B</a>
								<ul aria-expanded="false">
									<li><a href="./email-compose.html">1</a></li>
									<li><a href="./email-inbox.html">2</a></li>
									<li><a href="./email-read.html">3</a></li>
								</ul></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">餐廳管理</span></a>
						<ul aria-expanded="false">
							<li><a href="./index.html">A</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">B</a>
								<ul aria-expanded="false">
									<li><a href="./email-compose.html">1</a></li>
									<li><a href="./email-inbox.html">2</a></li>
									<li><a href="./email-read.html">3</a></li>
								</ul></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">團購管理</span></a>
						<ul aria-expanded="false">
							<li><a href="./index.html">A</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">B</a>
								<ul aria-expanded="false">
									<li><a href="./email-compose.html">1</a></li>
									<li><a href="./email-inbox.html">2</a></li>
									<li><a href="./email-read.html">3</a></li>
								</ul></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">銷售管理</span></a>
						<ul aria-expanded="false">
							<li><a href="./AdminCart">訂單處理</a></li>
							<li><a href="./Adminstatistics">商品統計</a></li>
							
						</ul></li>
					
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">活動管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="ActivityRegister">活動管理 明細</a></li>
                            <li><a href="RecordParticipantBack">管理報名者 明細</a></li>
                        </ul>
                    </li>
					
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">討論區管理</span></a>
						<ul aria-expanded="false">
							<li><a href="./index.html">A</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">B</a>
								<ul aria-expanded="false">
									<li><a href="./email-compose.html">1</a></li>
									<li><a href="./email-inbox.html">2</a></li>
									<li><a href="./email-read.html">3</a></li>
								</ul></li>
						</ul></li>

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
				<div class="row">
					<div class="col-lg-4">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">類別統計</h4>
							</div>
							<div class="card-body">
<!-- 								<div class="table-responsive"> -->
									<div class="profile-statistics">
										<div class="text-center mt-4 border-bottom-1 pb-3">
											<div class="row">
												<c:forEach items="${StatisticsCart}" var="StatisticsCart" varStatus="status">
												<div class="col">
													<h3 class="m-b-0">共<span id="st${status.index}">${StatisticsCart[1]}</span>元</h3>
													<span id="type${status.index}">${StatisticsCart[0]}</span>
												</div>
												</c:forEach>
												<div id="piechart_3d_0" style="width: 100%; height: 500px;"></div>
												<div style="width: 100%;"><canvas id="myChart"></canvas></div>
											</div>
										</div>
									</div>
<!-- 								</div> -->
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">商品統計</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div id="piechart_3d" style="width: 850px; height: 500px;"></div>
									<div id="ListDiv">
										<table id="findAll" class="display" style="color:black;">
											<thead>
												<tr>
													<th>產品名稱</th>
													<th>價格</th>
													<th>數量</th>
													<th>總金額</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${StatisticsList}" var="StatisticsList">
													<tr>
														<td>${StatisticsList[0]}</td>
														<td>${StatisticsList[1]}</td>
														<td>${StatisticsList[2]}</td>
														<td>${StatisticsList[3]}</td>
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
	<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
	<script src="<c:url value='/js/google.charts.loader.js' />"></script>
	<script src="<c:url value='/js/jquery.dataTables.min.js' />"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<script>
		$(function() {
            $('#findAll').DataTable({
            	"language": {
                    "processing": "處理中...",
                    "loadingRecords": "載入中...",
                    "lengthMenu": "顯示 _MENU_ 項結果",
                    "zeroRecords": "沒有符合的結果",
                    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                    "infoPostFix": "",
                    "search": "搜尋:",
                    "paginate": {
                        "first": "第一頁",
                        "previous": "上一頁",
                        "next": "下一頁",
                        "last": "最後一頁"
                    },
                    "aria": {
                        "sortAscending": ": 升冪排列",
                        "sortDescending": ": 降冪排列"
                    }
                	}
            });

            var table = $('#findAll').DataTable(); 
            $('#findAll tbody').on( 'click', 'tr', function () {
                if ($(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            } );

			let type0 = $('#type0').text()
			if(type0 == 'coupon'){
				$('#type0').text('團購券')
			}if(type0 == 'food'){
				$('#type0').text('訂餐')
			}
			let type1 = $('#type1').text()
			if(type1 == 'coupon'){
				$('#type1').text('團購券')
			}if(type1 == 'food'){
				$('#type1').text('訂餐')
			}

            google.charts.load("current", {packages:["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data_0 = google.visualization.arrayToDataTable(${pieCart});

                var options_0 = {
                        title: '商品販賣概況',
                        is3D: true,
                };

                var chart_0 = new google.visualization.PieChart(document.getElementById('piechart_3d_0'));
                chart_0.draw(data_0, options_0);
                
                var data = google.visualization.arrayToDataTable(${pieList});

                var options = {
                        title: '商品販賣概況',
                        is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }  
            
            let num0 = Number($('#st0').text())
            let num1 = Number($('#st1').text())
            let pre0 = (Math.floor(num0/(num0+num1)*10000))/100
            let pre1 = 100 - pre0
            console.log(num0+";"+num1)
            
            var ctx = $('#myChart');
            var myChart = new Chart(ctx, {
                type: 'bar', //圖表類型
                data: {
                    //標題
                    labels: [$('#type0').text(), $('#type1').text()],
                    datasets: [{
                        label: '總金額', //標籤
                        data: [num0, num1], //資料
                        //圖表背景色
                        backgroundColor: [
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        //圖表外框線色
                        borderColor: [
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        //外框線寬度
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                responsive: true //符合響應式
                            }
                        }]
                    }
                }
            });
		})
	</script>

</body>

</html>


