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
    <title>mypage-point</title>
    <!-- 포인트 내역을 테이블로 보여주기 가게, 결제금액, 포인트 적립, total 
    가게 클릭할 경우 가게로 이동, 주문내역 보기 할경우 주문내역으로 이동-->
    <%@include file="../partial/head.jsp" %>
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
                <div class="container pointList">
                	<div class="userContainer__header">
	              		<h2 class="text-right">포인트</h2>
	              	</div>
              		<hr>
              		<div>
              			<span>내 포인트 :P</span>
              		</div>
              		<div class="pointList__body">
              		<div class="pointList__table">
	                	<table class="table">
	                		<thead class="pointList__table-head">
	                			<tr>
	                				<td></td>
	                				<td>결제 금액</td>
	                				<td>적립 포인트</td>
	                			</tr>
	                		</thead>
	                		<tbody>
	                			<tr>
	                				<td>a카페</td>
	                				<td>47,300원</td>
	                				<td>473p</td>
	                			</tr>
	                		</tbody>
	                	</table>
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
</body>
</html>
