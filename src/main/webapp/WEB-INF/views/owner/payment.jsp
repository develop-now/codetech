<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" class="amount" value="${amount }">
<input type="hidden" class="price" value="${newtotalPrice }">
<input type="hidden" class="email" value="${user.user_email }">
<input type="hidden" class="name" value="${user.user_name }">
<input type="hidden" class="tel" value="${user.user_tel }">

	<script>
	$(function() {
		//아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
		IMP.init('imp88328398');
		var amountA = $('.price').val();

		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : $('.name').val(),
			amount : amountA,
			buyer_email : $('.email').val(),
			buyer_name : $('.name').val(),
			buyer_tel : $('.tel').val(),
		}, function(rsp) {
			console.log(rsp);
			//결제검증
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/verifyIamport/" + rsp.imp_uid
			}).done(function(data) {
				console.log(data);

				//위의 rsp.paid_amount와 data.response.amount를 비교한 후 로직 실행(import 서버검증)
				if (rsp.paid_amount == data.response.amount) {
					//alert("결제 및 결제검증완료");
					location.href = "payment_complete"
				} else {
					//alert("결제 실패");
				}
			});
		});
	});
	</script>
</body>
</html>