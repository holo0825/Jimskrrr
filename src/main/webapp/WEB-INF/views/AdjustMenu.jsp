<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta "Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>餐點編輯管理</title>
<link rel='stylesheet' href="<c:url value='/css/yu.css' />"
	type="text/css" />
</head>
<style>
#proimg {
	width: 150px;
	height: 150px;
	/* position: absolute; */
	/* float: left; */
}

table {
	margin: auto;
}

td, th {
	/* 兩個不同的標籤有相同的屬性 */
	border: 2px solid gray;
	/* 框粗細 */
}
</style>
</head>

<body>
	<header>
	<h1>更新菜單</h1>
	</header>
	<div>
		<form:form action="./doupdate" method='GET' modelAttribute="menuBean" class='form-horizontal'
			enctype="multipart/form-data" >
			<br>

			<fieldset>
				<legend>菜單 Menu</legend>
				<div class="st1">
					<label for="productName" class="t1">* 品名：</label> 
					<input type="text" id="productName" name="productName" value="${menu.productName}" size="20"> 
					<span id="pronamesp"></span> 
					<span class="ps">(必填！)</span>
				</div>

<!--  				<div class="st1"> -->
<!--                  <label class="t1">照片:</label> --> -->
<!--                  <input type="file" accept="image/*" value="" -->
<!-- 						 id="dishImage" name="dishImage">  -->
<!--            		</div>  -->

				<div class="st1">
					<label for="remark" class="t1">菜色描述： </label>
					<textarea name="remark" id="remark" cols="40" rows="5">${menu.remark}</textarea>
				</div>

				<div class="st1">
					<span id="pricesp">$NTD</span>
					<label for="price" class="t1">*單價： </label> 
						<input type="text" id="price" name="price" value="${menu.price}">
				</div>
				
			</fieldset>

			<table>
				<thead>
				
				</thead>

				<tbody>
					
				</tbody>
			</table>

			<div class="sub">
				<input type="submit" name="submit" value="更新"> 
				<input type="reset" value="清除">
			</div>
		</form:form>

	</div>

</body>

</html>

