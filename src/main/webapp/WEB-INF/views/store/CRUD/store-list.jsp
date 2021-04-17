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
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-list.js"></script>
    <script>
        $(() => {

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
                            <h3 class="text-right">가게 리스트</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12 table-responsive">
                            <table class="table table-hover text-center">
                                <colgroup>
                                    <col style="width:5%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:25%">
                                </colgroup>
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">대표이미지</th>
                                    <th scope="col">상태</th>
                                    <th scope="col">상태변경</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="store" items="${list}" varStatus="status">
                                    <tr>
                                        <th scope="row">${status.count}</th>
                                        <td>
                                            <a href="<c:url value="/store/store-read?store_id=${store.store_id}"/>">
                                                    ${store.store_name}
                                            </a>
                                        </td>
                                        <td>
                                            <img src="/resources/upload${store.store_saved_image}"
                                                 class="img-thumbnail" alt="${store.store_original_image}"/>
                                        </td>
                                        <td class="store_status_value"
                                            id="store_status_value_${store.store_id}"
                                            data-store_id="${store.store_id}"
                                            data-store_status_value="${store.store_status_value}">
                                            ...
                                        </td>
                                        <td>
                                            <c:if test="${store.store_status_value eq 'active' || store.store_status_value eq 'inactive'}">
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" class="custom-control-input"
                                                           id="statusSwitch_${store.store_id}"
                                                           value="${store.store_status_value}"
                                                           onchange="changeStatus('${store.store_id}')">
                                                    <label class="custom-control-label status_label_right"
                                                           for="statusSwitch_${store.store_id}">
                                                        영업중
                                                    </label>
                                                </div>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
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
    <%@include file="../../partial/footer.jsp" %>
</div>
</body>
</html>