<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 8:20 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div id="sideNav" class="col-12 col-sm-2">
	<div  class="mypage-logo"><strong>Owner 페이지</strong></div>

 <ul class="nav" id="storeNavWrapper">
		<li class="nav-item">
			<a href="${pageContext.request.contextPath}/owner/manager"
				class="nav-link">관리자 관리</a>
		</li>
		<li class="nav-item">
			<a href=javascript:void(0);" onclick="window.open('${pageContext.request.contextPath}/owner/chatM', 'chatStore', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');"
				class="nav-link">파트너 채팅</a>
		</li>


				
		
	</ul>
</div>