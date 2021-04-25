<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-report_detail</title>
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
                 <div class="container mypageReport">
                	<div class="userContainer__header">
	              		<h2 class="text-right">신고작성내용</h2>
	              	</div>
	              		<hr>
 							<div class="reportWrite-body">
							 <sec:authentication property="principal" var="pinfo"/>
							  <div class="form-group row">
								<label for="reporter" class="col-sm-2 col-form-label">
								<span>작성자</span>
								</label> 
								<input type="text" class="form-control" id="reporter" name="" 
								      		value="${pinfo.username}"readOnly>
							  </div>
							<c:choose>
							 <c:when test="${store_name ne null}">
							  <div class="form-group row">
								<label for="reported_store" class="col-sm-2 col-form-label">
								<span>가게이름</span>
								</label>  
								<input type="text" class="form-control" id="reported_store" 
								value="${store_name}" readOnly>
							  </div>
							 </c:when>
							 <c:otherwise>
							  <div class="form-group row">
								<label for="reported_cmt" class="col-sm-2 col-form-label">
								<span>댓글작성자</span>
								</label> 
								<input type="text" class="form-control" id="reported_user"
								value="${user_name}" readOnly> 
							  </div>
							 </c:otherwise>
							</c:choose>  
								
							  <div class="form-group row">
								<label for="report_subject" class="col-sm-2 col-form-label">
								<span>신고제목</span>
								</label>  
								<input type="text" class="form-control" id="report_subject" 
								value="${detail.report_subject} " readOnly>
							  </div>								 
							  
							  <div class="form-group row">
								<label for="report_content" class="col-sm-2 col-form-label">
								<span>신고내용</span>
								</label> 
								<textarea  class="form-control" id="report_content" readOnly
								 >${detail.report_content}</textarea>
							  </div>								

							</div>
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


