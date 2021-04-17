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
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-comment.js"></script>

    <c:forEach var="store" items="${store_list}" begin="0" end="0">
        <c:set var="first_store_id" value="${store.store_id}"/>
        <c:set var="first_store_name" value="${store.store_name}"/>
    </c:forEach>

    <script>
        $(() => {
            const first_store_id = '${first_store_id}';
            const first_store_name = '${first_store_name}';

            loadStoreComment(first_store_id, first_store_name);

            $("#staffAddBtn").on("click", () => {
            })
        })
    </script>
</head>
<body>
<div class="container-fluid" id="bodyWrapper">
    <%-- main nav --%>
    <%@include file="../../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <%@include file="../store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="ml-auto mr-2">
                            <h3 class="text-right">리뷰 리스트</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <c:if test="${!empty store_list}">
                            <div class="col-12 mb-3">
                                <div class="btn-toolbar justify-content-between" role="toolbar">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                내 가게 리스트
                                            </button>
                                            <div class="dropdown-menu">
                                                <c:forEach var="store" items="${store_list}" varStatus="status">
                                                    <a class="dropdown-item" href="#"
                                                       onclick="loadStoreComment('${store.store_id}', '${store.store_name}')">
                                                            ${store.store_name}
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="col-12 mb-3">
                            <div class="input-group ">
                                <div class="input-group-prepend">
                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">리스트 갯수 제한
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#" onclick="limitChange(5)">5개씩 보기</a>
                                        <a class="dropdown-item" href="#" onclick="limitChange(10)">10개씩 보기</a>
                                        <a class="dropdown-item" href="#" onclick="limitChange(20)">20개씩 보기</a>
                                    </div>
                                </div>
                                <input type="text" class="form-control" aria-label="text input search store"
                                       name="search_value" id="search_value" placeholder="작성자 이름이나 이메일을 입력해주세요">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-success" type="button" id="SearchBtn">Search</button>
                                    <button class="btn btn-outline-info" type="button" id="resetBtn">Reset</button>
                                </div>
                            </div>
                        </div>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="container store-staff__wrapper">
                            <div class="col-12">
                                <h3 class="text-primary">
                                    <i class="fas fa-store"></i> <span id="store_name"></span>
                                </h3>
                                <h6 class="text-info text-right">
                                    댓글갯수: <span id="comment_count"></span>개
                                </h6>
                            </div>
                            <div class="col-12 table-responsive">
                                <table class="table table-hover text-center">
                                    <colgroup>
                                        <col style="width:5%">
                                        <col style="width:15%">
                                        <col style="width:45%">
                                        <col style="width:20%">
                                        <col style="width:15%">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">내용</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">답변달기</th>
                                    </tr>
                                    <tr id="comment_template_tr" class="d-none">
                                        <th scope="row" class="comment_count"></th>
                                        <td class="comment_writer"></td>
                                        <td class="comment_content"></td>
                                        <td class="comment_date"></td>
                                        <td class="comment_reply"></td>
                                    </tr>
                                    </thead>
                                    <tbody id="target-tbody">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">

                                    </ul>
                                </nav>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../../partial/footer.jsp" %>
</div>
</body>
</html>