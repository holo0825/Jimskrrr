<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>會員中心</title>
<!-- <link rel="stylesheet" href=".\registerStyle.css"> -->
<!-- <link rel="stylesheet" href="./css/registerStyle.css" type="text/css" /> -->
<link rel="stylesheet" href="<c:url value='/css/registerStyle.css'/>" type="text/css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
	body {
		text-align: center;
		padding-top: 100px;
		background-color: lightgoldenrodyellow;
	}
	#button {
		width: 400px;
		height: 200px;
		font-size: 50px;
	}
</style>
</head>
<body>
    <h1>聚點時刻 聚在一起點</h1>
    <hr>
<!--     <a href="userLogin.jsp">買家用戶登入</a> -->
<!--     <a href=".\UserTryLogin">買家用戶登入</a> -->
<!--     <a href="sellerLogin.jsp">賣家用戶登入</a> -->
<!--     <a href=".\SellerTryLogin">賣家用戶登入</a> -->
<!--     <a href="adminLogin.jsp">管理員登入</a> -->
<!--     <a href=".\AdminTryLogin">管理員登入</a> -->
<!--     <a href="./articleIndex">討論區</a> -->

    <a href="<c:url value='/login'/>"><button id="button" class="btn btn-primary">登入</button></a>
    
    <hr>
</body>
</html>