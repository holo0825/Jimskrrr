<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚點時刻</title>
    <style>
        .box {
            width: 300px;
            margin: 20px auto;
            border: 2px solid gray;
            padding: 10px;
        }
       .box2{
       		width: 900px;
       	}
       .box3{
       		float : left;
       		margin-right : 20px
       	}
    </style>
</head>

<body>
	
    	<h2 style="text-align: center;">
    	<c:choose>
    	<c:when test="${not empty admin}">
    		管理者 : ${admin}
    	</c:when>
    	<c:when test="${not empty user}">
    		消費者 : ${user}
    	</c:when>
    	<c:otherwise>
    		訪客
    	</c:otherwise>
    	</c:choose>
    	
    	</h2>
    
	<div class="box" style="text-align: right;">
    	<a href="<c:url value='/testUser' />">登入</a>
    	<a href="<c:url value='/testRemove' />">登出</a>
    </div>
	<div class="box" style="text-align: center;">
    	<a href="<c:url value='/Adminstatistics.cart' />">統計Cart</a>
    	<a href="<c:url value='/Adminstatistics.list' />">統計List</a>
    	<a href="<c:url value='/AdminCart' />">管理者看訂單</a>
    </div>
    <div class="box" style="text-align: center;">
   		<a href="<c:url value='/TwoCart' />">現在</a>
    	<a href="<c:url value='/AllCarts' />">歷史</a>
    </div>
    <div class="box box2">
   		<div class="box3">
        <form action="./CartListNew" method="GET">
            <div> <label for="">產品名稱</label>
                <input type="text" name="productName" value="奶茶">
            </div>
            <div>
                <label for="">價格</label>
                <input type="number" name="price" value="55">
            </div>
            <div>
                <label for="">數量</label>
                <input type="number" name="number" value="7">
            </div>
           		<label for="">類別</label>
                <input type="text" name="type" value="food" readonly>
            <input type="submit" name="sumbit" value="送出">
    	</form>
    	</div>
    	<div class="box3">
        <form action="./CartListNew" method="GET">
            <div> <label for="">產品名稱</label>
                <input type="text" name="productName" value="紅茶">
            </div>
            <div>
                <label for="">價格</label>
                <input type="number" name="price" value="25">
            </div>
            <div>
                <label for="">數量</label>
                <input type="number" name="number" value="11">
            </div>
           		<label for="">類別</label>
                <input type="text" name="type" value="food" readonly>
            <input type="submit" name="sumbit" value="送出">
    	</form>
    	</div>
    	<div class="">
        <form action="./CartListNew" method="GET">
            <div> <label for="">產品名稱</label>
                <input type="text" name="productName" value="白開水">
            </div>
            <div>
                <label for="">價格</label>
                <input type="number" name="price" value="110">
            </div>
            <div>
                <label for="">數量</label>
                <input type="number" name="number" value="1">
            </div>
           		<label for="">類別</label>
                <input type="text" name="type" value="food" readonly>
            <input type="submit" name="sumbit" value="送出">
    	</form>
    	</div>
    </div>
    <div class="box box2">
    	<div class="box3">
        <form action="./CartListNew" method="GET">
            <div> <label for="">產品名稱</label>
                <input type="text" name="productName" value="餐券01">
            </div>
            <div>
                <label for="">價格</label>
                <input type="number" name="price" value="250">
            </div>
            <div>
                <label for="">數量</label>
                <input type="number" name="number" value="7">
            </div>
           		<label for="">類別</label>
                <input type="text" name="type" value="coupon" readonly>
            <input type="submit" name="sumbit" value="送出">
    	</form>
    	</div>
    	<div class="box3">
        <form action="./CartListNew" method="GET">
            <div> <label for="">產品名稱</label>
                <input type="text" name="productName" value="三倍券">
            </div>
            <div>
                <label for="">價格</label>
                <input type="number" name="price" value="3000">
            </div>
            <div>
                <label for="">數量</label>
                <input type="number" name="number" value="1">
            </div>
           		<label for="">類別</label>
                <input type="text" name="type" value="coupon" readonly>
            <input type="submit" name="sumbit" value="送出">
    	</form>
    	</div>
    	<div class="">
        <form action="./CartListNew" method="GET">
            <div> <label for="">產品名稱</label>
                <input type="text" name="productName" value="消費券">
            </div>
            <div>
                <label for="">價格</label>
                <input type="number" name="price" value="750">
            </div>
            <div>
                <label for="">數量</label>
                <input type="number" name="number" value="3">
            </div>
           		<label for="">類別</label>
                <input type="text" name="type" value="coupon" readonly>
            <input type="submit" name="sumbit" value="送出">
    	</form>
    	</div>
    </div>
</body>

</html>