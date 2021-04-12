<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-info</title>
    <!--toggle으 마이페이지 클릭시 nav의 정보관리와 연결, 현재 정보, 토탈포인트, 작성된 리뷰수, 즐겨찾기 한 가게 수, 회원 탈퇴하기 테이블로 보여주기
    	정보수정클릭할경우 수정페이지로 이동 -->
    <%@include file="../partial/head.jsp" %>
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
                <div class="infomain">
                <!--화면의 유저 아이디를 가지고 정보수정으로 넘어가야한다. -->
                <input type="hidden" name="user_id" value="${user_id}">
                <div>
                <a href="../user/infoModify">정보수정하기</a>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>
