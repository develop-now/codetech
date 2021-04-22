<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--<script src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/user/join.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/report.js"></script>

<%--Change Daum Postcode Version--%>
<%--<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/store/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/users/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/users/join.css">