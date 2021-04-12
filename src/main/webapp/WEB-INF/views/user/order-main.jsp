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
    <title>order-main</title>
    <!-- 가게에서 주문하기를 클릭하면 이곳으로 이동됨, (toggle에서 필요하지 않음. sidenav에서 주문하기를 클릭하면 다시 가게 리스트찾는 페이지로 돌아감 
    메뉴 + 를 하면 메뉴에 옵션선택이 가능한 modal이 출력됨. 추가하기 하면 화면의 right bar에서 추가한 아이템들이 보여짐(이때 테이블에 저장은 아니고 잠시 저장될 곳이 어디인지 
    확인해봐야함. 같은 옵션의 메뉴 개수를 수정할 수 있음 -> 이에따라 메뉴당 금액과 총금액이 변동되어야 함
    가게 좋아요를 할 수 있으며 좋아요 아이콘이 추가되면 즐겨찾기리스트에 가게 id가 추가됨. 
    -->
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
