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
	<script>
		//아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
		IMP.init('imp88328398');

		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '아메리카노 4잔 + 치즈케잌 4개 + 자색고구마라떼 샷추가 + 단호박 쉐이크',
			amount : 40500,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
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
					alert("결제 및 결제검증완료");
					location.href = "payment_complete"
				} else {
					alert("결제 실패");
				}
			});
		});
	</script>
</body>
</html>