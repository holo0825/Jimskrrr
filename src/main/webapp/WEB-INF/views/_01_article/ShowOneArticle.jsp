<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>文章</title>
</head>
<body>

	<div align='center'>
	
		<h3>${article.title}</h3>
		<hr>
		<table border='1' class='table'>
			<tr>
				<th scope="col" width='60'>username</th>
				<th scope="col" width='60'>標題</th>
				<th scope="col" width='160'>內容</th>
				<th scope="col" width='60'>發布時間</th>
				<th scope="col" width='60'>編輯</th>
			</tr>
						<tr>
							<td>${article.username}</td>
							<td>${article.title}</td>
							<td>${article.content}</td>
							<td>${article.registerTime}</td>
							<td><a href='articles/${article.id}'><i class="fas fa-edit"></i></a></td>
						</tr>
		</table>
		<br> <a href="<c:url value='/_01_article/ShowArticles' />">回前頁</a>

	</div>

</body>
</html>