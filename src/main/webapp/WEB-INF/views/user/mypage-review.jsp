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
	              	
	            </div>
	           <div class="addMessage text-center">
	           </div>
	           <div class="Nodata">
           		 	<div class="card bg-dark text-white">
           		 		<div class="d-flex justify-content-center">
					   		<img class="card-img" src="${pageContext.request.contextPath}/resources/image/user/notice.jpg" alt="Card image">
						 	<div class="card-img-overlay Nodata-content ">
							    <h1 class="card-title text-center">"작성된 리뷰가 </h1>
							    <h1 class="card-title text-right">없습니다."</h1>
							    <p class="card-text text-right">*주문내역에서 리뷰작성 가능한 리스트를 확인해보세요</p>
						   	
							   	<div class="text-right">
							   	<button id="coffeebtn" onclick="location.href='${pageContext.request.contextPath}/user/orderView?user_id=${user_id}'">
							   	 <img id="coffeebtnImg"src="${pageContext.request.contextPath}/resources/image/user/coffeebtn.png" >
							   	 주문내역확인&nbsp;&nbsp;
							   	 </button>
						   	</div>
           		 			</div>
					    </div>
					</div>
	           </div>
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
