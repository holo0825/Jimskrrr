<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>聚點時刻 買家用戶管理系統</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
// 	$('tbody').on('click', '.delete', function () { //刪除
//         $(this).closest('tr').remove()
// 	}
$(document).ready(function(){
	$('tbody').on('click', '.delete', function () { //刪除
		$(this).closest('tr').remove();
		var userId = $(this).closest('tr').children().eq(0).text();
		console.log(userId);
			$.ajax({
				async:true,
				url: './ajaxdeleteuser/' + userId,
				type: "delete",
				success: function() {
	// 				$("#result").html(data);
					console.log("Done");
				},
				error: function(){
// 					$("#ajaxDelete").prop('disabled', false).text('Error');
					console.log("Error");
				},
				complete: function(){
				}
			});
	});
		
	$('.findAll').on('click', function () { //查詢
			$.ajax({
				async:true,
				url: './ajaxlistuser',
				type: "get",
				success: function(data) {
	// 				$("#result").html(data);
					console.log("Done");
					console.log(data);
				},
				error: function(){
					console.log("Error");
				},
				complete: function(){
					console.log('clicked findAll button');
				}
			});
	});
});

</script>

</head>
<body>
	 
	<%
	if(session.getAttribute("admin") == null) {
	    out.println("<script>");
	    out.println("alert('權限不足，請先登入');");
// 	    out.println("window.location.href='index.jsp';");
	    out.println("window.location.href='../index';");
	    out.println("</script>");
	}/*
	if(session.getAttribute("admin") != null) {
	    out.println("<script>");
	    out.println("alert('您已經登入');");
	    //out.println("window.location.href='sellerCenter.jsp';");
	    out.println("</script>");
	}*/
	%>
	
	
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: teal"> <!-- default is tomato -->
			<div>
<!-- 				<a href="user-list.jsp" class="navbar-brand">  -->
				<a href="..\UserAll\listuser" class="navbar-brand"> 
					聚點時刻 買家用戶管理系統 </a>
			</div>

			<ul class="navbar-nav">
<!-- 				<li><a href=".\UserAll?action=listuser" -->
				<li><a href="..\UserAll\listuser"
					class="nav-link"><b>買家</b></a></li>
<!-- 				<li><a href="seller-list.jsp" -->
				<li><a href="..\SellerAll\listseller"
					class="nav-link">賣家</a></li>
				<li><a href="..\Adminlogout"
					class="nav-link" style="color:red">登出</a></li>
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
<!-- 				<a href=".\UserAll?action=newuser" class="btn btn-success" >Add -->
				<a href="..\UserAll\newuser" class="btn btn-success" >Add
					New User</a>

<!-- 				<a href=".\UserAll?action=listuser" class="btn btn-success" >Select -->
				<a href="..\UserAll\listuser" class="btn btn-success" >Select
					All Users</a>
					
				<button type="button" class="btn btn-primary findAll">AjaxFindAll</button>
											
					<br>
				  <!-- <form class="form-inline">
				    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				  </form>  -->
			</div>
			<br>
			<table class="table table-striped table-bordered table-hover ">
				<caption>所有買家用戶資料</caption>
				<thead>
					<tr>
<!-- 						<th>ID</th> -->
<!-- 						<th>username</th> -->
<!-- 						<th>fullname</th> -->
<!-- 						<th>dob</th> -->
<!-- 						<th>gender</th> -->
<!-- 						<th>email</th> -->
<!-- 						<th>phoneNumber</th> -->
<!-- 						<th>homeNumber</th> -->
<!-- 						<th>bonusPoint</th> -->
<!-- 						<th>Actions</th> -->
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.username}" /></td>
							<td><c:out value="${user.fullname}" /></td>
							<td><c:out value="${user.dob}" /></td>
							<td><c:out value="${user.gender}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.phoneNumber}" /></td>
							<td><c:out value="${user.homeNumber}" /></td>
							<td><c:out value="${user.bonusPoint}" /></td>
<%-- 							<td><a href=".\UserAll?action=edituser&id=<c:out value='${user.id}' />">Edit</a> --%>
							<td><a href="..\UserAll\edituser\<c:out value='${user.id}' />"><button class="btn btn-warning" onclick="return confirm('請確認是否編輯該筆買家資料');">編輯</button></a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
<%-- 							<a href=".\UserAll?action=deleteuser&id=<c:out value='${user.id}' />">Delete</a></td> --%>
								<a href="..\UserAll\deleteuser\<c:out value='${user.id}' />"><button class="btn btn-danger" onclick="return confirm('請確認是否刪除該筆買家資料');">刪除</button></a></td>
<%-- 							<td><a href="..\UserAll\ajaxdeleteuser\<c:out value='${user.id}' />"><button id="ajaxDelete">AjaxDelete</button></a></td> --%>
							<td><button class="btn btn-primary" type="button" class="delete">AjaxDelete</button></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>
