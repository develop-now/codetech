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
<style>
	.notice_h3 {
		margin-top: 20px;
		margin-bottom: 40px
	}
	
	.Not_subject {
		display: grid;
		grid-template-columns: 5fr 1fr 1fr; 
		border-top: 1px solid #4e3418;
		border-bottom: 1px solid #e2e2d0;
		margin-top: 30px 0px;
	}
	
	/* 목록 버튼 css */
	#go-list {
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
	
	
	.Not_sysdate {
		display: grid;
		text-align: center;
		grid-template-columns: 5fr 1fr 1fr;
		padding: 30px 0px;
		border-bottom: 1px solid #e2e2d0;
	}
	
	.Not_content {
		padding: 30px;
	}
</style>
    <title>Notice View</title>
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
            <div class="col-12 col-sm-10">
            	<!-- 넘어온 값 별 공지 제목 -->
            	<%-- <c:choose>
            		<c:when test="${notice.status == 1}">
            			<h3 class="notice_h3">공지 사항</h3>
            		</c:when>
            		
            		<c:when test="${notice.status == 2}">
            			<h3 class="notice_h3">이벤트</h3>
            		</c:when>
            		
            		<c:when test="${notice.status == 3}">
            			<h3 class="notice_h3">점검 사항</h3>
            		</c:when>
            	</c:choose>	 --%>     		   	
                <h3 class="notice_h3">공지 사항</h3>
	    		<div>
		    		<div class="Not_subject">
		    			<div style="margin: 30px">
		    				<b><span style="font-size:1.8em">게시글 제목이 보여질 공간입니다.</span></b>
		    			</div>
		    			<div></div>
		    			<div style="margin: 30px auto; text-algin: center;">
		    				<button type="button" name="go-list" id="go-list">목록</button>
		    			</div>
		    		</div>
		    		
		    		<div class="Not_sysdate">
		    			<div></div>
		    			<div>조회수: 7777</div>
		    			<div>2021.04-19</div>
		    		</div>
		    		
		    		<div class="Not_content">
		    			내용이 표시 됩니다.
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