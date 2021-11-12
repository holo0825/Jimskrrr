<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Seller Update</title>
				<link rel="stylesheet" href="<c:url value="/css/style06.css"/>">
				<style>
					.div {
						display: inline-block;
						background-color: white;
						margin: 10px;
						width: 300px;
						height: 300px;
						font-size: medium;
						text-align: center;
						line-height: 30px;
						border: black solid 3px;
					}

					p {
						line-height: 30px;
						font-size: medium;
					}

					.t1 {
						width: 450px;
						margin: 20px;
						padding-bottom: 10px;
					}
				</style>
			</head>

			<body>
				<header>
					<h1>Seller Update</h1>
				</header>

				<c:forEach var="pro" items="${Products}">
					<div class="div">
						<form action="<c:url value='/sellerUpdateForm' />" method="get" enctype="multipart/form-data">
							<input type="hidden" id="number" name="productno" value="${pro.id}" > <br>
							<img width='150'src="<c:url value='/getPictureSeller/${pro.id}'/>" /><br>
							<label for="name">名稱:</label><input type="text" id="productname" name="productname"
								value="${pro.name}"><br>
							<label for="price">價格:</label><input type="number" id="price" name="price"
								value="${pro.price}"><br>
							<label for="people">人數:</label><input type="number" id="people" name="people"
								value="${pro.people}"><br>
							<label for="now">日期:</label><input type="text" id="now" name="now"
								value="${pro.date}" readonly><br>
							<label for="date">更改截止日:</label><input type="date" id="date" name="date" value="${pro.date}"> <br>
							<input type="submit" name="UPDATE" value="更新">
							<input type="submit" name="DELETE" value="刪除">
						</form>
					</div>
				</c:forEach>
				<a href="<c:url value='/SellerMain' />">賣家主畫面</a>
				<a href="<c:url value='/Seller' />">賣家新增</a>
				


			</body>

			</html>