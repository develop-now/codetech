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
    <title>order-list</title>
    <!-- side nav에서 주문내역 클릭하면 이동됨, 카페이름, 주문요약, 총액, 주문 상태, 확인가능
    카페보기링크, 리뷰작성링크, 주문상세는 모달로 보여짐 -->
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
            <div id="sideNav" class="col-12 col-sm-2">
                
            </div>
            <div class="col-12 col-sm-10">
                <p>User Main Content</p>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>
