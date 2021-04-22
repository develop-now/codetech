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
				<div class="col-12 col-sm-10">
					<div class="container mypageReview">
						<div class="userContainer__header">
							<h2 class="text-right">즐겨찾는카페</h2>
						</div>
						<hr>
						<c:forEach var="store" items="${store}" varStatus="status">
							<div class="card" style="width: 400px"
								id="check${store.store_id}">
								<img class="card-img-top"
									src="${pageContext.request.contextPath}resources/upload/${store.store_saved_image}"
									alt="Card image" style="width: 100%">
								<div class="card-body">
									<h4 class="card-title">${store.store_name}</h4>
									<p class="card-text">${store.store_address_si}&nbsp;&nbsp;${store.store_address_gu}&nbsp;&nbsp;${store.store_address_dong}</p>
									<input type="hidden" value="${store.store_id}" id="store">
									<button class="btn btn-secondary" id="cancel" onclick="javascript:del();">즐겨찾기 취소</button>
									<a
										href="${pageContext.request.contextPath}/user/orderMain?store_id=${store.store_id}"
										class="btn btn-primary">주문하러가기</a>
								</div>
							</div>
							<br>
							<input type="hidden" value="${user_id}" id="user">
							
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /.container -->

			<%-- footer --%>
			<%@include file="../partial/footer.jsp"%>
		</div>
	</div>

	<script>
	
	function del(){
		var user_id = $("#user").val();
		var store_id = event.target.previousElementSibling.getAttribute('value');
		var url = $('#ab').val() + "/user/cartDel"
		event.target.parentElement.parentElement.remove();
		
		$.ajax({
			type : 'get',
			url : "${pageContext.request.contextPath}/user/favoriteCancel",
			data : data = {
				"user_id" : user_id,
				"store_id" : store_id
			},
			dataType : "json",
			success : function(rdata) {
				if (rdata == 1) {
					$("#check" + store_id).remove();
				}

			} // success;
		}) // ajax
	}
		//$(document).on("click", "#cancel", function() {
//$('#cancel').click(function() {
	

		
	</script>

</body>
</html>
