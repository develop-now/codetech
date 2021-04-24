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
<title>favorite</title>
<!--주문내역의 리뷰작성을 클릭하면 이동되며 마이페이지에서 작성됨,가게, 총주문수, 작성칸 사진삽입, 좋아요 수정아이콘 -->
<%@include file="../partial/head.jsp"%>
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
					<div class="container mypageOrderList">
						<div class="userContainer__header">
							<h2 class="text-right">즐겨찾기 카페</h2>
						</div>
						<hr>
						<c:forEach var="store" items="${store}" varStatus="status">
							<div class="mypageFavoirteList__body d-inline-flex text-center">
							<input type="hidden" name="likesCount" value="${likesCount}">
								<div class="mypageOrderList__content-left">
									<div>
										<span id="getStore_name">${store.store_name }</span><br>
										<span id="store_add">${store.store_address_si}&nbsp;${store.store_address_gu}&nbsp;${store.store_address_dong}</span><br>
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
										
									</div>
									<div class="text-right FavoirteList__btn">
										<button type="button" onclick="location.href='../user/orderMain?store_id=${store.store_id}'">가게보기</button>
										<button type="button" onclick="location.href='../user/favoriteDelete?store_id=${store.store_id}'">즐겨찾기 삭제</button>
										<input type="hidden" name="store_id" value="${store.store_id}">
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /.container -->

			<%-- footer --%>
			<%@include file="../partial/footer.jsp"%>
		</div>
	</div>
</body>
</html>
