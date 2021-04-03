<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 1:12 오후
  To change this partial use File | Settings | File partials.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home Page</title>
    <%@include file="partial/head.jsp" %>
</head>
<body>
<div class="container-fluid px-0 pb-5">
    <%@include file="partial/nav.jsp" %>

    <%--    info Modal      --%>
    <%@include file="partial/infoModal.jsp" %>

    <%--    alert Modal      --%>
    <%@include file="partial/alertModal.jsp" %>


    <div class="container-fluid">
        <!-- Jumbotron Header -->
        <header class="jumbotron my-4">
            <h1 class="display-3">A Warm Welcome!</h1>
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt
                possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam
                repellat.</p>
            <a href="owner/mainList" class="btn btn-primary btn-lg">주문하러 가기!</a>
        </header>

        <!-- Page Features -->
        <div class="row text-center">

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="http://placehold.it/500x325" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse
                            necessitatibus neque.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="http://placehold.it/500x325" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni
                            sapiente, tempore debitis beatae culpa natus architecto.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="http://placehold.it/500x325" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse
                            necessitatibus neque.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="http://placehold.it/500x325" alt="">
                    <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni
                            sapiente, tempore debitis beatae culpa natus architecto.</p>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%@include file="partial/footer.jsp" %>
</div>
</body>
</html>
