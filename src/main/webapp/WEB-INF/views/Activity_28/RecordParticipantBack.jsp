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
<meta charset="UTF-8">
<title>RecordParticipant</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">
    <style>
        body {
            color: #566787;
            background: #f8f9fe;
            font-family: 'Roboto', sans-serif;
          
   			margin-left: 150px;
        }

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
    </script>
    
</head>
<body>

<div class="sidenav">

	  <div>
	  	
	  </div>
	  <ul class="list-unstyled components">
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
                            <a href="<c:url value='/ActivityRegister' />">活動管理 明細</a>
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
	<div class="container-xl" >
		<div class="table-responsive" >
			<div class="table-wrapper" >
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8"><h2>顧客管理 <b>明細</b></h2></div>
						<div class="col-sm-4">
							<div class="search-box">
								<i class="material-icons">&#xE8B6;</i>
								<input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入關鍵字">
<!-- 								<input type="text" class="form-control" placeholder="Search&hellip;"> -->
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover table-bordered order-table">
					<thead>	
                        <tr>
                            <th>ID</th>
                            <th >廠商帳號 <i class="fa fa-sort"></i></th>
                            <th>廠商活動</th>
                            <th>顧客帳號 <i class="fa fa-sort"></i></th>
                            <th>顧客名稱</th>
                            <th>顧客電話 <i class="fa fa-sort"></i></th>
                            <th>顧客Email</th>
                            <th>類型</th>
                            <th>Actions</th>
                        </tr>
					</thead>
					<tbody>
					<c:forEach var="RecordParticipant" items="${recordParticipantList}">
                        <tr>
                            <td>${RecordParticipant.recordId}</td>
                            <td>${RecordParticipant.s_username}</td>
                            <td>${RecordParticipant.activity_topic}</td>
                            <td>${RecordParticipant.u_userid}</td>
                            <td>${RecordParticipant.u_username}</td>
                            <td>${RecordParticipant.u_phone}</td>
                            <td>${RecordParticipant.sent_email}</td>
                            <td>${RecordParticipant.u_styles}</td>
                            <td>
                                
								<a href="<c:url value='/activitypage?id=${RecordParticipant.recordId}' />" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>

                                <a href="#" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

								<a href='#' onclick="if(window.confirm('確定要刪除？')) location.href ='<c:url value='/delete?id=${RecordParticipant.recordId}'/>'" class="delete" title="Delete" data-toggle="tooltip">
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
					<a class="nav-link" href="<c:url value='/ActivityRegister' />"><button class="btn btn-primary">回後台</button></a>
				</div>
			</div>
		</div>
		
		

		
	</div>   
</body>
</html>