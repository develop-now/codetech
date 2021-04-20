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
    <title>Order Read Page</title>
    <%@include file="../../partial/head.jsp" %>
    <script>
        $(() => {
            $("#backBtn").on("click", () => {
                history.back();
            })
        })
    </script>
</head>
<body>
<div class="container-fluid px-0">
    <%-- main nav --%>
    <%@include file="../../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid" id="bodyWrapper">
        <div class="row">
            <%@include file="../store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-2">
                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>
                        </div>

                        <div class="ml-auto mr-2">
                            <h3 class="text-right">주문 상세보기</h3>
                        </div>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <div class="jumbotron jumbotron-fluid">
                                <div class="container">
                                    <h2 class="text-primary">주문내역 확인</h2>
                                    <h5 class="text-info text-right">주문번호 : ${order.order_id}</h5>
                                    <hr class="my-4">
                                    <h6 class="text-right">주문자 : ${order.order_user_name}</h6>
                                    <h6 class="text-right">연락처 : ${order.order_user_tel}</h6>
                                    <h6 class="text-right"> 주문일시 : ${order.created_at.substring(0,19)}</h6>
                                    <h6 class="text-right font-weight-bold"> 매출액 :
                                        <span class="text-danger">${order.order_total_price}</span> 원</h6>
                                </div>
                            </div>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="ml-auto mr-2">
                            <h3 class="text-right">메뉴 목록</h3>
                        </div>

                        <div class="col-12 mt-5">
                            <div class="container">
                                <div class="row">
                                    <c:forEach var="detail" items="${detail_list}" varStatus="status">
                                        <div class="col-12 col-sm-6 mb-3">
                                            <div class="card">
                                                <div class="card-header bg-primary text-white">
                                                    메뉴내역 &nbsp;<span
                                                        class="badge badge-light">${status.count}</span>
                                                </div>
                                                <img src="/resources/upload${detail.menu_saved_image}"
                                                     class="card-img-top" alt="${detail.menu_original_image}">
                                                <div class="card-body bg-light">
                                                    <h5 class="card-title">메뉴별 주문 가격</h5>
                                                    <p class="card-text font-weight-bold">
                                                            ${detail.detail_total_price} 원</p>
                                                </div>
                                                <ul class="list-group list-group-flush text-right">
                                                    <li class="list-group-item">메뉴가격 : ${detail.menu_price} 원</li>
                                                    <li class="list-group-item">주문 수량 : ${detail.menu_quantity} 개</li>
<%--                                                    <li class="list-group-item">--%>
<%--                                                        <a role="button" class="btn btn-success btn-sm"--%>
<%--                                                           href="${pageContext.request.contextPath}/menu/menu-read?menu_id=${detail.menu_id}">--%>
<%--                                                            메뉴 상세보기--%>
<%--                                                        </a>--%>
<%--                                                    </li>--%>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:forEach>
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