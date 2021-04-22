<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-infoMain</title>
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
            <%@include file="owner-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container infomain">
              <%--   <input type="hidden" name="user_id" value="${user_id}"> --%>
	              	<div class="userContainer__header">
	              		<h2 class="text-right">관리자 관리</h2>
	              	</div>
	              		<hr>
	              	<div class="infomain__img">
	              		<img src="${pageContext.request.contextPath}/resources/upload${userInfo.user_profile}" alt="profile">
	              	</div>
	          
	              	<div class="infomain__list">
	              	<table class="infomain__list-table">
	              		<tr>
	              			<td><span>아이디</span></td>
	              			<td>${user.user_email}</td>
	              		</tr>
	              		<tr>
	              			<td><span>닉네임</span></td>
	              			<td>${userInfo.user_name}</td>
	              		</tr>
	              		<tr>
	              			<td><span>연락처</span></td>
	              			<td>${userInfo.user_tel}</td>
	              		</tr>
	              		<tr>
	              			<td><span>사번</span></td>
	              			<td>${userInfo.user_id}</td>
	              		</tr>
	              	</table>
              		</div>
	                <div class="infomain__link">
	                <span><button type="button" onclick="history.back()">목록으로</button></span>
		            <span><button type="button" id="revoke">권한 회수</button></span>
	                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
    
    <script>
    
    $(document).ready(function(){
        
        $('#revoke').click(function() {
        	
        	if(!confirm('정말 삭제하시겠습니까')) {
        		return;
        	}
    	
    		$.ajax({
    			url: "revoke",
    			data: {user_id:'${userInfo.user_id}'},
    			success:function(rdata){
    				if(rdata == 1){
    					location.href = "history.back();";
    				}
    			}
    		})
    	})
    })
    

    </script>
</div>
</body>
</html>
