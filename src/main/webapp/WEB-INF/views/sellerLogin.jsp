<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>聚點時刻 賣家用戶登入</title>
<!-- <link rel="stylesheet" href=".\registerStyle.css"> -->
<%-- <link rel="stylesheet" href="<c:url value='/css/registerStyle.css'/>" type="text/css" /> --%>
<link rel="stylesheet" href="./css/registerStyle.css" type="text/css" />
</head>
<body>
	<%/*
	if(session.getAttribute("admin") == null) {
	    out.println("<script>");
	    out.println("alert('權限不足，請先登入');");
// 	    out.println("window.location.href='index.jsp';");
	    out.println("window.location.href='../index';");
	    out.println("</script>");
	}*/
	if(session.getAttribute("seller") != null) {
	    out.println("<script>");
	    out.println("alert('您已經登入');");
	    //out.println("window.location.href='sellerCenter.jsp';");
	   	out.println("window.location.href='./SellerHome");
	    out.println("</script>");
	}
	%>
	<h1>聚點時刻 賣家用戶登入</h1>
	<hr>
<!-- 	<a href="index.jsp">首頁</a> -->
	<a href=".\home">首頁</a>
	<hr>
	<div style="text-align: center">
		<h1>賣家登入</h1>
<%-- 		<form:form method="POST" action=".\Sellerlogin" modelAttribute="sellerLoginBean"> --%>
		<!-- 
		<form:form method="GET" action=".\Sellerlogin" modelAttribute="sellerLoginBean">
         <table>
            <tr>
               <td><form:label path = "username">Username</form:label></td>
               <td><form:input path = "username" required="required" autofocus="autofocus"/></td>
            </tr>
            <tr>
               <td><form:label path = "password">Password</form:label></td>
               <td><form:input path = "password" required="required"/></td>
            </tr>
            <tr>
               <td><form:label path = "email">Email</form:label></td>
               <td><form:input path = "email" required="required"/></td>
            </tr>
            <tr>
               <td colspan = "2">
                  <input type = "submit" value = "Submit"/>
               </td>
            </tr>
         </table>  
      </form:form>
       	-->
		<!-- Spring新版form:form表單 -->
		<form:form id="loginForm" method="GET" action=".\Sellerlogin" modelAttribute="sellerLoginBean">
			<form:label path="email"><span id="must">*</span>Email:</form:label> <form:input id="email1" path="email" size="30" autofocus="autofocus" required="required"/> <br>
			<br> <form:label path="username"><span id="must">*</span>帳號:</form:label> <form:input
				id="username1" path="username" size="30" required="required"/> <br>
			<br> <form:label path="password"><span id="must">*</span>密碼:</form:label> <form:input 
			type="password"	id="password1" path="password" size="30" required="required"/>
			<br>
			<br>           
			<button type="submit">登入</button>
<!-- 			<a href=".\Register\SellerTryRegister">賣家用戶註冊</a> -->
			<a href=".\Register\SellerTryRegister">賣家用戶註冊</a>
			<div style="color:red">${message}</div>
		</form:form>
			<!-- Servlet舊版form表單 -->
<!-- 		<form id="loginForm" action=".\Sellerlogin?action=sellerlogin" -->
<!-- 			method="post"> -->
<!-- 			<label for="email1"><span id="must">*</span>Email:</label> <input name="email" id="email1" size="30" autofocus required/> <br> -->
<!-- 			<br>  -->
<!-- 			<label for="username1"><span id="must">*</span>帳號:</label> <input type="text" -->
<!-- 				name="username" id="username1" size="30" required/> <br> -->
<!-- 			<br> -->
<!-- 			<label for="password1"><span id="must">*</span>密碼:</label> <input type="password" -->
<%-- 				name="password" id="password1" size="30" required/> <br>${message} <br> --%>
<%-- 			<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%> --%>
<!-- 			<br>            -->
<!-- 			<button type="submit">登入</button> -->
<!-- 			<a href="SellerRegisterForm.jsp">賣家用戶註冊</a> -->
<%-- 		</form> --%>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript">
		    $(document).ready(function() {
			$("#loginForm").validate({
				rules : {
					email : {
						required : true,
						email : true
					},
					username : "required"
					password : "required",
				},

				messages : {
					email : {
						required : "請輸入email",
						email : "請輸入格式正確的email"
					},
					username : "請輸入帳號"
					password : "請輸入密碼"
				}
			});


		});
	</script>
</body>
</html>