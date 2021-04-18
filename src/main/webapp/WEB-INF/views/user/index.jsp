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
                <button type="button" name="reported_cmt" id="reported_cmt" value="cmt">댓글신고</button>
                <button type="button" name="reported_store" id="reported_store" value="store">가게신고</button>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
    
    <script type="text/javascript">
    	$('#reported_store').click(function(){
    		/* var store_id = 선택폼의 input에 store_num이 들어있어야함.값을 가지고 컨트롤러로 이동한다. comment.js참고
    		*/
    	})
    	$('#reported_cmt').click(function(){
    		/* var commrent_id = 선택폼의 input에 comment_num이 들어있어야함.값을 가지고 컨트롤러로 이동한다. */
    	})
    </script>
</div>
</body>
</html>
