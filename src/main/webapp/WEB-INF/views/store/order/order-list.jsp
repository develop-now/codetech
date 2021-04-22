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
    <title>Store Order List Page</title>
    <%@include file="../../partial/head.jsp" %>
    <%@include file="../../partial/dateTimePicker.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/order-list.js"></script>

    <c:forEach var="store" items="${store_list}" begin="0" end="0">
        <c:set var="first_store_id" value="${store.store_id}"/>
        <c:set var="first_store_name" value="${store.store_name}"/>
    </c:forEach>

    <script>
        $(() => {
            const first_store_id = '${first_store_id}';
            const first_store_name = '${first_store_name}';

            loadStoreOrder(first_store_id, first_store_name);
            loadOrderStatus()
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
                            <h3 class="text-right">오더 리스트</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <div class="row mb-3">
                                <c:if test="${!empty store_list}">
                                    <div class="col-4">
                                        <div class="btn-toolbar justify-content-between" role="toolbar">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <button class="btn btn-outline-secondary dropdown-toggle"
                                                            type="button"
                                                            data-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                        내 가게 리스트
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <c:forEach var="store" items="${store_list}" varStatus="status">
                                                            <a class="dropdown-item" href="#"
                                                               onclick="loadStoreOrder('${store.store_id}', '${store.store_name}')">
                                                                    ${store.store_name}
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <%-- Date Start --%>
                                <div class="col-8 ml-auto">
                                    <div class="input-group justify-content-end">
                                        <div class="input-group-append">
                                            <input type="text" class="form-control"
                                                   aria-label="select order detail date"
                                                   name="search_value" placeholder="" id="orderCurrentDate" readonly>
                                        </div>
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-info" type="button" id="orderDateSelectBtn">
                                                날짜 변경
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <%-- Date End --%>
                            </div>
                        </div>

                        <div class="col-12 mb-3 d-flex justify-content-end">
                            <div class="mr-auto d-none" id="loadMore--wrapper">
                                <button class="btn btn-sm btn-success" id="loadMoreBtn">더보기</button>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order_user" name="customer_order_key"
                                       class="custom-control-input" value="order_user">
                                <label class="custom-control-label" for="order_user">이름순</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order_date" name="customer_order_key"
                                       class="custom-control-input" value="order_date" checked>
                                <label class="custom-control-label" for="order_date">최신순</label>
                            </div>
                        </div>

                        <div class="w-100">
                            <hr>
                        </div>

                        <%-- Radio Start --%>
                        <div class="col-12 mb-3" id="status_target">
                            <div class="custom-control custom-radio custom-control-inline status_template">
                                <input type="radio" id="order_all" name="order-status"
                                       class="custom-control-input" value="0" checked>
                                <label class="custom-control-label" for="order_all">전체보기</label>
                            </div>
                        </div>
                        <%-- Radio End --%>

                        <div class="container store-order__wrapper">
                            <div class="col-12">
                                <h3 class="text-primary">
                                    <i class="fas fa-store"></i> <span id="store_name"></span>
                                </h3>
                                <h6 class="text-info text-right">
                                    오더수: <span id="order_count"></span>개
                                </h6>
                            </div>

                            <div class="col-12">
                                <table class="table table-sm table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">주문번호</th>
                                        <th scope="col">주문자</th>
                                        <th scope="col">주문일시</th>
                                        <th scope="col">주문상태</th>
                                        <th scope="col">상태변경</th>
                                        <th scope="col">상세메뉴</th>
                                    </tr>
                                    <tr id="order_template_tr" class="d-none">
                                        <th scope="row" class="order_count"></th>
                                        <td class="order_id"></td>
                                        <td class="order_user"></td>
                                        <td class="order_date"></td>
                                        <td class="order_status"></td>
                                        <td class="order_action"></td>
                                        <td class="order_read"></td>
                                    </tr>
                                    </thead>
                                    <tbody id="target-tbody">

                                    </tbody>
                                </table>
                            </div>

                            <div class="col-12">
                                <div class="modal fade" id="statusChangeModal" data-backdrop="static"
                                     data-keyboard="false"
                                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">주문 상태 변경</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="<c:url value="/order/updateAction"/>" method="post"
                                                      id="orderUpdateForm">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}">
                                                    <input type="hidden" name="order_id">
                                                    <input type="hidden" id="prev_status_id">
                                                    <div class="form-group">
                                                        <label for="order_id">주문번호</label>
                                                        <input type="text" id="order_id" class="form-control" readonly>
                                                    </div>
                                                    <%-- Radio Start --%>
                                                    <div class="col-12 mb-3" id="status_target_in_modal">
                                                        <div class="custom-control custom-radio custom-control-inline status_template_in_modal d-none">
                                                            <input type="radio" id="template_radio_input"
                                                                   name="order_change_status"
                                                                   class="custom-control-input" value="0">
                                                            <label class="custom-control-label"
                                                                   for="template_radio_input"></label>
                                                        </div>
                                                    </div>
                                                    <%-- Radio End --%>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="button" class="btn btn-primary" id="updateOrder">확인
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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