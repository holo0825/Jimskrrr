<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>聚點時刻 賣家用戶管理系統</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('tbody').on('click', '.delete', function () { //刪除
		$(this).closest('tr').remove();
		var sellerId = $(this).closest('tr').children().eq(0).text();
		console.log(sellerId);
			$.ajax({
				async:true,
				url: './ajaxdeleteseller/' + sellerId,
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
				url: './ajaxlistseller',
				type: "get",
				success: function() {
	// 				$("#result").html(data);
					console.log("Done");
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
	<!-- 
	< %
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
	  -->
	
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: SkyBlue"> <!-- default is tomato -->
			<div>
<!-- 				<a href="seller-list.jsp" class="navbar-brand">  -->
<!-- 				<a href="..\SellerAll\listseller" class="navbar-brand">  -->
				<a href=".\listseller" class="navbar-brand"> 
					聚點時刻 賣家用戶管理系統 </a>
			</div>

			<ul class="navbar-nav">
<!-- 				<li><a href="user-list.jsp" -->
<!-- 				<li><a href="..\UserAll\listuser" -->
				<li><a href=".\listuser"
					class="nav-link">買家</a></li>
<!-- 				<li><a href=".\SellerAll?action=listseller" -->
<!-- 				<li><a href="..\SellerAll\listseller" -->
				<li><a href=".\listseller"
					class="nav-link"><b>賣家</b></a></li>
				<li><a href="..\Adminlogout"
					class="nav-link" style="color:red">登出</a></li>
				<li>
				     <!-- Spring Security新增，必須加入才會登出 -->
					<form action="/logout" method="post">
					   <input type="hidden"
					    name="${_csrf.parameterName}"
				    	value="${_csrf.token}"/>
				  		<input type="submit" value="Logout">
		 			</form>
				</li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container-fluid">
			<h3 class="text-center">賣家用戶名單</h3>
			<hr>
			<div class="container text-left">
<!-- 				<a href=".\SellerAll?action=newseller" class="btn btn-success" >Add -->
<!-- 				<a href="..\SellerAll\newseller" class="btn btn-success" >Add -->
				<a href=".\newseller" class="btn btn-success" >Add
					New Seller</a>

<!-- 				<a href=".\SellerAll?action=listseller" class="btn btn-success" >Select -->
<!-- 				<a href="..\SellerAll\listseller" class="btn btn-success" >Select -->
				<a href=".\listseller" class="btn btn-success" >Select
					All Sellers</a>
					
				<button type="button" class="btn btn-primary findAll" >AjaxFindAll</button>								

					<br>
				  <!-- <form class="form-inline">
				    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				  </form>  -->
			</div>
			<br>
			<table id="myTable" class="table table-striped table-bordered table-hover">
				<caption>所有賣家用戶資料</caption>
				<thead>
					<tr>
<!-- 						<th>ID</th> -->
<!-- 						<th>username</th> -->
<!-- 						<th>fullname</th> -->
<!-- 						<th>dob</th> -->
<!-- 						<th>gender</th> -->
<!-- 						<th>email</th> -->
<!-- 						<th>phoneNumber</th> -->
<!-- 						<th>telephoneNumber</th> -->
<!-- 						<th>extensionNumber</th> -->
<!-- 						<th>companyName</th> -->
<!-- 						<th>companyAddress</th> -->
<!-- 						<th>businessCert</th> -->
<!-- 						<th>verifyStatus</th> -->
<!-- 						<th>Actions</th> -->
						<th>ID</th>
						<th>帳號</th>
						<th>姓名</th>
						<th>出生年月日</th>
						<th>性別</th>
						<th>email</th>
						<th>手機號碼</th>
						<th>公司電話</th>
						<th>分機號碼</th>
						<th>公司名稱</th>
						<th>公司地址</th>
						<th>營業登記證明</th>
						<th>審核狀態</th>
						<th>編輯選項</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="seller" items="${listSeller}">

						<tr>
							<td><c:out value="${seller.id}" /></td>
							<td><c:out value="${seller.username}" /></td>
							<td><c:out value="${seller.fullname}" /></td>
							<td><c:out value="${seller.dob}" /></td>
							<td><c:out value="${seller.gender}" /></td>
							<td><c:out value="${seller.email}" /></td>
							<td><c:out value="${seller.phoneNumber}" /></td>
							<td><c:out value="${seller.telephoneNumber}" /></td>
							<td><c:out value="${seller.extensionNumber}" /></td>
							<td><c:out value="${seller.companyName}" /></td>
							<td><c:out value="${seller.companyAddress}" /></td>
							<td><c:out value="${seller.businessCert}" /></td>
							<td><c:out value="${seller.verifyStatus}" /></td>
<%-- 							<td><a href=".\SellerAll?action=editseller&id=<c:out value='${seller.id}' />">Edit</a> --%>
<%-- 							<td><a href="..\SellerAll\editseller\<c:out value='${seller.id}' />"><button class="btn btn-warning" onclick="return confirm('請確認是否編輯該筆賣家資料');">編輯</button></a> --%>
							<td><a href=".\editseller\<c:out value='${seller.id}' />"><button class="btn btn-warning" onclick="return confirm('請確認是否編輯該筆賣家資料');">編輯</button></a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
<%-- 							<a href=".\SellerAll?action=deleteseller&id=<c:out value='${seller.id}' />">Delete</a></td> --%>
<%-- 								<a href="..\SellerAll\deleteseller\<c:out value='${seller.id}' />"><button class="btn btn-danger" onclick="return confirm('請確認是否刪除該筆買家資料');">刪除</button></a></td> --%>
								<a href=".\deleteseller\<c:out value='${seller.id}' />"><button class="btn btn-danger" onclick="return confirm('請確認是否刪除該筆買家資料');">刪除</button></a></td>
<%-- 							<td><a href="..\SellerAll\ajaxdeleteseller\<c:out value='${seller.id}' />"><button id="ajaxDelete">AjaxDelete</button></a></td> --%>
							<td><button type="button" class="btn btn-primary delete" >AjaxDelete</button></td>								
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>
