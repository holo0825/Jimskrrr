$(function() {
	function format(d) {
		// `d` is the original data object for the row
		let listItem =
			'<table style="color:black; cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'
			+ '<tr>'
			+ '<th>產品名稱</th>'
			+ '<th>單價</th>'
			+ '<th>數量</th>'
			+ '<th>合計</th>'
			+ '</tr>'
		$.ajax({
			type: 'GET',
			url: './ListItem',
			async: false,
			dataType: 'json',
			data: 'itemNo=' + d,
			success: function(data) {
				var json = JSON.stringify(data, null, '');
				var jsonArray = JSON.parse(json);
				let text = ''
				for (var i = 0; i < jsonArray.length; i++) {
					text +=
						'<tr>'
						+ '<td>' + data[i].productName + '</td>'
						+ '<td>' + data[i].price + '</td>'
						+ '<td>' + data[i].number + '</td>'
						+ '<td>' + data[i].price * data[i].number + '</td>'
						+ '</tr>'
				}
				listItem += text + '</table>'
			}
		})
		return listItem
	}

	$('#findAll').DataTable({
//		"scrollX": true,
		"language": {
        "processing": "處理中...",
        "loadingRecords": "載入中...",
        "lengthMenu": "顯示 _MENU_ 項結果",
        "zeroRecords": "沒有符合的結果",
        "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
        "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
        "infoFiltered": "(從 _MAX_ 項結果中過濾)",
        "infoPostFix": "",
        "search": "搜尋:",
        "paginate": {
            "first": "第一頁",
            "previous": "上一頁",
            "next": "下一頁",
            "last": "最後一頁"
        },
        "aria": {
            "sortAscending": ": 升冪排列",
            "sortDescending": ": 降冪排列"
        }
    	}
		//		"scrollY":        "500px",
		//		"scrollCollapse": true,
		//	    "paging":         false
	});

	var table = $('#findAll').DataTable();

	$('#findAll tbody').on('click', 'td.details-control', function() {
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

	$('tbody').on('click', '.refund', function() {
		let reitem = $(this).closest('tr').children();
		let reNo = reitem.eq(1).text();
		console.log(reNo)
		Swal.fire({
			title: '確認退款?',
			text: "",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '確定',
			cancelButtonText: '取消'
		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire(
					'已提交申請',
					'審核中',
					'success'
				)
				reitem.eq(9).children().remove()
				reitem.eq(9).text('審核中')
				let info = '審核中'
				$.ajax({
					type: 'POST',
					url: './RefundApp',
					data: 'itemNo=' + reNo + '&info=' + info,
				})
			}
			else {
				//location.reload()
			}
		})
	});

	$('tbody').on('click', '.checkRefund', function() {
		let reitem = $(this).closest('tr').children();
		let reNo = reitem.eq(1).text();
		let info
		Swal.fire({
			title: '退款審核',
			showDenyButton: true,
			showCancelButton: true,
			confirmButtonText: '同意',
			denyButtonText: '拒絕',
			cancelButtonText: '取消'
		}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				Swal.fire('已同意退款', '', 'success')
				reitem.eq(9).children().remove()
				reitem.eq(9).text('已退款')
				let point = reitem.eq(7).text();
				console.log(point)
				info = '已退款'
				console.log(reNo+info)
				$.ajax({
					type: 'POST',
					url: './RefundDec',
					data: 'itemNo=' + reNo+'&info='+info+'&point='+point,
				})
			} else if (result.isDenied) {
				Swal.fire('已駁回申請', '', 'error')
				reitem.eq(9).children().remove()
				reitem.eq(9).text('退款失敗')
				info = '退款失敗'
				console.log(reNo+info)
				$.ajax({
					type: 'POST',
					url: './RefundDec',
					data: 'itemNo=' + reNo+'&info='+info,
				})
			}
		})

	});

	$('#waitcheck').on('click', function() {  //折扣使用判斷
		let check = $(this).val()
		if (check == 0) {
			$(this).val(1)
			table.search('審核中').draw();
		} else {
			$(this).prop('checked', false)
			$(this).val(0)
			table.search('').draw();
		}
	})
})