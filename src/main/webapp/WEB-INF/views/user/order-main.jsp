<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
					<div class="order">
						<div class="storeInfoView">
							${store.store_name} <img class="card-img-heart"
								src="${pageContext.request.contextPath}/resources/upload/love.png"
								width="20" height="20" alt=""> ${storeLike }<br>
							${store.store_address_si } ${store.store_address_gu }${store.store_address_dong }${store.store_address_etc }
						</div>
						<div class="menuView">
							<div class="topMenu">
								인기메뉴
								<hr>

								<c:forEach var="topMenu" items="${topMenu}" varStatus="status">
									<div class="topMenus">
										<img class="card-img-heart"
											src="${pageContext.request.contextPath}/resources/upload/${topMenu.menu_saved_image}"
											width="20" height="20" alt=""> ${topMenu.menu_name }
										<button class="w3-button w3-circle w3-black"
											id="minusButtonT${status.count}">-</button>
										<input type="text" name="orderAmount" placeholder="0"
											id="orderAmountT${status.count}">
										<button class="w3-button w3-circle w3-black"
											id="plusButtonT${status.count}">+</button>
										<br>
									</div>
								</c:forEach>
							</div>
							<hr>
							<div class="categories">

								<c:forEach var="allMenu" items="${allMenu}" varStatus="status">
									<c:choose>
										<c:when test="${allMenu.category_id == 5}">
											<div class="coffee">
												커피<br>
										</c:when>

										<c:when test="${allMenu.category_id == 4}">
											<div class="dessert">
												디저트<br>
										</c:when>

										<c:when test="${allMenu.category_id == 3}">
											<div class="japanese">
												일식<br>
										</c:when>

										<c:when test="${allMenu.category_id == 2}">
											<div class="korean">
												한식<br>
										</c:when>

										<c:when test="${allMenu.category_id == 1}">
											<div class="western">
												양식<br>
										</c:when>
									</c:choose>

									<img class="card-img-heart"
										src="${pageContext.request.contextPath}/resources/upload/${allMenu.menu_saved_image}"
										width="20" height="20" alt=""> ${allMenu.menu_name }
											<button class="w3-button w3-circle w3-black"
										id="minusButtonM${status.count}">-</button>
									<input type="text" name="orderAmount" placeholder="0"
										id="orderAmountM${status.count}">
									<button class="w3-button w3-circle w3-black"
										id="plusButtonM${status.count}">+</button>
									<br>
							</div>
							</c:forEach>



						</div>
					</div>
					<div class="payMentView">

						총 : <input type="text" name="orderAmount" placeholder="0">
						개
						<button class="w3-button w3-khaki">장바구니 담기</button>
						<button class="w3-button w3-khaki">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<%-- footer --%>
	<%@include file="../partial/footer.jsp"%>
	</div>

	<script>
		$(document).ready(function() {
			var amount = 0;
			
			$('.topMenus button:nth-child(4)').click(function(index) {
				$(this).on("click", function() {
					amount += 1;
					$(this).prev().val(amount);
				})
				
			})
				

			})
			
	
	</script>

</body>
</html>
