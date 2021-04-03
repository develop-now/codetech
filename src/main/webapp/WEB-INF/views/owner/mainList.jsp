<%@ page language="java" 
    pageEncoding="UTF-8"%>
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

        <h1 class="my-4">이번달 랭킹1위
          <small>커피HTA 종로1호점</small>
        </h1>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">커피HTA 종로1호점</h2>
            <p class="card-text">한번도 안먹어본 사람은 있어도 한번만 먹어본 사람은 없다는 전설적인 카페 맛집.</p>
            <a href="#" class="btn btn-primary">주문하기 &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            좋아요, 댓글 개수 보여주는 자리
            <a href="#">Start Bootstrap</a>
          </div>
        </div>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">Post Title</h2>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
            <a href="#" class="btn btn-primary">Read More &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on January 1, 2020 by
            <a href="#">Start Bootstrap</a>
          </div>
        </div>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">Post Title</h2>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
            <a href="#" class="btn btn-primary">Read More &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on January 1, 2020 by
            <a href="#">Start Bootstrap</a>
          </div>
        </div>

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
