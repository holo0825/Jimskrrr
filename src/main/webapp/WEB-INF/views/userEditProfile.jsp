<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>聚點時刻 買家首頁</title>
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="./css/registerStyle.css" type="text/css" />
</head>
<body>
    <%
	if(session.getAttribute("user") == null) {
	    out.println("<script>");
	    out.println("alert('權限不足，請先登入');");
// 	    out.println("window.location.href='index.jsp';");
	    out.println("window.location.href='./UserTryLogin';");
	    out.println("</script>");
	}/*
	if(session.getAttribute("user") != null) {
	    out.println("<script>");
	    out.println("alert('歡迎回到買家用戶平台');");
	    //out.println("window.location.href='sellerCenter.jsp';");
	    out.println("</script>");
	}*/
	%>
    <div style="text-align: center">
    	<br>
        <h1>編輯買家個人檔案</h1>
        <b>${user.fullname} | ${user.email}</b>
        <br><br>
<!--         <a href="Userlogout">Logout</a> -->
        <input type="button" id='backToUserDash' class="btn btn-primary" value='回到個人首頁'> &nbsp;&nbsp;
		<a href=".\index" class="btn btn-secondary">首頁</a> &nbsp;&nbsp;
        <a href=".\Userlogout" class="btn btn-danger">登出</a> &nbsp;&nbsp;
        <a href="./Customer" class="btn btn-info">團購</a> &nbsp;&nbsp;
        <a href="./top" class="btn btn-info">餐廳</a>
        <!-- 
        <a href="userUpdate.jsp">編輯買家個人資料</a>
         -->
    </div>
    
    <!-- 
	
		 <h1>買家用戶註冊</h1>
	<hr>
<!-- 	<a href="index.jsp">首頁</a> -->
	<hr>
<!-- 	<form method="post" action=".\Register?action=insertUser"> -->
	<form method="get" action="./UpdateUserProfile" onsubmit="return confirm('請確認是否變更個人資料');">
        <fieldset>
            <legend>買家資料一<span id="must">*<em>(必填)</em></span></legend>
            <!--語意標籤<em>會讓文字便鞋體，但不同於font-family屬性的效果-->
            <div class="st1">
            		<input type="text" id="id1"
                    name="id" required="required" autocomplete="off" hidden="hiddren"
                    value="<c:out value='${user.id}'/>">
            </div>
            <div class="st1">
                <label for="username1" class="t1"><span id="must">*</span>帳號：</label><input type="text" id="username1"
                    name="username" required="required" autocomplete="off" size=20 readonly="readonly" 
                    value="<c:out value='${user.username}'/>">
            </div>
            <div class="st1">
                <label for="password1" class="t1"><span id="must">*</span>密碼：</label><input type="password"
                    id="password1" name="password" required="required" maxlength="20" autocomplete="off" autofocus
                    value="<c:out value='${user.password}'/>">
            </div>
            <div class="st1">
                <label for="fullname1" class="t1"><span id="must">*</span>姓名：</label><input type="text" id="fullname1"
                    name="fullname" placeholder="李小龍" autocomplete="off" size=10 maxlength="10" required="required"
                    value="<c:out value='${user.fullname}'/>">
            </div>
            <div class="st1">
                <label for="" class="t1"><span id="must">*</span>性別：</label>
                <c:if test="${user.gender == '男'}">
                <input type="radio" name="gender" value="男" id="m1" checked="checked"><label for="m1">男</label>
                <label>
                    <!--***新作法***將<input>元素放入<label>標籤的做法已經內含<label for="m1">對應<input id="m1">的效果-->
                    <input type="radio" name="gender" value="女">女
                </label>
                </c:if>
                <c:if test="${user.gender == '女'}">
                <input type="radio" name="gender" value="男" id="m1"><label for="m1">男</label>
                <label>
                    <!--***新作法***將<input>元素放入<label>標籤的做法已經內含<label for="m1">對應<input id="m1">的效果-->
                    <input type="radio" name="gender" value="女" checked="checked">女
                </label>
                </c:if>
            </div>
            <div class="st1">
                <label for="" class="t1"><span id="must">*</span>生日：</label>
                <input type="date" id="datefield" name="dob" min="1900-01-01" max="2050-12-31" maxlength="10" required="required" autocomplete="off"
                value="<c:out value='${user.dob}'/>">
            </div>
            <div class="st1">
                <label for="" class="t1"><span id="must">*</span>Email：</label>
                <input type="email" name="email" required="required" maxlength="50" autocomplete="off"
                value="<c:out value='${user.email}'/>">
            </div>
            <div class="st1">
                <label for="phoneNumber1" class="t1"><span id="must">*</span>手機號碼：</label><input type="text"
                    id="phoneNumber1" name="phoneNumber" placeholder="0988888888" required="required" maxlength="10"
                    autocomplete="off" size=10 
                    value="<c:out value='${user.phoneNumber}' />">
            </div>
            <div class="st1">
                <label for="homeNumber1" class="t1">住家電話：</label><input type="text"
                    id="homeNumber1" name="homeNumber" placeholder="0288888888" maxlength="10" 
                    autocomplete="off" size=10 
                    value="<c:out value='${user.homeNumber}'/>">
            </div>
            <div class="st1">
                <label for="bonusPoint1" class="t1">紅利點數：</label><input type="text"
                    id="bonusPoint1" name="bonusPoint" placeholder="" maxlength="10" 
                    autocomplete="off" size=10 disabled="disabled"
                    value="<c:out value='${user.bonusPoint}'/>">
            </div>
            <!-- <div class="st1">
            <label for="" class="t1">身分證字號：</label>
            <input type="text" name="idcode" maxlength="10" pattern="[a-z,A-Z]{1}[1-2,8-9]{1}\d{8}">
        </div> -->
        </fieldset>
        <fieldset>
            <legend>買家資料上傳</legend>
            <div class="st1">
                <label for="" class="t1">個人大頭貼：</label>
                <input type="file" name="file1" accept=".jpg">
                <br>
                <span style="margin: 20px; text-decoration: underline;"><b>(JPG格式)</b></span>
            </div>
        </fieldset>
        <span style="color: red; font-weight: bold;">

		</span>
	    <br>
        <div class="sub">
        <input type="button" id='back' class="btn btn-secondary" value='回到上一頁'> &nbsp;&nbsp;
            <input type="submit" class="btn btn-success" value="送出"> &nbsp;&nbsp;
            <input type="reset" id="reset" class="btn btn-danger" value="清除">
            <!-- <input type="reset" value="清除" disabled> -->
        </div>
    </form>
    <script>
		//回上一頁按鈕的JavaScript事件function()
		document.getElementById('back').onclick = function () {
            window.history.back();
        };
		//回上買家個人首頁按鈕的JavaScript事件function()
		document.getElementById('backToUserDash').onclick = function () {
            window.history.back();
        };
		//確認是否清除的JavaScript事件function()
		document.getElementById('reset').onclick = function () {
            return confirm("請確認是否清除資料");
        };
		    	
		// 設定date的max屬性為today
		/*
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
	
		if (dd < 10) {
		   dd = '0' + dd;
		}
	
		if (mm < 10) {
		   mm = '0' + mm;
		} 
		    
		today = yyyy + '-' + mm + '-' + dd;
		
		document.getElementById("datefield").setAttribute("max", today);
		*/
		
		// maxDate計算生日對應年紀為18歲以上
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear()-18;
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 

		maxDate = yyyy+'-'+mm+'-'+dd;
		document.getElementById("datefield").setAttribute("max", maxDate);

		// minDate計算生日對應年紀為18歲以上
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear()-100;
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 

		minDate = yyyy+'-'+mm+'-'+dd;
		document.getElementById("datefield").setAttribute("min", minDate);
	</script>
	
</body>
</html>