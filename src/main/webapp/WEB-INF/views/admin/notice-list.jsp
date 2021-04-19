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
		background: white;
		text-align: center;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		margin: 30px 0px;
		border-top: 1px solid #4e3418;
		border-bottom: 1px solid #C3C3D1;
		
	}
	
	.notice_select_list > div{
		padding: 20px;
	}
	
	.noticeAll:hover {
		background: #F2F2F8; 
		cursor: pointer
	}
	
	.noticeNews:hover {
		background: #F2F2F8;
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
		display: grid;
		grid-template-columns: 4fr 1fr;
		margin: 20px 0px;
		border-top: 1px solid #C3C3D1;
	}
	
	.notice_list_grid > div {
		border-bottom: 1px solid #e2e2d0;
	}
	
	.notice_list_grid div:nth-last-child(-n + 2) {
		border-bottom: 1px solid #C3C3D1;
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
            <div class="col-12 col-sm-10">
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
            		<div class="noticeAll" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList';">전체</div>
            		<div class="noticeNews" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList?notice_status=0';">공지사항</div>
            		<div class="noticeEvent" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList?notice_status=1';">이벤트</div>
            		<div class="noticeCheck" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList?notice_status=2';">점검</div>
            	</div>
				
				<div class="notice_list_grid">
				<c:forEach var="notice" items="${noticelist}">
					<div style="margin: auto 0px; padding: 20px 5px;">
					<c:set var="sysdate" value="${notice.notice_date}"/>
						<c:choose>
							<c:when test="${notice.notice_status == 1}">
								<img src="${pageContext.request.contextPath}/resources/image/admin/notice.png" style="padding: 0px 20px"/>
								<span style="font-size:1.2em">${notice.notice_subject}</span>
							</c:when>
						
							<c:when test="${notice.notice_status == 2}">
								<img src="${pageContext.request.contextPath}/resources/image/admin/event.png" style="padding: 0px 20px"/>
								<span style="font-size:1.2em">${notice.notice_subject}</span>
							</c:when>
							
							<c:when test="${notice.notice_status == 3}">
								<img src="${pageContext.request.contextPath}/resources/image/admin/inspect.png" style="padding: 0px 20px"/>
								<span style="font-size:1.2em">${notice.notice_subject}</span>
							</c:when>
						</c:choose>
					</div>
					<div style="padding: 30px 0px;"><c:out value="${fn:substring(sysdate, 0, 10)}"/></div>
				</c:forEach>
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
