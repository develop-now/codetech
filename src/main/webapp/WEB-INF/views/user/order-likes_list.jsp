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
						<c:if test="${likesCount >0 }">
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
						</c:if>
						<c:if test="${likesCount == 0 }">
							 <div class="Nodata">
			           		 	<div class="card bg-dark text-white">
			           		 		<div class="d-flex justify-content-center">
								   		<img class="card-img" src="${pageContext.request.contextPath}/resources/image/user/notice.jpg"" alt="Card image">
									 	<div class="card-img-overlay Nodata-content ">
										    <h1 class="card-title text-center">"즐겨찾기에 추가된 카페가 </h1>
										    <h1 class="card-title text-right">없습니다."</h1>
										    <p class="card-text text-right">*즐겨찾는 카페를 등록하여 편하게 주문해 보세요</p>
									   	
										   	<div class="text-right">
										   	<button id="coffeebtn" onclick="location.href='${pageContext.request.contextPath}/owner/mainList'">
										   	 <img id="coffeebtnImg"src="${pageContext.request.contextPath}/resources/image/user/coffeebtn.png" >
										   	&nbsp;&nbsp;카페보러가기
										   	 </button>
									   	</div>
			           		 			</div>
								    </div>
								</div>
				           </div>
						</c:if>
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
