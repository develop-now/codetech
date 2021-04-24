<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-report</title>
    <!-- 해당 아이디의 신고내역을 보여준다. 포인트와 비슷한 레이아웃, 신고분류, 처리과정보여주기 -->
    <%@include file="../partial/head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/users/mypage.css">
 	<script src="${pageContext.request.contextPath }/resources/js/user/mypage-report.js"></script>
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
                <div class="container mypageReport">
                	<div class="userContainer__header">
	              		<h2 class="text-right">신고내역</h2>
	              	</div>
	              		<hr>
	              	<input type="hidden" name="reportCount" id="reportCount" value="">
	              	<div class="mypageReport__body">
	              		<div class="mypageReport__body--radio">
	              			<div class="form-check">
							  <input class="form-check-input" type="radio" name="searchAll" id="searchAll" value="option1" checked>
							  <label class="form-check-label" for="searchAll">
							    전체보기
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="searchDone" id="SearchDone" value="option2">
							  <label class="form-check-label" for="exampleRadios2">
							   처리완료
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="searchPro" id="SearchPro" value="option3">
							  <label class="form-check-label" for="exampleRadios2">
							   처리중
							  </label>
							</div>
	              		</div>
	              		<table class="table report__table">
	              			<thead class="mypageReport__table-head">
	              				<tr>
	              					<td>No.</td>
	              					<td>신고제목</td>
	              					<td>등록일</td>
	              					<td>처리상태</td>
	              				</tr>
	              			</thead>
	              			<tbody >
	              			<c:forEach var="list" items="${list}" varStatus="status">
	              				<input type="hidden" value="${list.report_content}">
	              				<tr>
	              					<td>
	              						${ataus.index}
	              					</td>
	              					<td>
		              					<c:if test="${list.store_report_id ne 0 }">
		              					   <a href="../user/reportDetail?store_report_id=${list.store_report_id}">
		              						${list.report_subject}
		              					   </a>
		              					</c:if>
		              					<c:if test="${list.user_report_id ne 0 }">
		              					   <a  href="../user/reportDetail?user_report_id=${list.user_report_id}">
		              						${list.report_subject}
		              					   </a>
		              					</c:if>
	              					<td>
	              						${list.created_at}
	              					</td>
	              					<td>
		              					<c:if test="${list.report_status eq 1}">
		              						<span>등록완료</span>
		              					</c:if>
		              					<c:if test="${list.report_status eq 2}">
		              						<span>처리중</span>
		              					</c:if>
		              					<c:if test="${list.report_status eq 3}">
		              						<span>처리완료</span>
		              					</c:if>
	              					</td>
	              				</tr>
	              			</c:forEach>
	              			</tbody>
	              		</table>
	              		<div class="center-block">
	              			<ul class="reportPagination justify-content-center">
							</ul>
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
