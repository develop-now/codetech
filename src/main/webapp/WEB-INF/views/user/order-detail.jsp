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
    <title>User Index</title>
    <%@include file="../partial/head.jsp" %>
<style>
	.userOrderDetail__body{
		display:flex;
		justify-content:center;
		border-radius:10px;
		background-color:#eeeeee;
		padding: 100px 0;
	}
	.userOrderDetail__body table tbody>tr>td{
		padding: 0 20px;
	} 
	#orderDetailbtn{
		background-color: rgb(132 143 209);
		border-radius:5px;
		margin:30px;
	}
</style>
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
               <div class="container userOrderDetail">
               		<div class="userContainer__header">
						<h2 class="text-right">주문상세</h2>
					</div>
					<hr>
					<div class="userOrderDetail__body ">
						<table>
							<thead>
								<tr class="text-center">
								<td colspan='2'  style="font-weight:bold">${detail[0].store_name}</td>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan='2' class="text-center">
									<c:choose>
											<c:when test="${order.order_status == 1}">
											주문 접수 완료
										</c:when>

											<c:when test="${order.order_status == 2}">
											주문 확인 완료
										</c:when>

											<c:when test="${order.order_status == 3}">
											조리중
										</c:when>

											<c:when test="${order.order_status == 4}">
											조리완료
										</c:when>

											<c:when test="${order.order_status == 5}">
											픽업완료
										</c:when>
										</c:choose>
									</td>
								
								</tr>
								<tr>
									<td>주문일</td>
									<td>${order.created_at}</td>
								</tr>
								<c:forEach var="detail" items="${detail}">
								<tr>
									<td>${detail.menu_name}&nbsp;X&nbsp;${detail.menu_quantity}</td>
									<td>${detail.detail_total_price}원</td>
								</tr>
								</c:forEach>
								<tr>
									<td>사용한포인트</td>
									<td>${point}P</td>
								</tr>
								<tr>
									<td>결제금액</td>
									<td>${order.order_total_price}</td>
								</tr>
								<tr>
									<td colspan='2' class="text-center">
										<button id="orderDetailbtn"onclick='location.href="../user/orderMain?store_id=${order.store_id}"'>가게보기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
               </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
    
    <script type="text/javascript">
    function goReportStore(){
    		var query = "reported_store=1"
    		location.href="user/reportWrite?" + query;
    	
    }
    function goReportCmt(){
		var query = "reported_cmt=1"
		location.href="user/reportWrite?" + query;
	
}
    	
    
    </script>
</div>
</body>
</html>
