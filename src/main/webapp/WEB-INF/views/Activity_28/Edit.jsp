<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Edit</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
	body{
		background-color:#f8f9fe;
	}
</style>
<body>

	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: #343957">
	<div>
		<a class="navbar-brand"> 修改 </a>
	</div>

	<ul class="navbar-nav">
		<li><a href="<%=request.getContextPath()%>/list" class="nav-link"></a></li>
	</ul>
	</nav> </header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form:form action="${pageContext.request.contextPath}/activityUpdate" enctype="multipart/form-data"
					onsubmit="return checkStyle()" method="post" modelAttribute="activity">
					<fieldset class="form-group">
						<form:hidden path="id" />
					</fieldset>
					<fieldset class="form-group">
						<label>帳號</label> 
						<form:input class="form-control" path="username" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>Email</label> 
						<form:input type="email" class="form-control" path="s_email" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>活動主題</label> 
						<form:input class="form-control" path="topic" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label class="t1 ">類型<span class="mi">*</span></label></br> <label>
							<form:checkbox path="styles" value="體驗"/>體驗
						</label> <label> <form:checkbox path="styles" value="宣傳活動"/>宣傳活動
						</label> <label> <form:checkbox path="styles" value="比賽"/>比賽
						</label>
					</fieldset>

					<fieldset class="form-group">
						<label>活動地點</label> 
						<form:input class="form-control" path="address" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>參與費用</label> 
						<form:input class="form-control" path="cost" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>相關連結</label> 
						<form:input type="text" class="form-control" path="link"/>
					</fieldset>

					<fieldset class="form-group">
						<label>活動介紹</label> 
						<form:input class="form-control" path="introduce" rows="3" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>活動名額</label> 
						<form:input class="form-control" path="quota" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>活動行程</label>
						<p>開始時間-結束時間：</p>
						<form:input type="text" class="form-control datepicker" path="startTime" required="required"/> - 
						<form:input type="text" class="form-control datepicker" path="endTime" required="required"/> 
					</fieldset>
					
					<div class="form-group">
						<label class="t1 ">圖片</label><br>
						<input type="file" name="image"/>
					</div>

					<fieldset class="form-group">
						<label>注意事項</label> 
						<form:input class="form-control" path="notice" rows="3" required="required"/>
					</fieldset>

					<fieldset class="form-group">
						<label>點數</label> 
						<form:input class="form-control" path="bonus_point" required="required"/>
					</fieldset>
					
					<button type="submit" name="edit" class="btn btn-primary">確認送出</button>
					<button type="button" class="btn btn-primary" value="返回" onclick="window.history.go(-1); return false;">返回</button>
				</form:form>
				
			</div>
		</div>
	</div>

</body>
<script>
  	$('.datepicker').datepicker({
    	format: "yyyy/mm/dd",
    	autoclose: true,
    	startDate: "today",
    	clearBtn: true,
    	calendarWeeks: true,
    	todayHighlight: true,
    	language: 'zh-TW'
	});
  	
  	function checkStyle() {
  		var styleCount = $('input:checkbox:checked').length;
  		if(styleCount == 0) {
  			alert("請選擇類型")
  			return false;
  		}
  		
  		return true;
  	}
</script>
</html>