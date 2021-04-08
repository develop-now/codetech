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
    <title>Notice List Index</title>
    <%@include file="../partial/head.jsp" %>
<style>	
	/* 왼쪽 상단 회원관리 글씨 CSS */
	.notice_h3 {
		margin: 20px 0px;
	}
	
	/* 메뉴 리스트 클릭 CSS */
	.notice_select_list {
		margin: 0 auto;
		width: 100%;
		height: 50px;
	}
	
	.notice_select_list ul {
		padding: 0px;
		list-style-type: none;
		width: 100%;
	}
	
	.notice_select_list ul li {
		float: left;
		width: 25%;
		line-height: 50px;
		text-align: center;
	}
	
	.notice_List {
		width: 100%;
		border-top: 2px solid #e2e2d0;
		border-collapse: collapse;
	}
	
	.notice_List th, td {
		border-bottom: 2px solid #e2e2d0;
		padding: 10px;
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
            	<div class="notice_div">
					<h3 class="notice_h3">공지 사항</h3>
					<input type="text" name="search_text" value="${search_word}">	
            	</div>
            	<div class="notice_select_list">
            		<ul>
            			<li><a href="/admin/noticeAll">전체</a></li>
            			<li><a href="/admin/noticeNews">공지사항</a></li>
            			<li><a href="/admin/noticeEvent">이벤트</a></li>
            			<li><a href="/admin/noticeCheck">점검</a></li>
            		</ul>
            	</div>
					
				<table class="notice_List">
					<tr>
						<th>[공지]</th>
						<td>공지사항 제목</td>
						<td>게시글 날짜</td>
					</tr>
				</table>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>
