<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<meta charset="UTF-8">
<title>文章列表</title>
</head>
<body>

	<div align='center'>
		<h3>文章列表</h3>
		<hr>
		<table border='1' class='table'>
			<tr>
				<th scope="col" width='60'>username</th>
				<th scope="col" width='160'>標題</th>
				<th scope="col" width='60'>發布時間</th>
				<th scope="col" width='60'>編輯</th>
			</tr>
			<c:choose>
				<c:when test="${not empty articleBeanList}">
					<c:forEach var='article' items="${articleBeanList}">
						<tr>
							<td>${article.username}</td>
							<td><a href="<c:url value='ShowOneArticle?id=${article.id}'/>">${article.title}</a></td>
								<td>${article.registerTime}</td>
						<td><a
								href='articles/${article.id}'><i class="fas fa-edit"></i></a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				查無文章資料
			</c:otherwise>
			</c:choose>
		</table>
		<br> <a href="<c:url value='/' />">回前頁</a>
		<br>		
		<br> <a href="<c:url value='insertArticle' />">新增貼文</a>
	</div>
	
</body>
</html>