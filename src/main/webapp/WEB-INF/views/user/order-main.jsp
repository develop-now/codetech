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
<title>order-main</title>
<!-- 가게에서 주문하기를 클릭하면 이곳으로 이동됨, (toggle에서 필요하지 않음. sidenav에서 주문하기를 클릭하면 다시 가게 리스트찾는 페이지로 돌아감 
    메뉴 + 를 하면 메뉴에 옵션선택이 가능한 modal이 출력됨. 추가하기 하면 화면의 right bar에서 추가한 아이템들이 보여짐(이때 테이블에 저장은 아니고 잠시 저장될 곳이 어디인지 
    확인해봐야함. 같은 옵션의 메뉴 개수를 수정할 수 있음 -> 이에따라 메뉴당 금액과 총금액이 변동되어야 함
    가게 좋아요를 할 수 있으며 좋아요 아이콘이 추가되면 즐겨찾기리스트에 가게 id가 추가됨. 
    -->
<%@include file="../partial/head.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/js/user/order-main.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/users/order-main.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

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
				<form action="${pageContext.request.contextPath}/owner/pay"
					method="get">
					
							<!-- searchbar -->
		<div class="topnav">
			<a class="active" href="${pageContext.request.contextPath}/user/orderMain?store_id=${store_id}">메 뉴</a> 
			<a 	href="javascript:void(0);" class='storeReview-btn'>리뷰보기</a>
		</div>
					<div class="col-12 col-sm-10">

						<div class="order">
							<div class="storeInfoView">
								<div class="storeName">
									<h2>${store.store_name}</h2>
									<img class="card-img-heart"
										src="${pageContext.request.contextPath}/resources/upload/love.png"
										width="50" height="50" alt=""> ${storeLike }
								</div>
								<div class="storeAddress">${store.store_address_si }
									&nbsp;${store.store_address_gu }&nbsp;${store.store_address_dong }&nbsp;${store.store_address_etc }
								</div>
							</div>

							<div class="menuView">

								<div class="topMenu">
									<input type="hidden" id="menuCount" value="${menuCount }">
									<br>
									<h4>인기메뉴</h4>
									<hr>
									<c:forEach var="topMenu" items="${topMenu}" varStatus="status">
										<div class="topMenus">
											<img class="card-img-heart"
												src="${pageContext.request.contextPath}/resources/upload/${topMenu.menu_saved_image}"
												width="100" height="100" alt="">&nbsp;&nbsp;
											<div class="menuName">
												<input type="hidden" name="o_menu"
													id="o_menu${status.count}" class="o_menu"
													value="${topMenu.menu_name }"> <input type="hidden"
													name="m_num" id="m_num${status.count}" class="m_num"
													value="${topMenu.menu_id }"> <span
													id="menuNameA${status.count}">${topMenu.menu_name }</span>

											</div>
											&nbsp;&nbsp;

											<div class="basketprice">

												<input type="hidden" name="p_price"
													id="p_price${status.count}" class="p_price"
													value="${topMenu.menu_price }">
												<fmt:formatNumber value="${topMenu.menu_price }"
													pattern="###,###,###" />
												원&nbsp;&nbsp;
											</div>
											<div class="num">
												<div class="updown">
													<input type="text" name="p_num" id="p_num${status.count}"
														size="2" maxlength="4" class="p_num" value="0"
														onkeyup="javascript:basket.changePNum(${status.count});">
													<span id="pmbtn"
														onclick="javascript:basket.changePNum(${status.count});"><i
														class="fas fa-arrow-alt-circle-up up"></i></span> <span
														id="pmbtn"
														onclick="javascript:basket.changePNum(${status.count});"><i
														class="fas fa-arrow-alt-circle-down down"></i></span>
												</div> <!-- updown -->
											</div> <!-- num -->

										</div> <!-- topMenus -->
										<br>
										<br>
									</c:forEach>
								</div> <!-- topMenu -->
								<hr>
								<div class="categories">
								<c:set var="coffee" value="0"/>
								<c:set var="dessert" value="0"/>
								<c:set var="japanese" value="0"/>
								<c:set var="korean" value="0"/>
								<c:set var="western" value="0"/>
									<c:forEach var="allMenu" items="${allMenu}" varStatus="status">
										<c:choose>
											<c:when test="${allMenu.category_id == 5 && coffee == 0}">
												<div class="coffee">
													커피<br>
													<c:set var="coffee" value="${coffee + 1}"/>
											</c:when>

											<c:when test="${allMenu.category_id == 4 && dessert == 0 }">
												<div class="dessert">
													디저트<br>
													<c:set var="dessert" value="${dessert + 1}"/>
											</c:when>

											<c:when test="${allMenu.category_id == 3 && japanese == 0}">
												<div class="japanese">
													일식<br>
													<c:set var="japanese" value="${japanese + 1}"/>
											</c:when>

											<c:when test="${allMenu.category_id == 2 && korean == 0}">
												<div class="korean">
													한식<br>
													<c:set var="korean" value="${korean + 1}"/>
											</c:when>

											<c:when test="${allMenu.category_id == 1 && western == 0}">
												<div class="western">
													양식<br>
													<c:set var="western" value="${western + 1}"/>
											</c:when>
										</c:choose>

										<img class="card-img-heart"
											src="${pageContext.request.contextPath}/resources/upload/${allMenu.menu_saved_image}"
											width="100" height="100" alt=""> &nbsp;&nbsp;<h5>${allMenu.menu_name }</h5>&nbsp;&nbsp;
																						<input type="hidden" name="o_menuA"
											id="o_menu${status.count}" class="o_menu"
											value="${allMenu.menu_name }">
										<input type="hidden" name="m_numA" id="m_numA${status.count}"
											class="m_numA" value="${allMenu.menu_id }">

										<div class="basketprice">
											<input type="hidden" name="p_priceA"
												id="p_price${status.count}" class="p_price"
												value="${allMenu.menu_price }">
											<fmt:formatNumber value="${allMenu.menu_price }"
												pattern="###,###,###" />
											원&nbsp;&nbsp;
										</div>
										<div class="num">
											<div class="updown">
												<input type="text" name="p_numA" id="p_numA${status.count}"
													size="2" maxlength="4" class="p_num" value="0"
													onkeyup="javascript:basket.changePANum(${status.count});">
												<span id="pmbtn"
													onclick="javascript:basket.changePANum(${status.count});"><i
													class="fas fa-arrow-alt-circle-up up"></i></span> <span id="pmbtn"
													onclick="javascript:basket.changePANum(${status.count});"><i
													class="fas fa-arrow-alt-circle-down down"></i></span>
											</div> <!-- updown -->
										</div> <!-- num -->

										<br>
								</div> <!-- per categories -->
								</c:forEach>
								</div> <!-- categories -->
								<br> <br> <br>
							</div> <!-- menuView -->
						<div class="payMentView">

						<div class="bigtext right-align sumcount" id="sum_p_num"></div>
						<div class="bigtext right-align box blue summoney"
							id="sum_p_price"></div>
						<input type="hidden" class="bigtext right-align sumcount"
							id="sum_p_numA" name="amount"> <input type="hidden"
							class="bigtext right-align box blue summoney" id="sum_p_priceA"
							name="totalPrice"> <br> <br> <input
							type="hidden" name="user_id" value="${user_id}"> <input
							type="hidden" id="store_id" name="store_id" value="${store_id}">
						<div class="buttonGroup">
							<button class="w3-button w3-khaki" id="forCart">장바구니 담기</button>
							<button type="submit" class="w3-button w3-khaki" id="pay">결제하기</button>
						</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</div> <!-- payMentView -->
			</div>
			<!-- order -->
		</div>
		<!-- col-12 col-sm-10 -->
		</form>
	</div>
	<!-- row -->
	
	</div>
	<!-- container-fluid-->

	<%-- footer --%>
	<%@include file="../partial/footer.jsp"%>

	<script>
$(function() {
			$('form').submit(function() {
				if (($("#sum_p_numA").val() < 1)) {
					alert("메뉴를 선택하세요");
					return false;
				}
				
			})
			
	$('#forCart').click(function() {
		$("form").attr("action", "${pageContext.request.contextPath}/user/cartRegister");
	})		
})
			

				</script>
<%@include file="order-storeReview.jsp" %>
</body>
</html>
