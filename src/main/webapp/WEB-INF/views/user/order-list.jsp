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
<title>mypage-review</title>
<!--주문내역의 리뷰작성을 클릭하면 이동되며 마이페이지에서 작성됨,가게, 총주문수, 작성칸 사진삽입, 좋아요 수정아이콘 -->
<%@include file="../partial/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/users/mypage.css">
	<script>
	$(function(){
		
	$('.reviewbtn').on("click",function(){
		var store_id = $(this).next().val();
		var store_name = $("#getStore_id").text();
		console.log(store_name);
		$("#storeReviewWriteModal").modal("show");
		
		$('#storeReviewWriteModal_id').val(store_id);
	})
	})

	</script>
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
							<h2 class="text-right">주문내역</h2>
						</div>
						<hr>
						<c:forEach var="store" items="${store}" varStatus="status">
							<div class="mypageOrderList__body d-inline-flex text-center">
								<div class="mypageOrderList__content-left">
									<div>
										<span id="getStore_name">${store.store_name }</span>
									</div>
									<div class="mypageOrderList__content-left--img">
										<img
											src="${pageContext.request.contextPath}resources/upload/${store.store_saved_image}"
											alt="test">
									</div>
								</div>
								<div class="mypageOrderList__content-right">
									<div class="mypageOrderList__content-right--status text-center">
										<span>
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
										</span>

									</div>
									<div class="order-summary">
										${menu[status.index].menu_name }
										${orderDetail[status.index].menu_quantity }
										${orderDetail[status.index].detail_total_price }</div>
									<div class="text-right">
										<button type="button" onclick="location.href='home'">가게보기</button>
										<c:if
											test="${orders[status.index].comment_writable eq 'false'}">
											<button type="button" class="reviewbtn">리뷰작성</button>
											<input type="hidden" class="reviewIndex"id="reviewIndex" value="${store.store_id}">
										</c:if>
										<c:if
											test="${orders[status.index].comment_writable eq 'true'}">
											<button type="button" onclick="location.href='#'"
												style="background-color: gray !important;">리뷰불가</button>
										</c:if>
										<button onclick="location.href='../user/orderDetail?order_id=${orders[status.index].order_id}'">주문상세</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /.container -->
			<br>
			<div class="row" id="moreAjax"></div>
			
			<c:if test="${more eq 1}">
			<div class="more">
				<button class="pageInc btn btn-dark btn-lg" style="width: 300px;">더보기</button>
				<input type="hidden" class="hid" value="${user_id }">
			</div>
			</c:if>
			<%-- footer --%>
			<%@include file="../partial/footer.jsp"%>
		</div>
	</div>
	
	
	<script>
$(document).ready(function () {

//button for more
var page = 1;
$('.pageInc').click(function () {
    page += 1;
    $.get("${pageContext.request.contextPath}/user/orderViewAjax?user_id="+$('.hid').val(), {"page": page},
        function (data) {
            $("#moreAjax").append(data);
            	
        })

})
	
}
)
</script>


<div class="modal fade storeReviewWriteModal" id="storeReviewWriteModal"
						tabindex="-1" role="dialog"
						aria-labelledby="storeReviewWriteModalTitle" aria-hidden="true">

						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header storeReviewWriteModal-header">
									<h1 class="storeReviewWriteModal-title" id="storeReviewWriteModalTitle">가게이름</h1>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							
								<div class="modal-body storeReviewWriteModal-body">
									<form name="joinform" id="joinModalForm"
          action="<c:url value="/comment/user/addComment"/>"
          method="post" enctype="multipart/form-data"
          class="border-light p-5">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        		<sec:authentication property="principal" var="pinfo"/>
                    <input type="hidden" name="comment_writer_value" value="${pinfo.username}">
									<input type="hidden" id="storeReviewWriteModal_id" name="comment_store">
									<div>
									<textarea name="comment_content" placeholder="리뷰를 작성해주세요" required></textarea>
									</div>
									<div>
									</div>
									<button type="submit" class="storeReviewWriteModal__button" >작성하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
</body>
</html>
