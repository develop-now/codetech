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
    <title>Store Profit Page</title>
    <%@include file="../partial/head.jsp" %>
    <%@include file="../partial/dateTimePicker.jsp" %>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-profit.js"></script>

    <c:forEach var="store" items="${store_list}" begin="0" end="0">
        <c:set var="first_store_id" value="${store.store_id}"/>
        <c:set var="first_store_name" value="${store.store_name}"/>
    </c:forEach>

    <script>
        $(() => {
            const first_store_id = '${first_store_id}';
            const first_store_name = '${first_store_name}';

            loadStoreProfit(first_store_id, first_store_name);
        })
    </script>

    <style>
        .profit__chart {
            width: 100%;
            min-height: 300px;
        }

        #dateInfoTxt {
            font-size: 0.85rem;
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
                        <div class="ml-auto mr-2">
                            <h3 class="text-right">가게 매출액</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <div class="row mb-3 align-items-center">
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
                                                               onclick="loadStoreProfit('${store.store_id}', '${store.store_name}')">
                                                                    ${store.store_name}
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="col-8 ml-auto dateSelector__wrapper">
                                    <div class="col-12 mb-3 d-flex justify-content-end">
                                        <small class="text-secondary font-weight-lighter" id="dateInfoTxt">**날자를 선택하시면
                                            앞, 뒤로 3일씩 계산되어 1주일 매출 그래프가 표시됩니다</small>
                                    </div>
                                    <div class="col-12 mb-5">
                                        <div class="input-group input-group-sm justify-content-end">
                                            <div class="input-group-prepend">
                                                <input type="text" class="form-control"
                                                       aria-label="select order detail date"
                                                       name="search_value" placeholder="" id="profitCurrentDate"
                                                       readonly>
                                            </div>
                                            <button class="btn btn-outline-info" type="button" id="profitDateSelectBtn">
                                                날짜 변경
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="container store-profit__wrapper">
                            <div class="col-12 mb-5">
                                <h3 class="text-primary">
                                    <i class="fas fa-store"></i> <span id="store_name"></span>
                                </h3>
                                <h6 class="text-info">
                                    <i class="fas fa-calendar-alt"></i> 기간 : <span id="profit_date"></span>
                                </h6>
                            </div>

                            <div class="row d-none" id="profit__empty">
                                <h6 class='text-warning'>해당 매장에 매출이 존재하지 않습니다</h6>
                            </div>

                            <div class="row" id="profit__graph__wrapper">
                                <div class="col-12">
                                    <h5>일주일 주문량</h5>

                                    <div id="chart_3" class="profit__chart"></div>
                                </div>
                                <div class="col-12">
                                    <h5>메뉴별 매출액</h5>

                                    <div id="chart_2" class="profit__chart"></div>
                                </div>
                                <div class="col-12">
                                    <h5>일주일 매출액</h5>

                                    <div id="chart_1" class="profit__chart"></div>
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
    <%@include file="../partial/footer.jsp" %>
</div>

</body>
</html>