<%@ page language="java" 
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>List Page</title>
    <%@include file="indexCommon.jsp" %>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/mainlist/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/mainlist/css/blog-home.css" rel="stylesheet">

  <!-- SearchBar CSS  -->
  <link href="${pageContext.request.contextPath}/resources/css/owner/mainList.css" rel="stylesheet">
  

</head>

<body>



  <!-- Page Content -->
  <div class="container">

<!-- searchbar -->
<div class="topnav">
  <a href="${pageContext.request.contextPath}/owner/mainList">인기순</a> <!-- basic page -->
    <a class="active" href="${pageContext.request.contextPath}/owner/mapPage">거리순</a>
  <a href="${pageContext.request.contextPath}/owner/reviewListPage">리뷰순</a>
  <div class="search-container">
    <form action="/action_page.php">
      <input type="text" placeholder="Search.." name="search">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">이번달 랭커 카페
          <small>소개합니다!</small>
        </h1>

        <!-- Blog Post -->
      <c:forEach var="store" items="${stores}" varStatus="status">
      	<c:if test="${store.store_status == 1}">
      	
        <div class="card mb-4">
          <img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">${store.store_name}</h2>
            
            <p class="card-text">5분후 수령 가능</p>
            <a href="#" class="btn btn-primary">주문하기 &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            <img class="card-img-heart" src="${pageContext.request.contextPath}/resources/upload/love.png"
											width="30" height="30" alt=""> ${likes[status.index]}&nbsp;&nbsp;<img
											class="card-img-comments" src="${pageContext.request.contextPath}/resources/upload/message.png"
											width="30" height="30" alt="">&nbsp;${comments[status.index]}
          </div>
        </div>
        </c:if>
        
          	<c:if test="${store.store_status == 2}">
      	
        <div class="card mb-4">
          <img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}" alt="Card image cap" style="filter:blur(5px)">
          <div class="card-body">
            <h2 class="card-title">${store.store_name}</h2>
            
            <p class="card-text">${store.store_name}</p>
            <a href="#" class="btn btn-primary" style="background-color: gray">준비중 &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            <img class="card-img-heart" src="${pageContext.request.contextPath}/resources/upload/love.png"
											width="30" height="30" alt=""> ${likes[status.index]}&nbsp;&nbsp;<img
											class="card-img-comments" src="${pageContext.request.contextPath}/resources/upload/message.png"
											width="30" height="30" alt="">&nbsp;${comments[status.index]}
          </div>
        </div>
        </c:if>
        
	</c:forEach>
      

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; Older</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">Newer &rarr;</a>
          </li>
        </ul>

      </div>



    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->



  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/mainlist/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/mainlist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
