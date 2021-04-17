<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 5:43 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store Staff Page</title>
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-staff.js"></script>

    <c:forEach var="store" items="${store_list}" begin="0" end="0">
        <c:set var="first_store_id" value="${store.store_id}"/>
        <c:set var="first_store_name" value="${store.store_name}"/>
    </c:forEach>

    <script>
        $(() => {
            const first_store_id = '${first_store_id}';
            const first_store_name = '${first_store_name}';

            loadStoreStaff(first_store_id, first_store_name);

            $("#staffAddBtn").on("click", () => {
                location.href = "/staff/staff-create"
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
                            <h3 class="text-right">가게 직원 리스트</h3>
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
                                                       onclick="loadStoreStaff('${store.store_id}', '${store.store_name}')">
                                                            ${store.store_name}
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-group">
                                        <button class="btn btn-success btn-sm" id="staffAddBtn">직원 추가</button>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="container store-staff__wrapper">
                            <div class="col-12 mb-3">
                                <h3 class="text-primary">
                                    <i class="fas fa-store"></i> <span id="store_name"></span>
                                </h3>
                            </div>

                            <div class="col-12 table-responsive">
                                <table class="table table-hover text-center">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">이메일</th>
                                        <th scope="col">입사일</th>
                                        <th scope="col">삭제</th>
                                    </tr>
                                    <tr id="staff_template_tr" class="d-none">
                                        <th scope="row" class="staff_count"></th>
                                        <td class="staff_name"></td>
                                        <td class="staff_email"></td>
                                        <td class="staff_date"></td>
                                        <td class="staff_expire"></td>
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