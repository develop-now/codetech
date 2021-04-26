
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>ManagerList Page</title>
    <%@include file="../partial/head.jsp" %>
    
        <script>
     $(document).ready(function () {
    	 $('#grant').click(function() {
    			location.href="${pageContext.request.contextPath}/owner/grantAdmin";
    	 })
     })
    </script>
    
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
            <%@include file="owner-nav.jsp"%>
            
			            <div class="col-12 col-sm-10">
			            <br>
							<h3 class="text-right">관리자 리스트</h3>
							<br>
						
						
						<div class="col-12">
							<table class="table table-hover text-center">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">관리자 이름</th>
										<th scope="col">관리자 정보</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="userInfo" items="${userInfo}"
										varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td>${userInfo.user_name}</td>
											<td><a href="managerDetail?user_id=${userInfo.user_id}">정보</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<div class="col-2" style="text-align:center;">
                            <button class="btn btn-sm btn-warning" id="grant" >관리자 등록</button>
                        </div>
					</div>
				</div>
			</div>




	<%-- footer --%>
	<%@include file="../partial/footer.jsp"%>
		</div>
	<!-- /.container -->
	
	
</body>
</html>