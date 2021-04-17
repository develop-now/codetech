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
    <title>Menu List Page</title>
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/menu-list.js"></script>
    <style>
        td img {
            width: 100%;
            max-height: 300px;
            object-fit: contain;
        }
    </style>

    <c:forEach var="store" items="${store_list}" begin="0" end="0">
        <c:set var="first_store_id" value="${store.store_id}"/>
        <c:set var="first_store_name" value="${store.store_name}"/>
    </c:forEach>

    <script>
        $(() => {
            const first_store_id = '${first_store_id}';
            const first_store_name = '${first_store_name}';

            loadStoreMenu(first_store_id, first_store_name);

            $("#menuAddBtn").on("click", () => {
                location.href = "/menu/menu-create"
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
                            <h3 class="text-right">메뉴 리스트</h3>
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
                                                       onclick="loadStoreMenu('${store.store_id}', '${store.store_name}')">
                                                            ${store.store_name}
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-group">
                                        <button class="btn btn-success btn-sm" id="menuAddBtn">메뉴추가</button>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="container store-menu__wrapper">
                            <div class="col-12">
                                <h3 class="text-primary">
                                    <i class="fas fa-store"></i> <span id="store_name"></span>
                                </h3>
                            </div>
                            <div class="col-12 table-responsive">
                                <table class="table table-hover text-center">
                                    <colgroup>
                                        <col style="width:5%">
                                        <col style="width:15%">
                                        <col style="width:10%">
                                        <col style="width:45%">
                                        <col style="width:10%">
                                    </colgroup>
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">가격(원)</th>
                                        <th scope="col">대표이미지</th>
                                        <th scope="col">상태</th>
                                    </tr>
                                    <tr id="menu_template_tr" class="d-none">
                                        <th scope="row" class="menu_count"></th>
                                        <td class="menu_link"></td>
                                        <td class="menu_price"></td>
                                        <td class="menu_image"></td>
                                        <td class="menu_status"></td>
                                    </tr>
                                    </thead>

                                    <tbody id="target-tbody">
                                    </tbody>


                                </table>
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