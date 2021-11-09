<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

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
<title>新增活動</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<!-- 第一次更新 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
   <!-- sweetalert jquery -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <!-- 後台 -->
	<link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
</head>
<style>
body {
	background-color: #f8f9fe;
	font-family: 'Roboto', sans-serif;
   	margin-left: 190px;

}

.st01 {
	width: 1050px;
	/* min-height: calc(100vh - 100px); */
	height: 1700px;
	margin: 20px auto 30px;
	background-color: rgb(228, 231, 236);
	padding: 100px 0 46px;
}

.st02 {
	padding-top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.st1 {
	width: 450px;
	border-bottom: 3px dashed rgb(236, 211, 211);
	margin: 20px;
	padding-bottom: 10px;
}

.t1 {
	width: 150px;
	float: left;
	text-align: left;
}

.mi {
	color: red;
}

.hint {
	text-align: center;
	color: grey;
	font-size: 50%;
	margin-left: 60px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	font-size: 10px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #3f18cf;
	border: none;
	border-radius: 10px;
	box-shadow: 0 5px #999;
	margin-left: 50px;
}

.btn:hover {
	background-color: #2e7fdb
}

.btn:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

.btn1 {
	display: inline-block;
	padding: 10px 20px;
	font-size: 10px;
	text-align: center;
	text-decoration: none;
	color: #fff;
	background-color: #3f18cf;
	border: none;
	border-radius: 10px;
	margin-left: 50px;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 14px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}

/*更改*/
	.table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
            min-width: 100%;
        }

            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }

        .search-box {
            position: relative;
            float: right;
        }

            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }

                .search-box input:focus {
                    border-color: #3FBAE4;
                }

            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child {
            width: 130px;
        }

        table.table td a {
            color: #a0a5b1;
            display: inline-block;
            margin: 0 5px;
        }

            table.table td a.view {
                color: #03A9F4;
            }

            table.table td a.edit {
                color: #FFC107;
            }

            table.table td a.delete {
                color: #E34724;
            }

        table.table td i {
            font-size: 19px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }

                .pagination li a:hover {
                    color: #666;
                }

            .pagination li.active a {
                background: #03A9F4;
            }

                .pagination li.active a:hover {
                    background: #0397d6;
                }

            .pagination li.disabled i {
                color: #ccc;
            }

            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }

        .hint-text {
            float: left;
            margin-top: 6px;
            font-size: 95%;
        }

        .bt1 {
            padding-right: 0px;
            padding-left: 0px;
            padding-top: 0px;
            padding-bottom: 3px;
            border-top-width: 0px;
            border-bottom-width: 0px;
            border-right-width: 0px;
        }
   .container, .container-lg, .container-md, .container-sm, .container-xl {
   			max-width:1300px;
   }
   
   /*後台*/
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #343957;
  overflow-x: hidden;
  padding-top: 70px;
}

.sidenav a {
  padding: 10px 1px 16px 26px;
  text-decoration: none;
  font-size: 15px;
  color: #bdbdc7;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 16px;}
}
/*color change*/
    .licolor{
        	
       background-color:;
     }
    .licolor:hover{
       
       background-color:#6b51df;
     }
</style>
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
  	//Search
  	$(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
        
        (function(document) {
        	  'use strict';

        	  // 建立 LightTableFilter
        	  var LightTableFilter = (function(Arr) {

        	    var _input;

        	    // 資料輸入事件處理函數
        	    function _onInputEvent(e) {
        	      _input = e.target;
        	      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
        	      Arr.forEach.call(tables, function(table) {
        	        Arr.forEach.call(table.tBodies, function(tbody) {
        	          Arr.forEach.call(tbody.rows, _filter);
        	        });
        	      });
        	    }

        	    // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
        	    function _filter(row) {
        	      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
        	      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
        	    }

        	    return {
        	      // 初始化函數
        	      init: function() {
        	        var inputs = document.getElementsByClassName('light-table-filter');
        	        Arr.forEach.call(inputs, function(input) {
        	          input.oninput = _onInputEvent;
        	        });
        	      }
        	    };
        	  })(Array.prototype);

        	  // 網頁載入完成後，啟動 LightTableFilter
        	  document.addEventListener('readystatechange', function() {
        	    if (document.readyState === 'complete') {
        	      LightTableFilter.init();
        	    }
        	  });

        	})(document);
      //一鍵輸入
        let no = 1000;
        let index = 0;
        
        var nameid= ["a2152265"];
        var email= ["a2152265@gmail.com"];
        var topic= ["手作PIZZA｜廚藝｜教室｜料理｜"];
        var address= ["台灣高雄市鳳山區文衡路451號2樓"];
        var cost= ["200"];
        var link= ["汎桌官方粉絲團"];
        var introduce= ["繼上回的蔬食pizza廣受好評，大家敲碗想再上肉食pizza，除了經典培根芝麻葉披薩，還有多種肉食口味等你來品嚐！"
        	+ "課中可實際操作揉製一個麵皮，並製作一個指定口味，還能享用到老師的示範披薩！好吃又好玩的課程，等你來體驗！【肉食系!手作PIZZA】"];
        var quota= ["100"];
        var startTime= ["2021/12/12 9:00 "];
        var endTime= ["2021/12/12 16:00 "];
        var notice= ["主辦單位承諾提供酒精消毒手部、量測體溫及配戴口罩的措施，為參加者的報到狀況造冊記錄，並禁止體溫超過37.5者入場。"];
        var bonus_point= ["1"];
        
        function quickInput(){
         document.getElementById('nameid').value = nameid[index];
         document.getElementById('email').value = email[index];
         document.getElementById('topic').value = topic[index];
         document.getElementById('address').value = address[index];
         document.getElementById('cost').value = cost[index];
         document.getElementById('link').value = link[index];
         document.getElementById('introduce').value = introduce[index];
         document.getElementById('quota').value = quota[index];
         document.getElementById('startTime').value = startTime[index];
         document.getElementById('endTime').value = endTime[index];
         document.getElementById('notice').value = notice[index];
         document.getElementById('bonus_point').value = bonus_point[index];
         
         index++;
            if (index >= nameid.length) {
             index = 0 ;
         }
         
        }
    
    //check
//     function myFunction() {
//     	Swal.fire({
//   		  position: 'center',
//   		  icon: '',
//   		  title: '您已經新增完成活動',
//   		  showConfirmButton: false,
//   		  timer: 3000
//   		})
//     	}
	//後台


</script>
	
</script>
<body>

	<div class="sidenav">
	  <div>
	  	
	  </div>
	  <ul class="list-unstyled components ">
                <li class="active licolor">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="icon icon-single-04"></i>
                        會員管理
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">Home 1</a>
                        </li>
                    </ul>
                </li>

                <li class="licolor">
                    <a href="#page1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="icon icon-single-04"></i>
                        餐廳管理
                    </a>
                    <ul class="collapse list-unstyled" id="page1">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                       
                    </ul>
                </li>
                <li class="licolor">
                    <a href="#page2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="icon icon-single-04"></i>
                        團購管理
                    </a>
                    <ul class="collapse list-unstyled" id="page2">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        
                    </ul>
                </li>
                <li class="licolor">
                    <a href="#page3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="icon icon-single-04"></i>
                        銷售管理
                    </a>
                    <ul class="collapse list-unstyled" id="page3">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        
                    </ul>
                </li>
                <li class="licolor">
                    <a href="#page4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="icon icon-single-04"></i>
                        活動管理
                    </a>
                    <ul class="collapse list-unstyled" id="page4">
                        <li>
                            <a href="#">活動管理 明細</a>
                        </li>
                        <li>
                            <a href="<c:url value='/RecordParticipantBack'/>">報名參加者管理 明細</a>
                        </li>
                        
                    </ul>
                </li>
                <li class="licolor">
                    <a href="#page5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="icon icon-single-04"></i>
                        討論區管理
                    </a>
                    <ul class="collapse list-unstyled" id="page5">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                       
                    </ul>
                </li>
                <li style="background-color:#1c0f54;">
                    <a href="<c:url value='/GroupOneHome' />"  >
                        <i class="icon icon-single-04"></i>
                        返回首頁
                    </a>
                   
                </li>
            </ul>
	</div>


	<form:form action="${pageContext.request.contextPath}/activityInsert" method="post" 
			onsubmit="return checkStyle()" modelAttribute="activity" enctype="multipart/form-data">
		
		<div class="col-md-12 text-center">
		
			<a value="前端" href="<c:url value='/ActivityList'/>">前端</a>
		
<%-- 		 	<a value="管理報名者頁" href="<c:url value='/RecordParticipantBack'/>">管理報名者頁</a> --%>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal" data-whatever="@getbootstrap">新增活動</button>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">開始建立活動資訊！</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<main class="st01">
						<div class="st02 ">
							<div class="form-group">
								<label class="t1">帳號<span class="mi">*</span></label> 
								<form:input type="text" id="nameid" class="form-control" path="username" required="required"/>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>
							
							<div class="form-group">
								<label class="t1">Email<span class="mi">*</span></label> 
								<form:input type="email" id="email" class="form-control" path="s_email"
									placeholder="name@example.com" required="required"/> 
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>

							<div class="form-group">
								<label class="t1">活動主題<span class="mi">*</span></label> 
								<form:input id="topic" class="form-control" path="topic" required="required"/>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>

							<div class="form-group">
								<label class="t1 ">類型<span class="mi">*</span></label><br>
								<label><form:checkbox path="styles" value="體驗"  />體驗</label>
								<label><form:checkbox path="styles" value="宣傳活動" />宣傳活動</label>
								<label><form:checkbox path="styles" value="比賽" />比賽</label>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br/>
							</div>

							<div class="form-group">
								<label class="t1 text-left">活動地點<span class="mi">*</span></label>
								<form:input type="text" id="address" class="form-control" path="address" required="required"/>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>

							<div class="form-group">
								<label class="t1">參與費用<span class="mi">*</span></label> 
								<form:input type="text" id="cost" class="form-control" path="cost" required="required"/>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>

							<div class="form-group">
								<label class="t1">相關連結</label> 
								<form:input type="text" id="link" class="form-control" path="link"/> 
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
								<small class="hint"> <加上參考網站如 Facebook 或 Instagram，讓使用者更認識你></small>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1" class="t1">活動介紹<span
									class="mi">*</span></label>
								<form:textarea id="introduce" class="form-control" path="introduce" rows="3" required="required"></form:textarea>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>

							<div class="form-group">
								<label class="t1">活動名額<span class="mi">*</span></label> 
								<form:input id="quota" type="text" class="form-control" path="quota" required="required"/> 
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br/>
							</div>

							<div class="form-group">
								<label class="t1 ">活動行程<span class="mi">*</span></label><br>
								<label class="">開始時間-結束時間：</label><br>
								<form:input id="startTime" type="text" class="form-control datepicker" path="startTime" required="required"/> - 
								<form:input id="endTime" type="text" class="form-control datepicker" path="endTime" required="required"/> 
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>
							
							<div class="form-group">
								<label class="t1 ">圖片</label><br>
								<input type="file" name="image"/>
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1" class="t1">注意事項<span
									class="mi">*</span></label>
								<form:textarea id="notice" class="form-control" path="notice" rows="3" required="required"></form:textarea>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>
							<div class="form-group">
								<label class="t1">點數<span class="mi">*</span></label> 
								<form:input type="text" id="bonus_point" class="form-control" path="bonus_point" required="required"/>
								<span style="color: black;"></span> 
								<span style="color: red;"></span><br />
							</div>
						</div>
						</main>
					</div>
					<div class="modal-footer">
						<div class="col-md-12 text-center">
							<input id="onejan" type="button" class="btn btn-outline-info" value="一鍵輸入活動"  onclick='quickInput();' >
							<button type="submit" name="submit" onclick="myFunction()" class="btn btn-primary check">提交表單</button>
							
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	
	

	<div class="container-xl" >
		<div class="table-responsive" >
			<div class="table-wrapper" >
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8"><h2>活動管理 <b>明細</b></h2></div>
						<div class="col-sm-4">
							<div class="search-box">
							
								<i class="material-icons">&#xE8B6;</i>
								<input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入關鍵字">

							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover table-bordered order-table">
					<thead>	
                        <tr>
                            <th>舉辦活動序號</th>
                            <th >廠商帳號 </th>
                            <th>廠商email</th>
                            <th>活動主題 </th>
                            <th>類型</th>
                            <th>活動地點 </th>
                            <th>活動名額</th>
                            <th>點數欄位</th>
                            <th>Actions</th>
                        </tr>
					</thead>
					<tbody>
					<c:forEach var="activity" items="${activityList}">
                        <tr>
                            <td><c:out value="${activity.id}" /></td>
                            <td><c:out value="${activity.username}" /></td>
                            <td><c:out value="${activity.s_email}" /></td>
                            <td><c:out value="${activity.topic}" /></td>
                            <td><c:out value="${activity.style}" /></td>
                            <td><c:out value="${activity.address}" /></td>
                            <td><c:out value="${activity.quota}" /></td>
                            <td><c:out value="${activity.bonus_point}" />	</td>
                            <td>
                                <a href="<c:url value='/activitypage?id=${activity.id}' />" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
<%-- 								<a href="#" class="edit" title="Edit" data-toggle="tooltip"> --%>
								<a href="${pageContext.request.contextPath}/activityEdit?id=<c:out value='${activity.id}' />" class="edit" title="Edit" data-toggle="tooltip">
                                <i class="material-icons">&#xE254;</i></a>

<%-- 								<a href='#' onclick="if(window.confirm('確定要刪除？')) location.href ='<c:url value='/delete?id=${RecordParticipant.recordId}'/>'" class="delete" title="Delete" data-toggle="tooltip"> --%>
								<a href="${pageContext.request.contextPath}/activityDelete?id=<c:out value='${activity.id}' />" class="delete" title="Delete" data-toggle="tooltip">
	         								<i class="material-icons">&#xE872;</i>
	        					</a>
                            </td>
                        </tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="clearfix">
					
					<ul class="pagination">
						<li class="page-item disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
						<li class="page-item active"><a href="#" class=" page-link">1</a></li>
						<li class="page-item"><a href="#" class="page-link">2</a></li>
						<li class="page-item "><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
					</ul>
					
				</div>
			</div>
		</div>		
	</div>
<!--舊版查詢	<div>
		<div class="search-container">
			<form action="${pageContext.request.contextPath}/activityQuery">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit" class="btn1 btn-primary">取得資料</button>
			</form>
			
 			<table class="table" id="list_table"> 
				<thead class="text-light"
					style="background-color: rgb(167, 201, 66);">
					<tr>
						<th>舉辦活動序號</th>
						<th>廠商帳號</th>
						<th>廠商email</th>
						<th>活動主題</th>
						<th>類型</th>
						<th>活動地點</th>
						<th>活動名額</th>
						<th>點數欄位</th>
						<th>Actions</th>
						<th width="70px"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="activity" items="${activityList}">
						<tr>
							<td><c:out value="${activity.id}" /></td>
							<td><c:out value="${activity.username}" /></td>
							<td><c:out value="${activity.s_email}" /></td>
							<td><c:out value="${activity.topic}" /></td>
							<td>
								<c:out value="${activity.style}" />
							</td>
							<td><c:out value="${activity.address}" /></td>
							<td><c:out value="${activity.quota}" /></td>
							<td><c:out value="${activity.bonus_point}" /></td>
							<td><a href="${pageContext.request.contextPath}/activityEdit?id=<c:out value='${activity.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/activityDelete?id=<c:out value='${activity.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>-->
	

	
</body>

</html>