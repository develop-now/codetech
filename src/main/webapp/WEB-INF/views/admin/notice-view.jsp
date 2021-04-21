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
<style>
	.notice_h3 {
		margin-top: 20px;
		margin-bottom: 40px
	}
	
	.Not_subject {
		background: #f8f2ec;
		display: grid;
		grid-template-columns: 4fr 1fr 2fr; 
		border-top: 1px solid #4e3418;
		border-bottom: 1px solid #e2e2d0;
		margin-top: 30px 0px;
	}
	
	/* 목록 버튼 css */
	#go-delete {
		border-radius: 5px;
		background: white;
		padding: 10px 25px;
		border: solid 1px #e2e2d0;	
	}
	#go-list {
		border-radius: 5px;
		background: white;
		padding: 10px 25px;
		border: solid 1px #e2e2d0;	
	}
	
	#go-modify {
		border-radius: 5px;
		background: white;
		padding: 10px 25px;
		border: solid 1px #e2e2d0;	
	}
	
	#go-list:hover {
		border-radius: 5px;
		background: white;
		padding: 10px 25px;
		border: solid 1px #4e3418;
		
	}
	
	#go-delete:hover {
		border-radius: 5px;
		background: white;
		padding: 10px 25px;
		border: solid 1px #4e3418;
		
	}
	
	#go-modify:hover {
		border-radius: 5px;
		background: white;
		padding: 10px 25px;
		border: solid 1px #4e3418;
		
	}
	.Not_sysdate {
		display: grid;
		grid-template-columns: 5fr 0.5fr 0.5fr;
		padding: 30px 0px;
		border-bottom: 1px solid #e2e2d0;
	}
	
	.Not_content {
		padding: 30px;
		border-bottom: 1px solid #e2e2d0;
	}
</style>
    <title>Notice View</title>
    <%@include file="../partial/head.jsp" %> 
    
<script>
	$(function() {
		$(".go-delete").click(function(event) {
			var answer = confirm("해당 게시글을 삭제 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".go-modify").click(function(event) {
			var answer = confirm("해당 게시글을 수정 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
	});

	var result = "${result}";
	
	if (result == 'modifySuccess') {
		alert("공지사항 수정에 성공 했습니다.");
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
            	<!-- 넘어온 값 별 공지 제목 -->
            	<c:choose>
            		<c:when test="${noticeView.notice_status == 1}">
            			<h3 class="notice_h3">공지 사항</h3>
            		</c:when>
            		
            		<c:when test="${noticeView.notice_status == 2}">
            			<h3 class="notice_h3">이벤트</h3>
            		</c:when>
            		
            		<c:when test="${noticeView.notice_status == 3}">
            			<h3 class="notice_h3">점검 사항</h3>
            		</c:when>
            	</c:choose>
	    		<div>
		    		<div class="Not_subject">
		    			<div style="margin: 30px">
		    				<!-- status 별 제목에 이미지 넣기 밑 컨텐트에 이미지 넣기 작업 해볼 것 -->
		    				<b><span style="font-size:1.8em">${noticeView.notice_subject}</span></b>
		    			</div>
		    			<div></div>
		    			<div style="margin: 30px auto; text-algin: center;">
		    				<button type="button" name="go-delete" id="go-delete" class="go-delete"
		    					onClick="location.href='${pageContext.request.contextPath}/admin/noticeDelete?notice_id=${noticeView.notice_id}';">삭제</button>
		    				<button type="button" name="go-modify" id="go-modify" class="go-modify"
		    					onClick="location.href='${pageContext.request.contextPath}/admin/noticeModify?notice_id=${noticeView.notice_id}';">수정</button>
		    				<button type="button" name="go-list" id="go-list" class="go-list"
		    					onClick="location.href='${pageContext.request.contextPath}/admin/noticeList';">목록</button>
		    			</div>
		    		</div>
		    		
		    		<div class="Not_sysdate">
		    		<c:set var="sysdate" value="${noticeView.notice_date}"/>
		    			<div>&nbsp;&nbsp;&nbsp; 작성자: 관리자</div>
		    			<div>조회수: ${noticeView.notice_readcount}</div>
		    			<div><c:out value="${fn:substring(sysdate, 0, 10)}"/></div>
		    		</div>
		    		
		    		<div class="Not_content">
		    			${noticeView.notice_content}
		    		</div>	  
		    	</div>	    		
            </div>
        </div>
    </div>
    <!-- /.container -->


    <!-- Page Content -->
    <div class="container-fluid">
    	
    </div>
    <!-- /.container -->
	
    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>