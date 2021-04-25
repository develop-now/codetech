<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset='UTF-8'>

<title>Pay Success</title>
<%@include file="../partial/head.jsp"%>


</head>
<body>
	<%@include file="../partial/nav.jsp"%>
	<div class="container">
		<div class="dark">

			<input type="hidden" class="amount" name="amount" value="${amount }"
				id="amount"> <input type="hidden" id="url"
				value="${pageContext.request.contextPath}"> <input
				type="hidden" name="ordered_store" id="ordered_store"
				class="ordered_store" value="${orderedStore}">
				<input
				type="hidden" name="store_owner" id="store_owner"
				class="store_owner" value="${store_owner}">
				
		</div>
		<br><br>
		<div class="img" style="text-align:center; ">
			<img class="success"
				src="${pageContext.request.contextPath}/resources/image/common/success.png"
				width="500" height="500" alt="">
		</div>
		<br><br>
		<div style="text-align:center;">
		<h2>결제가 정상 처리되었습니다.</h2>
			<a
				href="${pageContext.request.contextPath}/user/orderView?user_id=${user_id}"
				class="btn btn-primary">주문확인</a>
		</div>
		<script>
			$(document).ready(function() {

				socket.onopen = function() {
					var target = $('#store_owner').val();
					var content = '주문이 접수되었습니다.';
					var url = $('#url').val() + '/store/order-list';
					socket.send("관리자," + target + "," + content + "," + url); // 소켓에 전달
				}

			});
		</script>
	</div>
</body>
</html>