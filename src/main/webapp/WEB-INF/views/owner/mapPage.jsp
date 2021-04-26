<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<%@include file="../partial/head.jsp"%>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Map Page</title>


<!-- 지도 API 불러오기, src="// : 상대 프로토콜, 사용자의 http, https 환경에 따라 자동으로 해당 프로토콜 준수 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e946bed5a65161662be25b84ec50e9c"></script>

<!-- JS of Loading Map -->
<script
	src="${pageContext.request.contextPath}/resources/js/owner/mapPage.js"></script>

<!-- SearchBar CSS  -->
<link
	href="${pageContext.request.contextPath}/resources/css/owner/mainList.css"
	rel="stylesheet">

<!-- SearchBar JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/owner/search.js"></script>

</head>

<body>
	<div class="container-fluid px-0">

		<%-- main nav --%>
		<%@include file="../partial/nav.jsp"%>

		<%-- info Modal --%>
		<%@include file="../partial/infoModal.jsp"%>

		<%-- alert Modal --%>
		<%@include file="../partial/alertModal.jsp"%>

		<!-- Page Content -->
		<div class="container-fluid">
			<div class="row1">
				<div class="col-12 col-sm-10">
					<div class="container">


						<!-- searchbar -->
						<div class="topnav">
							<a href="${pageContext.request.contextPath}/owner/mainList">인기순</a>
							<a class="active"
								href="${pageContext.request.contextPath}/owner/mapPage">거리순</a>
							<a href="${pageContext.request.contextPath}/owner/reviewListPage">리뷰순</a>
							<div class="search-container">
								<form
									action="${pageContext.request.contextPath}/owner/searchList"
									method="get">
									<input type="text" placeholder="Search.." name="searchWord"
										id="search">
									<button type="submit">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</div>
						</div>

						<div class="row">

							<!-- map -->
							<div class="container">
								<div id="map" style="width: 1100px; height: 600px;"></div>
							</div>

						</div>
						<!-- /.row -->
					</div>
					<!-- container -->
				</div>
				<!-- col-12 col-sm-10 -->
			</div>
			<!-- row1 -->

			<%-- footer --%>
			<%@include file="../partial/footer.jsp"%>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- container-fluid px-0 -->

</body>

</html>
