<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/owner/payment_complete"
					method="get" id="test">
	<input type="hidden" class="cartCount" name="cartCount" value="${cartCount }">
	<input type="hidden" class="amount" name="amount" value="${amount }">
	<input type="hidden" class="price" name="price" value="${newtotalPrice }">
	<input type="hidden" class="email" value="${user.user_email }">
	<input type="hidden" class="name" value="${user.user_name }">
	<input type="hidden" class="tel" value="${user.user_tel }">
	<input type="hidden" class="user_id" name="user_id" value="${user_id}">


	<c:forEach var="list" items="${list}" varStatus="status">
		<input type="hidden" class="o_menu${status.index}"
			value="${list.menuName }" name="o_menu">
		<input type="hidden" class="p_num${status.index}"
			value="${list.orderAmount }" name="p_num">
		<input type="hidden" class="m_num${status.index}"
			value="${list.menu_id }" name="m_num">
			<input type="hidden" name="p_price"
													id="p_price${status.count}" class="p_price"
													value="${list.menu_price}">
	</c:forEach>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
	<div class="order"></div>
	</form>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<script>
	$(document).ready(function() {
		

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
	
	var url = $('#url').val() + '/owner/verifyIamport/'

							for (var i = 0; i < $('.cartCount').val(); i++) {
								$('.order').append($('.o_menu' + i).val());
								$('.order').append(
										$('.p_num' + i).val() + '개  + ');
							}

							//아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
							IMP.init('imp88328398');
							const amountA = $('.price').val();


							IMP
									.request_pay(
											{
												pg : 'kakaopay',
												pay_method : 'card',
												merchant_uid : 'merchant_'
														+ new Date().getTime(),
												name : $('.order').text(),
												amount : amountA,
												buyer_email : $('.email').val(),
												buyer_name : $('.name').val(),
												buyer_tel : $('.tel').val(),
											},
											function(rsp) {
												console.log(rsp);
												//결제검증
												$.ajax({
																	type : "POST",
																	url : url
																			+ rsp.imp_uid
																})
														.done(
																function(data) {
																	console
																			.log(data);

																	//위의 rsp.paid_amount와 data.response.amount를 비교한 후 로직 실행(import 서버검증)
																	if (rsp.paid_amount == data.response.amount) {
																		//alert("결제 및 결제검증완료");
																		//location.href = "owner/payment_complete"
																		$('#test').submit();
																	} else {
																		//alert("결제 실패");
																	}
																});
											});
	})			
	</script>
</body>
</html>