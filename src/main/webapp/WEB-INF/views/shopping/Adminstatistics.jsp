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
    <link rel="stylesheet" href="//cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css">
    <!-- <link rel="stylesheet" href="<c:url value='/css/link.css' />"> -->
  	<style>
        p{
            text-align: center;
        }
        .span1{
            font-size: 30px;
        }
     	header {
	       	background: #333;
        	color: lightgreen;
    	    padding: 20px;
    		text-align: center;
        	margin-bottom: 10px;
    	}
    	#container {
        	width: 1000px;
    	    margin: auto;
        	border: 3px solid black;
    	}
		/* .box {
            width: 300px;
            margin: 20px auto;
            border: 2px solid gray;
            padding: 10px;
        } */
  	</style>
</head>
<body>
    <header>
		<h1>後臺統計</h1>
	</header>
    <div id="container">
    		<div class="box" style="text-align: center;">
    			<a href="<c:url value='/Adminstatistics.cart' />">統計Cart</a>
    			<a href="<c:url value='/Adminstatistics.list' />">統計List</a>
    			<a href="<c:url value='/Adminlogin' />">返回</a>
			</div>
    		<div class="box" style="text-align: center;">
    			<button id="statisticsCart" value="cart"></button>
    			<button id="statisticsList" value="list"></button>
			</div>
        <div>
            <c:forEach items="${StatisticsCart}" var="StatisticsCart" varStatus="status">
            <p>
	            <span class="span1" id="type${status.index}">${StatisticsCart[0]}</span>
    	        <span class="span1">共${StatisticsCart[1]}元</span>
                <input  type="hidden" id="st${status.index}" value="${StatisticsCart[1]}">
            </p>
        	</c:forEach>
        </div>
        <div id="piechart_3d" style="width: 850px; height: 500px;"></div>
        <div id="ListDiv">
        <table id="findAll" class="display">
            <thead>
                <tr>
                    <th>產品名稱</th>
                    <th>價格</th>
                    <th>數量</th>
                    <th>總金額</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${StatisticsList}" var="StatisticsList">
                    <tr>
                        <td>${StatisticsList[0]}</td>
                        <td>${StatisticsList[1]}</td>
                        <td>${StatisticsList[2]}</td>
                        <td>${StatisticsList[3]}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        </div>
    </div>
    <script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="//cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
    <script>
		$(function() {
            $('#findAll').DataTable();

            var table = $('#findAll').DataTable(); 
            $('#findAll tbody').on( 'click', 'tr', function () {
                if ($(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            } );

			let type = $('#type0').text()
			if(type == 'coupon'){
				$('#type0').text('團購券')
			}if(type == 'food'){
				$('#type0').text('訂餐')
			}
			let type1 = $('#type1').text()
			if(type1 == 'coupon'){
				$('#type1').text('團購券')
			}if(type1 == 'food'){
				$('#type1').text('訂餐')
			}

            // let num0 = Number($('#st0').val())
            // let num1 = Number($('#st1').val())
            // let pre0 = (Math.floor(num0/(num0+num1)*10000))/100
            // let pre1 = 100 - pre0

            let bodyLen = $('tbody').children().length
            if (bodyLen == 1){
                $('#ListDiv').remove()
            }

            google.charts.load("current", {packages:["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable(${pie});

                var options = {
                        title: '商品販賣概況',
                        is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
		})
	</script>
</body>
</html>