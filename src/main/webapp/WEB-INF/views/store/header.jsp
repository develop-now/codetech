<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body>nav.navbar {
	justify-content: flex-end; /*오른쪽정렬*/
}

.dropdown-menu {
	min-width: 0rem;
}

/*nav 색상 지정 */
.navbar {
	background: #be9f7b;
	margin-bottom: 3em;
	padding-right: 3em;
}

.navbar-dark .navbar-nav .nav-link {
	color: rgb(255, 255, 255);
}

textarea {
	resize: none;
}

.sidenav {
	width: 130px;
	z-index: 1;
	top: 20px;
	left: 10px;
	background: #be9f7b;
	overflow-x: hidden;
	padding: 8px 0;
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 25px;
	color: black;
	display: block;
}

.sidenav a:hover {
	color: #064579;
}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #be9f7b;
   color: white;
   text-align: center;
</style>

</head>
<body>

	<!-- navigation -->
	<nav class="navbar navbar-expand-sm navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#"> 로그아웃</a></li>
			<li class="nav-item"><a class="nav-link" href="#">정보</a></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown">메뉴</a>

				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">메뉴1</a> <a class="dropdown-item"
						href="#">메뉴2</a>
				</div></li>
		</ul>
	</nav>

	<!-- sidebar -->
	<div class="sidenav">
		<a href="#about">보기1</a> <a href="#services">보기2</a> <a
			href="#clients">보기3</a> <a href="#contact">보기4</a>
	</div>

<!-- footer -->
<div class="footer">
  <p>Footer</p>
</div>

</body>
</html>