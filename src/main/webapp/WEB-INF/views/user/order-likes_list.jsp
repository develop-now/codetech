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
    <title>order-likes_list</title>
    <!-- 주문하기 페이지에서 아이콘으로 설정가능, 가게아이디가 likes테이블에 담기면 그 테이블을 가져와서 리스트로 보여줌. 메인페이지에 가게보기와 구성이 비슷할예정 -->
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
