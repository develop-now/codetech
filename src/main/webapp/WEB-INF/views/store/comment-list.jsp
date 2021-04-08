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
    <title>Store Comments List Page</title>
    <%@include file="../partial/head.jsp" %>
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
                        <div class="ml-auto mr-2">
                            <h3 class="text-right">리뷰 리스트</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="input-group ">
                                <div class="input-group-prepend">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">리스트 갯수 제한
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">5개씩 보기</a>
                                        <a class="dropdown-item" href="#">10개씩 보기</a>
                                        <a class="dropdown-item" href="#">20개씩 보기</a>
                                    </div>
                                </div>
                                <input type="text" class="form-control" aria-label="text input search store"
                                       name="search_value" placeholder="작성자 이름을 입력해주세요">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-info" type="button">Search</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <table class="table table-hover text-center">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">내용</th>
                                    <th scope="col">답변달기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>영업중</td>
                                    <td>링크</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>영업중</td>
                                    <td>링크</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Adrian</td>
                                    <td>휴일</td>
                                    <td>링크</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
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