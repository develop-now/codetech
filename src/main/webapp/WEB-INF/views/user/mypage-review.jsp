<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-review</title>
    <!--주문내역의 리뷰작성을 클릭하면 이동되며 마이페이지에서 작성됨,가게, 총주문수, 작성칸 사진삽입, 좋아요 수정아이콘 -->
    <%@include file="../partial/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/users/mypage.css">
    <script src="${pageContext.request.contextPath}/resources/js/user/user-commentList.js"></script>
</head>
<body>
<div class="container-fluid px-0">
    <%-- main nav --%>
    <%@include file="../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <%@include file="user-nav-mypage.jsp"%>
            <div class="col-12 col-sm-10">
               <div class="container mypageReview">
                	<div class="userContainer__header">
	              		<h2 class="text-right">리뷰관리</h2>
	              	</div>
	              		<hr>
	              	<input type="hidden" id="listCount" value="${listCount}">
	              	<div class="mypageReview-content">
	              	<c:if test="${!empty list}">
	              	<c:forEach var="list" items="${list}">
	              	<div class="mypageReview__body d-inline-flex">
	              		<div class="mypageReview__content-left">
	              			<div>
	              				<span><img src="${pageContext.request.contextPath}/resources/image/common/unlike.png" alt="likecheck" width="30px"></span>
	              				<span>${list.comment_store_value}</span>
	              			</div>
	              			<div class="text-center">
	              				<button>주문상세</button>
	              				<button>리뷰삭제</button>
	              			</div>
	              		</div>
	              		<div class="mypageReview__content-right">
	              			<div class="mypageReview__content-right--rivew">
	              			${ list.comment_content}<br>
	              			<span>(${list.created_at})</span>
	              			</div>
	              		</div >
	              	</div>
	              	</c:forEach>
	              	</c:if>
	              	<c:if test="${empty list} ">
	              	 등록된 댓글이 없습니다~ 주문을 해보시겠어요?
	              	</c:if>
	            </div>
	           <div class="addMessage text-center">더보기자리</div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</div>
</body>
</html>
