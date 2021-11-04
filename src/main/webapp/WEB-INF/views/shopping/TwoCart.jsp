<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="<c:url value='/css/link.css' />">
  <style>
        .btn {
            text-align: center;
        }
        table{
            margin: auto;
        }
		.pn{
			border-right: 1px dashed black;
		}
    </style>
</head>

<body>
	<header>
		<h1>目前存在的購物車</h1>
	</header>
	<div id="container">
	  <div class="paytype">
            <input type="hidden" name="username" value="${info}">
            <table>
				<thead>
					<tr>
						<th>商品類型</th>
						<th></th>
					</tr>
				</thead>
                <tbody>
               
                <c:forEach items="${twoCart}" var="twoCart" varStatus="status"> 
                	<tr class="itr">
						<form action="./CartListOld" method="GET">
						<input type="hidden" name="original" value="original">
						<input type="hidden" name="itemNo" value="${twoCart.itemNo}">
						<td class="pn">${twoCart.type}</td>
						<td><button type="button" class="pay${status.index}">結帳</button></td>
						</form>
					</tr>
                </c:forEach>
                  <c:if test="${result=='NoItem'}">
                	<tr>
            	       	<td>目前尚無購物內容</td>
             		</tr>             	        
                </c:if>
                </tbody>
            </table>
        </div>
        <div class="btn">
            <button type="button" id="foodbtn">前往訂餐</button>
            <button type="button" id="couponbtn">參加團購</button>
        </div>	
	</div>
	<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
	<script>
		$(function() {
			$('#foodbtn').on('click', function() {
				location.href = './Customer'
			})
			$('#couponbtn').on('click', function() {
				location.href = './Customer'
			})
			$('.pay0').on('click', function() {
				document.forms[0].submit()
			})
			$('.pay1').on('click', function() {
				document.forms[1].submit()
			})
		})
	</script>
</body>

</html>