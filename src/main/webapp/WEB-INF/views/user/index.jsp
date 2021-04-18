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
                <p>User Main Content</p>
                <button type="button" name="reported_store" onclick='goReportStore();' id="reported_store" value="store">가게신고</button>
                <button type="button" name="reported_store" onclick='goReportCmt();' id="reported_store" value="cmt">댓글신고</button>
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
