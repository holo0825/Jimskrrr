<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Customer</title>
				<link rel="stylesheet" href="<c:url value="/css/style06.css"/>">
				<style>
					.div {
						display: inline-block;
						background-color: white;
						margin: 10px;
						width: 300px;
						height: 300px;
						font-size: medium;
						line-height: 30px;
						text-align: center;
						border: black solid 3px;
					}

					p {
						line-height: 30px;
						font-size: medium;
					}
				</style>
			</head>

			<body>
				<header>
					<h1>customer</h1>
				</header>
				  <div class="box" style="text-align: center;">
   					<a href="<c:url value='/TwoCart' />">現在</a>
    				<a href="<c:url value='/AllCarts' />">歷史</a>
				  </div>
				<c:forEach var="pro" items="${Products}">
					<div class="div">
						<p>名稱:${pro.name}</p>
						<p>價格:${pro.price}</p>
						<p>人數:${pro.people}</p>
						<p>截止日:${pro.date}</p>
						<form action="./CustomerForm" method="get">
							id:<input type="text" id="id" name="id" value="${pro.id}" readonly> <br>
							<label for="number">數量:</label><input type="number" id="number" name="number"> <br>
							<input type="submit" name="Cart" value="送出">
						</form>
					</div>
				</c:forEach>

			<a href="<c:url value='/SellerMain' />">賣家主畫面</a>

			</body>

			</html>