<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>聚點時刻</title>
	<link rel="stylesheet" href="<c:url value='/css/link.css' />">
	<style>
		.number , .tdalign{
			text-align: center;
		}
		.tap2{
			float: right;
		}
		.confirm{
			clear: both;
			text-align: center;
		}
		.tp{
			padding-left: 5px;
		}
		.number::-webkit-outer-spin-button,
        .number::-webkit-inner-spin-button {
            -webkit-appearance: none;
        }
        .number{
        	width: 50px;
        }
	</style>
</head>

<body>
	<header>
		<h1>購物車</h1>
	</header>
	<div id="container">
		<form action="" method="GET" name="shoppingCarts">
			<input type="hidden" name="username" value="${info}">
			<input type="hidden" name="itemNo" value="${no}">
			<hr>
			<div>
				<table>
					<thead>
						<tr>
							<th class="pn" colspan="2">商品</th>
							<th class="pr">單價(NT$)</th>
							<th class="nu">數量</th>
							<th style=" width: 185px;"></th>
						</tr>
					</thead>
					<tbody id="item">
					<c:forEach items="${cartList}" var="cartList" varStatus="status">
					<tr class="itr">
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${test123[status.index] == 0}"> --%>
<!-- 								<td class="tdimg" align="center"><img class="img" src="./images/sc/NoImage.jpg"></td> -->
								<td class="tdimg" align="center"><img class="img" src="./images/sc/NoImage.jpg"></td>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<td class="tdimg" align="center">${test123[status.index]}</td> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
						<input type="hidden" class="productName" name="productName" value="${cartList.productName}">
						<td class="tp">${cartList.productName}</td>
						<input type="hidden" class="price" name="price" value="${cartList.price}">
						<td class="tdalign">${cartList.price}</td>
						<td>
							<button type="button" class="minus">－</button>
							<input type="number" class="number"  size="5" min="1" max="99" name="number" value="${cartList.number}">
							<button type="button" class="plus">＋</button>
						</td>
						<td class="tdB"><button class="delete"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					</c:forEach>					
					</tbody>
				</table>
				</div>
				<div style="float: left;">
                    <p>目前持有 <span id="nowPoint" style="color:rgb(0, 191, 255);font-size: 20px;">${havePoint}</span> 點</p>
                	<input type="radio" id="usePoint" value="0">使用點數折抵(1點=1元)
                    <div id="discountDiv" style="display: none;">
                        <input type="radio" name="discount" value="20">20點
                        <input type="radio" name="discount" value="50">50點
                        <input type="radio" name="discount" value="100">100點
                        <input type="radio" name="discount" value="200">200點
                        <input type="radio" name="discount" value="500">500點
                    </div>
                </div>
				<table class="tap2">
					<tr>
						<th class="ap">總金額(NT$)</th>
						<input type="hidden" id="amount" name="amount" value="">
						<th class="ap"><span id="apa"></span></th>
						<th class="ap">點數</th>
						<input type="hidden" id="point" name="point" value="">
						<th class="ap"><span id="app"></span></th>
					</tr>
                    <tr id="trDis" style="display: none;">
                        <th class="ap">(折扣)</th>
                        <input type="hidden" id="disAmount" name="disAmount" value="">
                        <th class="ap" id="disa"></th>
                        <input type="hidden" id="disPoint" name="disPoint" value="">
                        <th class="ap"></th>
                        <th class="ap" id="disp"></th>
                    </tr>
				</table>
		</form>
		<div class="confirm">
				<button id="updata">
					<i class="fas fa-edit">確認訂單內容</i>
				</button>
				<button id="pay" disabled>
					<i class="fas fa-shopping-basket">付款</i>
				</button>
		</div>
		</div>
		<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="<c:url value='/js/cart.js' />"></script>
		</body>

</html>