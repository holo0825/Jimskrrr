<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>聚點時刻</title>
<!-- <link rel="stylesheet" href="link.css"> -->
<link rel="stylesheet" href="//cdn.datatables.net/1.11.1/css/jquery.dataTables.min.css">
<style>
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
	td.details-control {
        background: url('./images/sc/details_open.png') no-repeat center center;
        cursor: pointer;
    }
    tr.shown td.details-control {
        background: url('./images/sc/details_close.png') no-repeat center center;
    }
</style>

</head>

<body>
	<header>
		<h1>全部訂單</h1>
	</header>
	<div id="container">
		<table id="findAll" class="display">
			<thead>
				<tr>
					<th></th>
					<th>訂單編號</th>
					<th>帳號</th>
					<th>商品類別</th>
					<th>總金額</th>
					<th>點數增減</th>
					<th>付款日期</th>
					<th>備註</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${adminCart}" var="adminCart">
				<tr>
					<td class="details-control"></td>
					<td>${adminCart.itemNo}</td>
					<td>${adminCart.username}</td>
					<td>${adminCart.type}</td>
					<td>NT$ ${adminCart.amount}</td>
					<td>${adminCart.points}</td>
					<td>${adminCart.payday}</td>
					<td>${adminCart.wrong}</td>
				</tr>
			</c:forEach>            
			</tbody>
		</table>
	</div>
	<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
	<script src="//cdn.datatables.net/1.11.1/js/jquery.dataTables.min.js"></script>
	<script>
		$(function() {
			function format(d) {
		        // `d` is the original data object for the row
		        let listItem=
		        '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'
		        +'<tr>'
		        +'<th>產品名稱</th>'
		        +'<th>單價</th>'
		        +'<th>數量</th>'
		        +'<th>合計</th>'
		        +'</tr>'
		        $.ajax({
		        	type:'GET',
		        	url:'./ListItem',
		        	async: false,
		        	dataType:'json',
		        	data:'itemNo=' + d,
		        	success:function(data){	
		        		var json = JSON.stringify(data, null, '');
        			    var jsonArray = JSON.parse(json);
		        		let text=''
		        		 for(var i=0;i<jsonArray.length;i++){	   
		        			 text += 
		        	    	   '<tr>'
		        	    	   +'<td>'+data[i].productName+'</td>'
		        	    	   +'<td>'+data[i].price+'</td>'
		        	    	   +'<td>'+data[i].number+'</td>'
		        	    	   +'<td>'+data[i].price*data[i].number+'</td>'  
		        	    	   +'</tr>'
		        	       }
		        		 listItem+= text + '</table>'
		        	}
		        })
		        return listItem
		    }
			
			$('#findAll').DataTable({
		//		"scrollY":        "500px",
     	//		"scrollCollapse": true,
    	//	    "paging":         false
			});

			var table = $('#findAll').DataTable(); 

			$('#findAll tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);
                
                var td = tr.children().eq(1).text()

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    // Open this row
                    // row.child(format(row.data())).show();
                    row.child(format(td)).show();
                    tr.addClass('shown');
                }
            });       
		})
	</script>
</body>

</html>