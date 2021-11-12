<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>聚點時刻</title>
<!-- <link rel="stylesheet" href="link.css"> -->
<link rel="stylesheet"
	href="//cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/searchpanes/1.4.0/css/searchPanes.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css">
<style>
header {
	/* 	   	background: #333; */
	color: lightgreen;
	/* 	    padding: 20px; */
	text-align: center;
	margin-bottom: 10px;
}

#container {
	/*     	width: 666px; */
	margin: auto;
	border: 3px solid black;
}
</style>
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: teal">
			<!-- default is tomato -->
			<div>
				<a href=".\listuser" class="navbar-brand"> 聚點時刻 買家用戶管理系統 </a>
			</div>

			<ul class="navbar-nav">
				<li><a href=".\listuser" class="nav-link">買家</a></li>
				<li><a href=".\listseller" class="nav-link"><b>賣家</b></a></li>
				<li><a href="..\Adminlogout" class="nav-link"
					style="color: red">登出</a></li>
				<li>
					<!-- Spring Security新增，必須加入才會登出 -->
					<form action="/logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" value="Logout">
					</form>
				</li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container-fluid">
			<h3 class="text-center">買家用戶名單</h3>
			<hr>
			<div class="container text-left">
				<a href=".\newuser" class="btn btn-success">Add New User</a> <a
					href=".\listuser" class="btn btn-success">Select All Users</a>

				<button type="button" class="btn btn-primary findAll">AjaxFindAll</button>

				<br>
			</div>
			<br>
		</div>
		<table id="findAll" class="display">
			<thead>
				<tr>
					<th>ID</th>
					<th>帳號</th>
					<th>姓名</th>
					<th>出生年月日</th>
					<th>性別</th>
					<th>email</th>
					<th>手機號碼</th>
					<th>家裡電話</th>
					<th>紅利點數</th>
					<th>編輯選項</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${listUser}">

					<tr>
						<td>${user.id}</td>
						<td>${user.username}</td>
						<td>${user.fullname}</td>
						<td>${user.dob}</td>
						<td>${user.gender}</td>
						<td>${user.email}</td>
						<td>${user.phoneNumber}</td>
						<td>${user.homeNumber}</td>
						<td>${user.bonusPoint}</td>			
						<td><a href=".\edituser\<c:out value='${user.id}' />">
								<button class="btn btn-warning" onclick="return confirm('請確認是否編輯該筆買家資料');">
									編輯
								</button>
							</a>	
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href=".\deleteuser\<c:out value='${user.id}' />">
								<button class="btn btn-danger" onclick="return confirm('請確認是否刪除該筆買家資料');">
									刪除
								</button>
							</a>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th>ID</th>
					<th>帳號</th>
					<th>姓名</th>
					<th>出生年月日</th>
					<th>性別</th>
					<th>email</th>
					<th>手機號碼</th>
					<th>家裡電話</th>
					<th>紅利點數</th>
					<th>編輯選項</th>
				</tr>
			</tfoot>
		</table>
	</div>




	<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
	<script src="//cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/searchpanes/1.4.0/js/dataTables.searchPanes.min.js"></script>
	<script src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	
	<script>
// 		$(function() {
// 			$('#findAll').DataTable({
// 				"scrollY" : "300px",
// // 				"scrollX" : "300px",
// 				"scrollCollapse" : true,
// 				"paging" : true,
// 				"searching" : true,
// 			});
// 		})

		$(function() {
			// Create DataTable
		    var table = $('#findAll').DataTable({
		        dom: 'Pfrtip',
		    });
		 
		    // Create the chart with initial data
		    var container = $('<div/>').insertBefore(table.table().container());
		 
		    var chart = Highcharts.chart(container[0], {
		        chart: {
		            type: 'pie',
		        },
		        title: {
		            text: 'Staff Count Per Position',
		        },
		        series: [
		            {
		                data: chartData(table),
		            },
		        ],
		    });
		 
		    // On each draw, update the data in the chart
		    table.on('draw', function () {
		        chart.series[0].setData(chartData(table));
		    });
		});
		 
		function chartData(table) {
		    var counts = {};
		 
		    // Count the number of entries for each position
		    table
		        .column(1, { search: 'applied' })
		        .data()
		        .each(function (val) {
		            if (counts[val]) {
		                counts[val] += 1;
		            } else {
		                counts[val] = 1;
		            }
		        });
		 
		    // And map it to the format highcharts uses
		    return $.map(counts, function (val, key) {
		        return {
		            name: key,
		            y: val,
		        };
		    });
		}
	</script>
</body>

</html>