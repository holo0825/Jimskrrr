$(function() {
	//    let bodyLen = $('#item').children().length     //寫入商品資料
	//    for (let i = 0; i < bodyLen; i++) {
	//        let pnv = $('.productName').eq(i).val()
	//        let produveName = $('.productName').eq(i).next()
	//        produveName.text(pnv)
	//        let prv = $('.price').eq(i).val()
	//        let price = $('.price').eq(i).next()
	//        price.text(prv)
	//    }

	let dis = 0
	function sumC() {  //金額計算
		let sum = 0
		// let itemLen = $('#item').children.length
		let itemLen = document.getElementById('item').children.length
		for (let i = 0; i < itemLen; i++) {
			let priceV = $('.price').eq(i).val()
			let numberV = $('.number').eq(i).val()
			sum = sum + (priceV * numberV)
		}
		let pt = sum / 100
		$('#amount').val(sum)
		$('#point').val(pt)
		let amount = $('#amount').val();
		let point = $('#point').val()
		// $('#amount').next().text(amount)
		$('#apa').text(amount)
		$('#app').text(point)

		for (let i = 0; i < $('#discountDiv').children().length; i++) {
			let dis = $('#discountDiv').children().eq(i).val()
			if (dis > Number(amount)) {
				$('#discountDiv').children().eq(i).prop('checked', false)
				$('#discountDiv').children().eq(i).attr('disabled', 'disabled')
			} else {
				$('#discountDiv').children().eq(i).attr('disabled', false)
			}
		}
		discount()
		if (amount - dis < 0) {
			dis = 0
		}
		let disa = amount - dis
		let disp = disa / 100
		$('#disAmount').val(disa)
		$('#disPoint').val(disp)
		$('#disa').text(disa)
		$('#disp').text(disp)
	}
	window.onload = sumC()


	let befV
	$('.number').focus(function() {  //數量控制
		befV = $(this).val()
	}).change(function() {
		let numV = $(this).val()
		if (numV <= 0) {
			$(this).val(1)
		}
		sumC()
	})
	$('tbody').on('click', '.minus', function() {   //數量減少
		let nv = Number($(this).next().val())
		let afretnv = nv - 1
		if (afretnv <= 0) {
			afretnv = 1
		}
		$(this).next().val(afretnv)
		sumC()
	})
	$('tbody').on('click', '.plus', function() {    //數量增加
		let nv = Number($(this).prev().val())
		$(this).prev().val(nv + 1)
		sumC()
	})
	$('#updata').on('click', function() { //訂單確認
		// document.forms[0].submit()
		$('#pay').attr('disabled', false)
		$('#updata').attr('disabled', true)
		$('.delete').attr('disabled', true)
		$('.number').attr('readonly', true)
		$(".minus").attr('disabled', true)
		$('.plus').attr('disabled', true)
		$('#usePoint').attr('disabled', true)
		$('.disRadio').attr('disabled', true)
		$('.fa-trash-alt, .fa-minus, .fa-plus').prop('style', 'color:grey')

	})
	$('#pay').on('click', function() {  //付款
		$('.disRadio').attr('disabled', false)
		document.forms['shoppingCarts'].action = "./PayProcess"
		document.forms['shoppingCarts'].submit()
	})
	//    $('tbody').on('click', '.delete', function () { //刪除
	//        $(this).closest('tr').remove()
	//        let deleteProduct =  $(this).closest('tr').children().eq(1).val()
	//        console.log('deleteProduct:'+deleteProduct)
	//        if ($('#item').children().length == 0) {
	//            $('#amount').val(0)
	//            $('#point').val(0)
	//            $('#amount').next().text(0)
	//            $('#point').next().text(0)
	//        } else {
	//            sumC()
	//        }
	//    })
	$('tbody').on('click', '.delete', function() {  //刪除警告
		Swal.fire({
			title: '移除此商品',
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
					'成功!',
					'該商品已移除',
					'success'
				)
				let itemNo = $('#itemNo').val()
				let deleteProduct = $(this).closest('tr').children().eq(1).val()
				console.log(itemNo+ ' : ' + deleteProduct)
				$.ajax({
					type:'GET',
					url:'./DeletePartList',
					data:'itemNo='+itemNo+'&productName='+deleteProduct, 
				})
				$(this).closest('tr').remove()
				if ($('#item').children().length == 0) {
					$('#amount').val(0)
					$('#point').val(0)
					$('#amount').next().text(0)
					$('#point').next().text(0)
					document.forms['shoppingCarts'].action = "./DeleteCart"
					document.forms['shoppingCarts'].submit()
				} else {
					sumC()
				}
			}
			else {
				//location.reload()
			}
		})
	})
//	$('tbody').on('click', '.delete', function() {  //刪除警告
//		let noList = $('#item').children().length
//		if (noList == 0) {
//			Swal.fire({
//				title: 'Are you sure?',
//				text: "清空購物車",
//				icon: 'warning',
//				showCancelButton: true,
//				confirmButtonColor: '#3085d6',
//				cancelButtonColor: '#d33',
//				confirmButtonText: '確定',
//				cancelButtonText: '取消'
//			}).then((result) => {
//				if (result.isConfirmed) {
//					Swal.fire(
//						'成功!',
//						'目前無購買項目',
//						'success'
//					)
//					document.forms['shoppingCarts'].action = "./DeleteCart"
//					document.forms['shoppingCarts'].submit()
//				}
//				else {
//					location.reload()
//				}
//			})
//		}
//	})

	$('#usePoint').on('click', function() {  //折扣使用判斷
		let check = $(this).val()
		if (check == 0) {
			$(this).val(1)
			$('#discountDiv').prop('style', 'display')
			$('#trDis').prop('style', 'display')
			$('#apa').css('text-decoration', 'line-through')
			$('#app').css('text-decoration', 'line-through')
			$('#apa').css('color', 'black')
			$('#app').css('color', 'black')

		} else {
			$(this).prop('checked', false)
			$(this).val(0)
			$('#discountDiv').prop('style', 'display:none')
			$('#discountDiv :input').prop('checked', false)
			dis = 0
			$('#trDis').prop('style', 'display:none')
			$('#disa').text($('#amount').val())
			$('#disp').text($('#point').val())
			$('#apa').css('text-decoration', '')
			$('#app').css('text-decoration', '')
			$('#apa').css('color', 'red')
			$('#app').css('color', 'red')
			$('#disAmount').val($('#amount').val())
			$('#disPoint').val($('#point').val())
		}
		$('#discountDiv input').on('click', function() {  //折扣金額
			dis = $(this).val()
			sumC()
		})

	})
	function discount() {  //點數限制
		let nowPoint = Number($('#nowPoint').text())
		for (let i = 0; i < $('#discountDiv').children().length; i++) {
			let dis = $('#discountDiv').children().eq(i).val()
			if (dis > nowPoint) {
				$('#discountDiv').children().eq(i).attr('disabled', 'disabled')
			}
		}
	}
	window.onload = discount()
})