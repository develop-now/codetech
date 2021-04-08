<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>List Page</title>
<%@include file="indexCommon.jsp"%>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/owner/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/owner/blog-home.css"
	rel="stylesheet">

<!-- SearchBar CSS  -->
<link
	href="${pageContext.request.contextPath}/resources/css/owner/mainList.css"
	rel="stylesheet">

<!-- SearchBar JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/owner/search.js"></script>

</head>

<body>



	<!-- Page Content -->
	<div class="container">

		<!-- searchbar -->
		<div class="topnav">
			<a href="${pageContext.request.contextPath}/owner/mainList">인기순</a>
			<!-- basic page -->
			<a class="active"
				href="${pageContext.request.contextPath}/owner/mapPage">거리순</a> <a
				href="${pageContext.request.contextPath}/owner/reviewListPage">리뷰순</a>
			<div class="search-container">
				<form action="${pageContext.request.contextPath}/owner/searchList"
					method="post">
					<input type="text" placeholder="Search.." name="searchWord"
						id="search">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 class="my-4">
					이번달 랭커 카페 <small>소개합니다!</small>
				</h1>

				<!-- Blog Post -->
				<c:forEach var="store" items="${stores}" varStatus="status">
					<c:if test="${store.store_status == 1}">

						<div class="card mb-4">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}"
								alt="Card image cap" style="height: 50% !important;">
							<div class="card-body">
								<h2 class="card-title">${store.store_name}</h2>

								<p class="card-text">5분후 수령 가능</p>
								<a href="#" class="btn btn-primary">주문하기 &rarr;</a>
							</div>
							<div class="card-footer text-muted">
								<img class="card-img-heart"
									src="${pageContext.request.contextPath}/resources/upload/love.png"
									width="30" height="30" alt="">
								${likes[status.index]}&nbsp;&nbsp;<%-- <img class="card-img-comments"
									src="${pageContext.request.contextPath}/resources/upload/message.png"
									width="30" height="30" alt="">&nbsp;${comments[status.index]} --%>
							</div>
						</div>
					</c:if>

					<c:if test="${store.store_status == 2}">

						<div class="card mb-4">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}"
								alt="Card image cap" style="filter: blur(5px)" style="height: 50% !important;">
							<div class="card-body">
								<h2 class="card-title">${store.store_name}</h2>

								<p class="card-text">${store.store_name}</p>
								<a href="#" class="btn btn-primary"
									style="background-color: gray">준비중 &rarr;</a>
							</div>
							<div class="card-footer text-muted">
								<img class="card-img-heart"
									src="${pageContext.request.contextPath}/resources/upload/love.png"
									width="30" height="30" alt="">
								${likes[status.index]}&nbsp;&nbsp;<%-- <img class="card-img-comments"
									src="${pageContext.request.contextPath}/resources/upload/message.png"
									width="30" height="30" alt="">&nbsp;${comments[status.index]} --%>
							</div>
						</div>
					</c:if>

				</c:forEach>
		


			</div>
			<!-- /.col-md-8 -->



		</div>
		<!-- /.row -->
		
						
						<div class="row" id="moreAjax"></div>
		<c:if test="${more eq 1}">
				<!-- button for more -->
				<div class="card mb-4">
    <button class="pageInc btn btn-dark btn-lg" style="width: 300px;">더보기</button>
				
				</div>
				</c:if>
		
				
	</div>
	<!-- /.container -->

<script>
$(document).ready(function () {


//button for more
var page = 1;
$('.pageInc').click(function () {
    page += 1;
    $.get("${pageContext.request.contextPath}/owner/mainListAjax", {"page": page},
        function (data) {
            $("#moreAjax").append(data);
            	
        })

})

}
)

</script>

</body>

</html>
