<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/users/mypage.css">

</head>
<body>
	<div class="container-fluid px-0">
		<c:forEach var="store" items="${store}" varStatus="status">
			<div class="mypageReview__body d-inline-flex">
				<div class="mypageReview__content-left">
					<div>
						<span id="getStore_name">${store.store_name }</span><br> <span
							id="store_add">${store.store_address_si}&nbsp;${store.store_address_gu}&nbsp;${store.store_address_dong}</span><br>
						<span>${store.store_address_etc}</span>
					</div>
					<div class="mypageReview__content-left--img">
						<img
							src="/upload${store.store_saved_image}"
							alt="test">
					</div>
				</div>
				<div class="mypageReview__content-right">
					<div class="mypageReview__content-right--rivew">

						<c:choose>
							<c:when test="${orders[status.index].order_status == 1}">
											주문 접수 완료
										</c:when>

							<c:when test="${orders[status.index].order_status == 2}">
											주문 확인 완료
										</c:when>

							<c:when test="${orders[status.index].order_status == 3}">
											조리중
										</c:when>

							<c:when test="${orders[status.index].order_status == 4}">
											조리완료
										</c:when>

							<c:when test="${orders[status.index].order_status == 5}">
											픽업완료
										</c:when>
						</c:choose>

					</div>
					<div class="order-summary">
						<fmt:formatNumber
							value="${orders[status.index].order_total_price }"
							pattern="###,###,###" />
						원
					</div>

					<div class="text-right">
						<button type="button"
							onclick="location.href='user/orderMain?store_id=${store.store_id}'">가게보기</button>
						<c:if test="${orders[status.index].comment_writable eq 'false'}">
							<button type="button"
								onclick="location.href='../user/orderDetail?order_id=${orders[status.index].order_id}'">리뷰작성</button>
						</c:if>
						<c:if test="${orders[status.index].comment_writable eq 'true'}">
							<button type="button" onclick="location.href='#'"
								style="background-color: gray !important;">리뷰불가</button>
						</c:if>
						<button
							onclick="location.href='../user/orderMain?store_id=${store.store_id}'">주문상세</button>
					</div>
				</div>
			</div>
		</c:forEach>
		<br>
	</div>