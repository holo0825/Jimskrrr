<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚點時刻 賣家首頁</title>
</head>
<body>
    <div style="text-align: center">
        <h1>歡迎回到賣家平台</h1>
        <b>${seller.fullname} | ${seller.email}</b>
        <br><br>
<!--         <a href="Sellerlogout">Logout</a> -->
        <a href=".\Sellerlogout">Logout</a>
        <!-- Spring Security新增，必須加入才會登出 -->
        <form action="/logout" method="post">
		   <input type="hidden"
		    name="${_csrf.parameterName}"
		    value="${_csrf.token}"/>
		  	<input type="submit" value="Logout">
		 </form>
        <a href="./SellerMain">團購</a>
        <a href="./top">餐廳</a>

		
    </div>
    
    <!-- 
    <%
	if(session.getAttribute("seller") == null) {
	    out.println("<script>");
	    out.println("alert('權限不足，請先登入');");
// 	    out.println("window.location.href='index.jsp';");
	    out.println("window.location.href='./index';");
	    out.println("</script>");
	}
	if(session.getAttribute("seller") != null) {
	    out.println("<script>");
	    out.println("alert('歡迎回到管理員平台');");
	    //out.println("window.location.href='sellerCenter.jsp';");
	    out.println("</script>");
	}
	%>
	 -->
	
</body>
</html>