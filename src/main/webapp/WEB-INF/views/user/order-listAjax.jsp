<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<div class="container-fluid px-0">
	<%-- main nav --%>

	<%-- info Modal --%>
	<%@include file="../partial/infoModal.jsp"%>

	<%-- alert Modal --%>
	<%@include file="../partial/alertModal.jsp"%>


	<!-- Page Content -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-sm-10">
				<div class="container mypageOrderList">
					<c:forEach var="store" items="${store}" varStatus="status">
						<div class="mypageOrderList__body d-inline-flex text-center">
							<div class="mypageOrderList__content-left">
								<div>
									<span id="getStore_name">${store.store_name }</span><br> <span
										id="store_add">${store.store_address_si}&nbsp;${store.store_address_gu}&nbsp;${store.store_address_dong}</span><br>
									<span>${store.store_address_etc}</span>
								</div>
								<div class="mypageOrderList__content-left--img">
									<img
										src="${pageContext.request.contextPath}resources/upload/${store.store_saved_image}"
										alt="test">
								</div>
							</div>
							<div class="mypageOrderList__content-right">
								<div class="mypageOrderList__content-right--status text-center">
									<span> <c:choose>
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
									</span>

								</div>
								<div class="order-summary">${menu[status.index].menu_name }&nbsp;X&nbsp;
									${orderDetail[status.index].menu_quantity }&nbsp;
									${orderDetail[status.index].detail_total_price }원</div>
								<div class="text-right">
									<button type="button"
										onclick="location.href='../user/orderMain?store_id=${store.store_id}'">가게보기</button>
									<c:if
										test="${orders[status.index].comment_writable eq 'false'}">
										<button type="button" class="reviewbtn">리뷰작성</button>
										<input type="hidden" class="reviewIndex" id="reviewIndex"
											value="${store.store_id}">
									</c:if>
									<c:if test="${orders[status.index].comment_writable eq 'true'}">
										<button type="button" onclick="location.href='#'"
											style="background-color: gray !important;">리뷰불가</button>
									</c:if>
									<button
										onclick="location.href='../user/orderDetail?order_id=${orders[status.index].order_id}'">주문상세</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
<br>
