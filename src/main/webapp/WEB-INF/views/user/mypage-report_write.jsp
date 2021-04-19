<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage-report-write</title>
    <!-- 리뷰, 가게보기에서 신고하기를 클릭할 경우 들어오는 신고작성 페이지 -->
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
            <%@include file="user-nav-mypage.jsp"%>
            <div class="col-12 col-sm-10">
                <div class="container mypageReport">
                	<div class="userContainer__header">
	              		<h2 class="text-right">신고작성</h2>
	              	</div>
	              		<hr>
						<form action="<c:url value="/user/addReport"/>" method="post" 
								name="reportWriteForm" id="reportWriteForm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_crsf.token}">
 							<div class="reportWrite-body">
							 <sec:authentication property="principal" var="pinfo"/>
							  <div class="form-group row">
								<label for="reporter" class="col-sm-2 col-form-label">
								<span>작성자</span>
								</label> 
								<input type="text" class="form-control" id="reporter_email" name="reporter_email" 
								      		value="${pinfo.username}"readOnly>
							  </div>
							<c:choose>
							 <c:when test="${reported_user eq ''}">
							 <input type="hidden" name="store_id" value="${reported_store.store_id}">
							  <div class="form-group row">
								<label for="reported_store" class="col-sm-2 col-form-label">
								<span>가게이름</span>
								</label>  
								<input type="text" class="form-control" id="reported_store" 
								value="${reported_store.store_name }" readOnly>
							  </div>
							 </c:when>
							 <c:otherwise>
							  <div class="form-group row">
							  	<input type="hidden" name="comment_id"value="${reported_user.comment_id}">
							  	
								<label for="reported_cmt" class="col-sm-2 col-form-label">
								<span>댓글내용</span>
								</label>  
								<textarea  class="form-control" id="reported_cmt"
								 readOnly>${reported_user.comment_content }</textarea>
							  </div>
							 </c:otherwise>
							</c:choose>  
								
							  <div class="form-group row">
								<label for="report_subject" class="col-sm-2 col-form-label">
								<span>신고제목</span>
								</label>  
								<input type="text" class="form-control" id="report_subject" name="report_subject"
											placeholder="신고제목을 입력하세요" required>
							  </div>								 
							  
							  <div class="form-group row">
								<label for="report_content" class="col-sm-2 col-form-label">
								<span>신고내용</span>
								</label> 
								<textarea  class="form-control" id="report_content" name="report_content"
								placeholder="신고내용을 입력하세요" required></textarea>
							  </div>								

							</div>
							<div class="reportWrite-footer">
								<button type="submit" class="float-right">신고등록</button>
							</div>
						</form>
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
