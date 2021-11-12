<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>seller</title>
    <link rel="stylesheet" href="<c:url value="/css/style06.css"/>">
    <style>
        legend {
            margin-left: 50px;
        }

        fieldset {
            width: 500px;
            margin: 15px;
            border: 1px solid yellowgreen;
            border-radius: 20px;
        }

        .div {
            width: 450px;
            border-bottom: 3px dashed gray;
            margin: 20px;
            padding-bottom: 10px;
        }

        .sub {
            text-align: center;
            border-bottom: 0;
        }

        .t1 {
            width: 100px;
            float: left;
            text-align: right;
        }
    </style>
</head>

<body>
    <header>
        <h1>seller</h1>
    </header>
   
    <form:form action="${pageContext.request.contextPath}/sellerForm" method="post" enctype="multipart/form-data" modelAttribute="product">
        <fieldset>
            <legend>商品上架<em>(必填)</em></legend>
            <div class="div">
                <label for="name" class="t1">名稱:</label><form:input type="text" id="name" path="name" size="10"/>
            </div>
            <div class="div">
                <label for="price" class="t1">價格:</label><form:input type="text" id="price" path="price" size="10" />
            </div>
            <div class="div">
                <label for="people" class="t1">人數:</label><form:input type="text" id="people" path="people" size="3"/>
            </div>
            <div class="div">
                <label for="date" class="t1">截止日:</label><form:input type="date" id="date" path="date"/>
            </div>
            <div class="div">
                <label class="t1">照片</label><form:input type="file" path="productImage" accept="image/*"/>
            </div>
            <div>
            <label class="t1">簡介:</label>
				<form:textarea  path="introduceProduct" required="required"></form:textarea>
			 </div>
            <div class="sub">
                <input type="submit" name="INSERT" value="送出"><input type="reset" value="清除">
            </div>
            
        </fieldset>
    </form:form>
     <a href="<c:url value='/SellerMain' />">賣家主畫面</a>
     <a href="<c:url value='/SellerUpdate' />">賣家修改</a>
    
   
</body>

</html>