<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 1:12 오후
  To change this partial use File | Settings | File partials.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Landing Page</title>
    <%@include file="WEB-INF/views/partial/head.jsp" %>
</head>
<body>
<div class="container-fluid px-0 pb-5">
    <%--    info Modal      --%>
    <%@include file="WEB-INF/views/partial/infoModal.jsp" %>

    <%--    alert Modal      --%>
    <%@include file="WEB-INF/views/partial/alertModal.jsp" %>


    <div class="container-fluid">
        <h3>Landing Page</h3>
        <a href="<c:url value="/home"/>" class="btn btn-block btn-success">홈으로</a>
    </div>

    <%@include file="WEB-INF/views/partial/footer.jsp" %>
</div>
</body>
</html>
