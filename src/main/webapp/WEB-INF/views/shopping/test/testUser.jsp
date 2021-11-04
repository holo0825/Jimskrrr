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
        .box{
            width: 300px;
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="box">
        <form action="./testLoginUser" method="GET">
            <div>
                <label>帳號(消費者)</label>
                <input type="text" name="username" value="Apple">
            </div>
            <div>
                <input type="submit" value="送出">
            </div>
        </form>
        <hr>
        <form action="./testLoginAdmin" method="GET">
            <div>
                <label>帳號(管理者)</label>
                <input type="text" name="username" value="Admin">
            </div>
            <div>
                <input type="submit" value="送出">
            </div>
        </form>
    </div>
</body>
</html>