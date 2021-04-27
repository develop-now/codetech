<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-infoMain</title>
    <!--toggle으 마이페이지 클릭시 nav의 정보관리와 연결, 현재 정보, 토탈포인트, 작성된 리뷰수, 즐겨찾기 한 가게 수, 회원 탈퇴하기 테이블로 보여주기
    	정보수정클릭할경우 수정페이지로 이동 -->
    <%@include file="../partial/head.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/user/modifyPassword.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/user/modify.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/users/mypage.css">
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
                <div class="container infomain">
                <!--화면의 유저 아이디를 가지고 정보수정으로 넘어가야한다. -->
              <%--   <input type="hidden" name="user_id" value="${user_id}"> --%>
	              	<div class="userContainer__header">
	              		<h2 class="text-right">정보관리</h2>
	              	</div>
	              		<hr>
	              	<div class="infomain__body">
		              	<div class="infomain__img">
		              		<img src="${pageContext.request.contextPath}/upload${userPlusInfo.user_profile}" alt="profile">
		              	</div>
		              	<div class="infomain__count">
		              		<span>즐겨찾는카페수&nbsp;:&nbsp;${likes}지점</span>
		              		<span>리뷰개수&nbsp;:&nbsp;${comments}개</span>
		              	</div>
		              	<div class="infomain__list">
		              	<table class="infomain__list-table">
		              		<tr>
		              			<td><span>아이디</span></td>
		              			<td>${userPlusInfo.user_email}</td>
		              		</tr>
		              		<tr>
		              			<td><span>닉네임</span></td>
		              			<td>${userPlusInfo.user_name}</td>
		              		</tr>
		              		<tr>
		              			<td><span>연락처</span></td>
		              			<td>${userPlusInfo.user_tel}</td>
		              		</tr>
		              		<tr>
		              			<td><span>주소</span></td>
		              			<td>${userPlusInfo.user_address}</td>
		              		</tr>
		              	</table>
	              		</div>
		                <div class="infomain__link">
		                <span><button type="button" data-toggle="modal" data-target="#pwdModal">비밀번호수정</button></span>
			            <span><button type="button" data-toggle="modal" data-target="#modifyModal">정보수정</button></span>
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
<jsp:include page="modify-password.jsp"/>
<jsp:include page="modify-info.jsp"></jsp:include>
</body>
</html>
