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
    <title>Store Profit Page</title>
    <%@include file="../partial/head.jsp" %>
    <%@include file="../partial/dateTimePicker.jsp" %>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-profit.js"></script>
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
                        <%--  <div class="col-2">--%>
                        <%--    <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>--%>
                        <%--  </div>--%>
                        <div class="ml-auto">
                            <h3 class="text-right">가게 매출액</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>
                        <div class="col-12 mb-3">
                            <span class="text-secondary font-weight-lighter" id="dateInfoTxt">**날자를 선택하시면 앞, 뒤로 3일씩 계산되어 1주일 매출 그래프가 표시됩니다</span>
                        </div>
                        <div class="col-12 mb-5">
                            <div class="input-group input-group-sm">
                                <div class="input-group-prepend">
                                    <input type="text" class="form-control" aria-label="select order detail date"
                                           name="search_value" placeholder="" id="profitCurrentDate" readonly>
                                </div>
                                <button class="btn btn-outline-info" type="button" id="profitDateSelectBtn">
                                    날짜 변경
                                </button>
                            </div>
                        </div>

                        <div class="col-12">
                            <h5>일주일 매출액</h5>

                            <div id="chart_1" class="profit__chart"></div>
                        </div>
                        <div class="col-12">
                            <h5>메뉴별 매출액</h5>

                            <div id="chart_2" class="profit__chart"></div>
                        </div>
                        <div class="col-12">
                            <h5>일주일 주문량</h5>

                            <div id="chart_3" class="profit__chart"></div>
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