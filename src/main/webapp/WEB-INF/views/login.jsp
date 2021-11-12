<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%-- 	<jsp:include page="fragments.jsp" /> --%>
	<meta charset="UTF-8">
	<title>----------- [[${pageTitle}]] -----------</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	

	<script>
		// 管理者登入一鍵輸入
		function quickInput(){
			document.getElementById('username').value = 'Albert'
			document.getElementById('password').value = 'Helloworld123';
		}
	</script>
</head>
<body>
<div class="container text-center">
	<div>
		<h2>會員登入</h2>
		<br/>
	</div>
	<div>
		<!-- OAuth2 Google登入連結 -->
		<h4><a href="/oauth2/authorization/google">第三方Google驗證登入</a></h4>	
	</div>
	<div><p>OR</p></div>
		
	<form action="/login" method="POST" style="max-width: 400px; margin: 0 auto;">
	<div class="border border-secondary rounded p-3">
		<div>
			<c:if test="${param.error}">
				<p class="text-danger">Invalid username or password.</p>
			</c:if>
		</div>
		<div>
			<c:if test="${param.logout}">
			<p class="text-warning">You have been logged out.</p>
			</c:if>
		</div>
		<div>
			<p><input type="text" id="username" name="username" required class="form-control" placeholder="username" /></p>	
		</div>
		<div>
			<p><input type="password" id="password" name="password" required class="form-control" placeholder="password" /></p>
		</div>
		<div>
			<p><input type="submit" value="Login" class="btn btn-primary" /></p>
		</div>
	</div>
	<div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="button" class="btn btn-info" value="管理員一鍵輸入" onclick='quickInput();'>
	</div>
	</form>
	</div>
</body>
</html>