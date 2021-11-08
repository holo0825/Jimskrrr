<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href="<c:url value='/css/yu.css' />"
	type="text/css" />
    <title>New A Restaurant</title>
</head>

<body>
    <header>
        <h1>更新餐廳資料</h1>
    </header>
    <form:form action="./ManageRestaurant" method='GET' modelAttribute="restaurantBean" class='form-horizontal'
			enctype="multipart/form-data" >
        <br>
 
        <fieldset>
            <legend>基本資料<em>(必填)</em></legend>

            <!-- restaurant縮寫rst -->
            <div class="st1">
                <label for="username">經營者姓名：</label>
                <input type="text" id="username" value="" size="10" name="name">         
            </div>

            <div class="st1">
                <label for="">經營者電話：</label>
                <input type="text" id="mobile" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=12 name="mobile"></input>
            </div>

            <div class="st1">
                <label for="rstname">餐廳名稱：</label>
                <input type="text" id="rstname" value="" size="10" name="rstname">
            </div>
 
            <div class="st1">
                <label for="license">證照號碼：</label>
                <input type="text" id="license" value="" size="20" name="license">
             </div> 

            <div class="st1">
                <label for="rstaddress">餐廳地址：</label>
                <input type="text" id="rstaddress" value="" size="50" name="rstaddress" >
            </div>

            <div class="st1">
                <label for="">餐廳電話：</label>
                <input type="text" id="telephone" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength=12 name="rsttel"></input>
            </div>

            <div class="st1">
                <label for="">餐廳類型：</label>
                <input type="text" id="type" value="" size=20 name="type">
                <span class="ps">(日式、中式、義式、韓式、台式、美式...etc.)</span>
            </div>

            <div class="st1">
                <label for="">營業時間<span class="ps">(請以24小時制填寫)：</span></label>
                <input type="text" id="businesshour" value="" size="20" name="businesshour">
                
                
            </div>



        </fieldset>
        
        <div class="sub">
        	<input type="submit" name="submit" value="更新"> 
        </div>
    	</form:form>


</body>
</html>