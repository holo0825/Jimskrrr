<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>賣家主畫面</title>
    <link rel="stylesheet" href="<c:url value="/css/style06.css"/>">
</head>
<body>
  	<header>
        <h1>SellerMain</h1>
    </header>
	<a href="<c:url value='/Seller' />">賣家新增</a>
	<a href="<c:url value='/SellerUpdate' />">賣家修改</a>
	<a href="<c:url value='/Customer' />">買家</a>
</body>
</html>
