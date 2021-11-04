<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='<spring:url value='/' />/css/styles.css' type="text/css" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>編輯文章</title>
<script type="text/javascript">
  function confirmDelete(id){
	  var result = confirm("確定刪除此筆記錄(帳號:" + id.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.name = "_method";
		  document.forms[0].putOrDelete.value = "DELETE";
		  document.forms[0].action = "<c:url value='/_01_article/articles/" + id + "' />";
	      return true;
	  }
	  return false;
  }
  function confirmUpdate(id){
	  document.forms[0].putOrDelete.name = "_method";
	  document.forms[0].putOrDelete.value = "PUT";
	  document.forms[0].action = "<c:url value='/_01_article/articles/" + id + "' />";
	  return true;
  }
</script>

</head>
<body>
	<div align="center">
		<form:form method='POST' modelAttribute="articleBean" >
			
			<input type="hidden" name="_method"  id='putOrDelete'   value="DELETE" >
    		<c:if test='${articleBean.id != null}'>
               <form:hidden path="id" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>編輯文章</legend>
				<table>
					<tr>
						<td align='right'>標題：<br>&nbsp;</td>
						<td width='400'><form:input path="title" size="25" class="form-control" id="exampleFormControlInput1"/><br>&nbsp;
							<form:errors path="title" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>username：<br>&nbsp;
						</td>
						<td><form:input  path="username" size="25" class="form-control" id="exampleFormControlInput1" /><br>&nbsp;
						    <form:errors path="username" cssClass="error" />
						</td>
					</tr>
					
					<tr>
						<td align='right'>內容：<br>&nbsp;
						</td>
						<td><form:textarea path="content" size="30" class="form-control" id="exampleFormControlTextarea1" rows="3"/><br>&nbsp;
						    <form:errors path="content" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>分類:<br>&nbsp;
						</td>
						<td>
               				 <input type="radio" name="category" id="category1" value="中式" checked>中式
               				 <input type="radio" name="category" id="category2" value="義式">義式
               				 <input type="radio" name="category" id="category3" value="火鍋">火鍋
               				 <input type="radio" name="category" id="category4" value="牛排">牛排
               				 <input type="radio" name="category" id="category6" value="速食">速食<br>
               				 <input type="radio" name="category" id="category5" value="飲料冰品">飲料冰品
                				<input type="radio" name="category" id="category7" value="其他">其他
          			  </td>
					</tr>
					
					
					<tr>
						<td colspan='2' align='center'>
							<input type='submit' value='修改' name='updateBtn' onclick="return confirmUpdate('${articleBean.id}');">&nbsp; 	
							<input type='submit' value='刪除' name='deleteBtn' onclick="return confirmDelete('${articleBean.id}');" >
						</td>
					</tr>

				</table>
			</fieldset>
		</form:form>
		<a href="<c:url value='/_01_article/ShowArticles' />">回首頁</a>
	</div>
</body>
</html>