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
              			<span class="totalPoint">내 포인트 :&nbsp;${totalPoint}P</span>
              		</div>
              		<c:if test="${count ne 0 }">
              		<div class="rows">
						<select class="form-control pointList-viewcount" id="viewcount">
							<option value="4" selected>4</option>
							<option value="8">8</option>
							<option value="12">12</option>
							<option value="16">16</option>
						</select>
              		</div>
              		<div class="pointList__body">
	              		<div class="pointList__table">
	              		<input type="hidden" name="count" value="${count}">
		                	<table class="table">
		                		<thead class="pointList__table-head">
		                			<tr>
		                				<td>점포명</td>
		                				<td>결제금액</td>
		                				<td>적립 및 사용</td>
		                				<td></td>
		                			</tr>
		                		</thead>
		                		<tbody class="pointList__table-body">
		                		<c:forEach var="list" items="${list}">
		                			<tr>
		                				<td>${list.store_name}</td>
		                				<td>${list.order_total_price}원</td>
		                				<c:if test="${list.point_type eq 'get' }">
		                					<td>&#43;${list.point_value}p</td>
		                				</c:if>
		                				<c:if test="${list.point_type ne 'get' }">
		                					<td>&#8722;${list.point_value}p</td>
		                				</c:if>
		                				<td ><span class="pointList__table-body--btn">
		                					<a href='../user/orderDetail?order_id=${list.order_id}'>주문상세</a>
		                					</span></td>
		                			</tr>
		                		</c:forEach>
		                		</tbody>
		                	</table>
		                	
	              		</div>
	              		<div class="center-block">
	              			<ul class="pointPagination justify-content-center">
								<c:if test="${page <= 1 }">
									<li class="pointPage-item"><a class="link" style="background-color:white">이전</a>
									</li>
								</c:if>
								<c:if test="${page > 1 }">
									<li class="pointPage-item"><a href="pointList?page=${page-1}"
										class="link">이전</a></li>
								</c:if>
								<c:forEach var="n" begin="${startpage }" end="${endpage}">
									<c:if test="${n == page }">
										<li class="pointPage-item ">
										<a class="link" style="background-color:#6b9068ba; color:white;">${n}</a></li>
									</c:if>
									<c:if test="${n != page }">
										<li class="pointPage-item "><a href="pointList?page=${n}"
											class="link" >${n}</a></li>
									</c:if>
								</c:forEach>
			
								<c:if test="${page >= maxpage }">
									<li class="pointPage-item">
									<a class="link" style="background-color:white">다음</a>
									</li>
								</c:if>
								<c:if test="${page < maxpage }">
									<li class="pointPage-item"><a href="pointList?page=${page+1 }"
										class="link">다음</a></li>
								</c:if>
							</ul>
	              		</div>
              		</div>
              	  </c:if>
              	  <c:if test="${count eq 0 }">
              	  	<div class="noPointList">
              	  	  <div>포인트 내역이 없습니다.</div> 
              	  	 <div><button onclick="location.href='${pageContext.request.contextPath}/owner/mainList'">주문하러 가기</button></div>
              	  	</div>
              	  </c:if>
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
