<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 5:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store List Page</title>
    <%@include file="../partial/head.jsp" %>
    <style>
        tbody td:nth-child(4) {
            width: 50%;
        }
    </style>
</head>
<body>
<div class="container-fluid" id="bodyWrapper">
    <%-- main nav --%>
    <%@include file="../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <%@include file="store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <%--                        <div class="col-2">--%>
                        <%--                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>--%>
                        <%--                        </div>--%>
                        <div class="ml-auto">
                            <h3 class="text-right">가게 리스트</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>
                        <div class="col-12">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">가게이름</th>
                                    <th scope="col">가게상태</th>
                                    <th scope="col">대표이미지</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>영업중</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/resources/image/store/sample-store-image/1.jpg"
                                             class="img-thumbnail" alt="sample-menu-image">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>영업중</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/resources/image/store/sample-store-image/2.jpg"
                                             class="img-thumbnail" alt="sample-menu-image">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Adrian</td>
                                    <td>휴일</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/resources/image/store/sample-store-image/3.jpg"
                                             class="img-thumbnail" alt="sample-menu-image">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
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