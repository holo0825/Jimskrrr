<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>

    <script>
//                 Swal.fire({
//                 position: 'center',
//                 icon: 'success',
//                 title: '🎉報名已完成🎉',
//                 text: '請確認Email信件📩',
//                 showConfirmButton: false,
//                 timer: 3000
//                 })

//                 setTimeout("location.href='ActivityList'",2000)

		Swal.fire({
            title: 'OneRed_PoPCat',
            width: 500,
            padding: '5em',
            position: 'center',

            icon: 'success',
            title: '🎉報名已完成!🎉',
            text: '請確認Email信件📩',
            showConfirmButton: false,
            timer: 3000,

            background: '#fff url(/images/trees.png)',
            backdrop: `
            rgba(0,0,123,0.4)
            url("./images/nyan-cat.gif")
            left top
            
          `
		  })
		setTimeout("location.href='ActivityList'",2000)
		
    </script>


</body>
</html>