<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 5:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Store Customers Page</title>
    <%@include file="../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-customers.js"></script>

    <c:forEach var="store" items="${store_list}" begin="0" end="0">
        <c:set var="first_store_id" value="${store.store_id}"/>
        <c:set var="first_store_name" value="${store.store_name}"/>
    </c:forEach>

    <script>
        $(() => {
            const first_store_id = '${first_store_id}';
            const first_store_name = '${first_store_name}';

            loadStoreCustomer(first_store_id, first_store_name);
        })
    </script>
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
                            <h3 class="text-right">가게 단골 리스트</h3>
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
                                                       onclick="loadStoreCustomer('${store.store_id}', '${store.store_name}')">
                                                            ${store.store_name}
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="col-12 mb-3 d-flex justify-content-end">
                            <div class="mr-auto d-none" id="loadMore--wrapper">
                                <button class="btn btn-sm btn-success" id="loadMoreBtn">더보기</button>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="customer_name" name="customer_order_key"
                                       class="custom-control-input" value="customer_name">
                                <label class="custom-control-label" for="customer_name">이름순</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order_count" name="customer_order_key"
                                       class="custom-control-input" value="order_count" checked>
                                <label class="custom-control-label" for="order_count">주문 횟수 순</label>
                            </div>
                        </div>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="container store-customers__wrapper">
                            <div class="col-12">
                                <h3 class="text-primary">
                                    <i class="fas fa-store"></i> <span id="store_name"></span>
                                </h3>
                                <h6 class="text-info text-right">
                                    단골 회원수: <span id="customer_count"></span>명
                                </h6>
                            </div>
                            <div class="col-12">
                                <table class="table table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">손님 이름</th>
                                        <th scope="col">주문 횟수</th>
                                    </tr>
                                    <tr id="customer_template_tr" class="d-none">
                                        <th scope="row" class="customer_count"></th>
                                        <td class="customer_name"></td>
                                        <td class="customer_order_count"></td>
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
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>