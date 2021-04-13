<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>ManagerList Page</title>
<%@include file="indexCommon.jsp"%>

</head>
<body>

	<!-- Page Content -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-sm-10">
				<div class="container">
					<div class="row mt-5">
						<div class="ml-auto mr-2">
							<h3 class="text-right">관리자 리스트</h3>
						</div>
						<div class="w-100">
							<hr>
						</div>
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
									<c:forEach var="userInfo" items="${userInfo}" varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td>${userInfo.user_name}</td>
											<td><a href="managerDetail?user_id=${userInfo.user_id}">정보</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

</body>
</html>