<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 문자열 추출을 위한 태그 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Notice List Index</title>
    <%@include file="../partial/head.jsp" %>
<style>
	/* 메뉴 리스트 클릭 CSS */
	.notice_head {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr; 
		margin: 20px 0px;
	}
	
	.notice_select_list {
		text-align: center;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		margin: 30px 0px;
		color: #737373;
		background: #fafafa
	}
	
	.noticeAll {
		border-top: 1px solid #e2e2d0;
		border-left: 1px solid #e2e2d0;
		border-bottom: 1px solid #C3C3D1;
	}
	
	.noticeNotice {
		border-top: 7px solid #392714;
		border-left: 1px solid #392714;
		border-right: 1px solid #392714;
		color: #392714;
		background: white;
	}
	
	.noticeEvent {
		border-top: 1px solid #e2e2d0;
		border-right: 1px solid #e2e2d0;
		border-bottom: 1px solid #C3C3D1;
	}
	
	.noticeCheck {
		border-top: 1px solid #e2e2d0;
		border-right: 1px solid #e2e2d0;
		border-bottom: 1px solid #C3C3D1;
	}
	
	.notice_select_list > div{
		padding: 20px;
	}
	
	.noticeAll:hover {
	background: #F2F2F8;
		cursor: pointer
	}
	
	.noticeNotice:hover {	
		cursor: pointer
	}
	
	.noticeEvent:hover {
		background: #F2F2F8;
		cursor: pointer
	}
	
	.noticeCheck:hover {
		background: #F2F2F8; 
		cursor: pointer
	}
	
	.notice_list_grid {
		width: 100%;
		border-collapse: collapse;
		
	}
	
	.notice_list_grid tr:hover {
		background: #F2F2F8;
	}
	
	.notice_list_grid td {
		border-top: 1px solid #C3C3D1;
		border-bottom: 1px solid #e2e2d0;
		padding: 15px 0px;
	}
	
</style>
<script>
	console.log($("input[name='notice_status']").val());

	var result = "${result}";
	
	if (result == 'deleteSuccess') {
		alert("공지사항을 삭제 했습니다.");
	}
</script>
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
            <div class="col-12 col-sm-10">
	            <form action="noticeNotice">
	            	<div class="notice_head">
	            		<div><h3 class="notice_h3">공지 사항</h3></div>
	            		<div></div>
	            		<div></div>
	            		<div style="text-align: right; border: 1px solid #999999; margin: auto;">
	            			<label style="padding: 6px 20px; margin: 0px; border-right: 1px solid #999999;">제목</label>
	            			<input type="text" name="search_text" value="${search_word}"
	            					style="width: 250px; margin: 5px; border: none">
	            					
	            			<input type="hidden" name="notice_status" value="0"/>
	            		</div>
	            	</div>
	            	
	            	<div class="notice_select_list">
	            		<div class="noticeAll" onclick="location.href='${pageContext.request.contextPath}/admin/noticeAll';">전체</div>
	            		<div class="noticeNotice" onclick="location.href='${pageContext.request.contextPath}/admin/noticeNotice';">공지사항</div>
	            		<div class="noticeEvent" onclick="location.href='${pageContext.request.contextPath}/admin/noticeEvent';">이벤트</div>
	            		<div class="noticeCheck" onclick="location.href='${pageContext.request.contextPath}/admin/noticeCheck';">점검</div>
	            	</div>
	            	
					<table class="notice_list_grid">
						<c:forEach var="notice" items="${noticelist}">
						<c:set var="sysdate" value="${notice.notice_date}"/>
						<tr>
							<td>
							<c:choose>
								<c:when test="${notice.notice_status == 1}">
									<img src="${pageContext.request.contextPath}/resources/image/admin/NOTICE.png" style="padding: 0px 20px;"/>
									<span style="font-size:1.0em"><a href="noticeView?notice_id=${notice.notice_id}">${notice.notice_subject}</a></span>
								</c:when>
							
								<c:when test="${notice.notice_status == 2}">
									<img src="${pageContext.request.contextPath}/resources/image/admin/EVENT.png" style="padding: 0px 20px"/>
									<span style="font-size:1.0em"><a href="noticeView?notice_id=${notice.notice_id}">${notice.notice_subject}</a></span>
								</c:when>
								
								<c:when test="${notice.notice_status == 3}">
									<img src="${pageContext.request.contextPath}/resources/image/admin/CHECK.png" style="padding: 0px 20px"/>
									<span style="font-size:1.0em"><a href="noticeView?notice_id=${notice.notice_id}">${notice.notice_subject}</a></span>
								</c:when>
							</c:choose>
							</td>
							<td><c:out value="${fn:substring(sysdate, 0, 10)}"/><td>
						</tr>
						</c:forEach>
					</table>
					
					<div style="margin: 50px;">
			        <ul class="pagination justify-content-center">
			            <c:if test="${page <= 1}">
			                 <li class="page-item"><a class="page-link current" href="#">이전&nbsp;</a></li>
			            </c:if>
			
			            <c:if test="${page > 1}">
			                  <li class="page-item"><a
			                     href="noticeNotice?page=${page-1}&search_word=${search_text}&notice_status=${notice.notice_status}"
			                     class="page-link">이전</a>&nbsp;
			                  </li>
			            </c:if>
			
			
			            <c:forEach var="a" begin="${startpage}" end="${endpage}">
			                  <c:if test="${a == page }">
			                     <li class="page-item"><a class="page-link current" href="#">${a}</a></li>
			                  </c:if>
			
			                  <c:if test="${a != page }">
			                     <li class="page-item"><a
			                        href="noticeNotice?page=${a}&search_word=${search_text}&notice_status=${notice.notice_status}"
			                        class="page-link">${a}</a>
			                     </li>
			                  </c:if>
			            </c:forEach>
			
			
			            <c:if test="${page >= maxpage }">
			                  <li class="page-item"><a class="page-link current" href="#">&nbsp;다음</a></li>
			            </c:if>
			
			            <c:if test="${page < maxpage }">
			                  <li class="page-item"><a
			                     href="noticeNotice?page=${page+1}&search_word=${search_text}&check_state=${check_state}"
			                     class="page-link">&nbsp;다음</a>
			                  </li>
						</c:if>
			        </ul>
			        </div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /.container -->

<%-- footer --%>
<%@include file="../partial/footer.jsp" %>
</body>
</html>
