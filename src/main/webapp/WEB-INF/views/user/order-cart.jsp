<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>cart-list</title>
<!--주문내역의 리뷰작성을 클릭하면 이동되며 마이페이지에서 작성됨,가게, 총주문수, 작성칸 사진삽입, 좋아요 수정아이콘 -->
<%@include file="../partial/head.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/js/user/order-cart.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/users/mypage.css">
</head>
<body>
	<div class="container-fluid px-0">
		<%-- main nav --%>
		<%@include file="../partial/nav.jsp"%>

		<%-- info Modal --%>
		<%@include file="../partial/infoModal.jsp"%>

		<%-- alert Modal --%>
		<%@include file="../partial/alertModal.jsp"%>


		<!-- Page Content -->
		<div class="container-fluid">
			<div class="row">
				<%@include file="user-nav-mypage.jsp"%>
				<div class="col-12 col-sm-10">
					<div class="container mypageReview">
						<div class="userContainer__header">
							<h2 class="text-right">장바구니</h2>
						</div>
						<hr>
						<c:forEach var="store" items="${store}" varStatus="status">
							<div class="mypageReview__body d-inline-flex">
								<div class="mypageReview__content-left">
									<div>
										<span>${store.store_name }</span>
									</div>
									<div class="mypageReview__content-left--img">
										<img
											src="${pageContext.request.contextPath}resources/upload/${menu[status.index].menu_saved_image}"
											alt="test">
									</div>
								</div>
								<div class="mypageReview__content-right">
									<div class="mypageReview__content-right--rivew">

										<c:choose>
											<c:when test="${store.store_status == 1 }">
											주문 가능
										</c:when>

											<c:when test="${store.store_status == 2}">
											주문 불가
										</c:when>
										</c:choose>

									</div>
									<div class="order-summary">
										${menu[status.index].menu_name }
										<fmt:formatNumber value="${menu[status.index].menu_price }"
													pattern="###,###,###" />
										</div>
									<div class="text-right">
									<input type="hidden" name="p_price"
													id="p_price${status.count}" class="p_price"
													value="${menu[status.index].menu_price }">
										<button type="button" onclick="location.href='home'">메뉴삭제</button>
									</div>
									<div class="num">
										<div class="updown">
											<input type="text" name="p_num" id="p_num${status.count}"
												size="2" maxlength="4" class="p_num"
												value="${cart[status.index].menu_quantity }"
												onkeyup="javascript:basket.changePNum(${status.count});">
											<span id="pmbtn"
												onclick="javascript:basket.changePNum(${status.count});"><i
												class="fas fa-arrow-alt-circle-up up"></i></span> <span id="pmbtn"
												onclick="javascript:basket.changePNum(${status.count});"><i
												class="fas fa-arrow-alt-circle-down down"></i></span>
										</div>
									</div>

								</div>
							</div>
						</c:forEach>
						<br>
						<br>
						<div class="payMentView"></div>
						<div class="bigtext right-align sumcount" id="sum_p_num">총 : ${amount} 개 </div>
						<div class="bigtext right-align box blue summoney"
							id="sum_p_price">총 <fmt:formatNumber value="${totalPrice}"
													pattern="###,###,###" />원</div>
							<input type="hidden" class="bigtext right-align sumcount"
							id="sum_p_numA" name="amount"> <input type="hidden"
							class="bigtext right-align box blue summoney" id="sum_p_priceA"
							name="totalPrice">
					</div>
				</div>
			</div>
			<!-- /.container -->
			<br>
			<div class="row" id="moreAjax"></div>

			<%-- footer --%>
			<%@include file="../partial/footer.jsp"%>
		</div>
	</div>

</body>
</html>
