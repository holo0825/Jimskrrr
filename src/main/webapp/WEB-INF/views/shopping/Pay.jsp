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
    <link rel="stylesheet" href="<c:url value='/css/link.css' />">
    <style>
        .box{
            height: 75px;
            text-align: center;
        }
        p{
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>付款/刪除成功</h1>
    </header>
    <div id="container">
        <div class="box"><button id="back"><i class="fas fa-undo-alt"></i>按此回首頁</button></div>
        <p>(3秒後自動換頁)</p>
    </div>
</body>
<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
<script>
    $(function(){
        $('#back').on('click',function(){
            location.href = './Customer'
        })

        setTimeout(function(){
            window.location.href ="<c:url value='/Customer' />"
        },3000)
    })
</script>
</html>