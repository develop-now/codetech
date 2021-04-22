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
    <title>Manager List Page</title>
    <%@include file="../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-list.js"></script>

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
            <%@include file="owner-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="ml-auto mr-2">
                            <h3 class="text-right">관리자 리스트</h3>
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
                                    <th scope="col">사번</th>
                                    <th scope="col">닉네임</th>
                                    <th scope="col">상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="userInfo" items="${userInfo}" varStatus="status">
                                    <tr>
                                        <th scope="row">${status.count}</th>
                                        <td>
                                            
                                                    ${userInfo.user_id}
                                            
                                        </td>
                                        <td>
                                        <a href="<c:url value="/owner/managerDetail?user_id=${userInfo.user_id}"/>">
                                           ${userInfo.user_name}
                                           </a>
                                        </td>
                                        <td>
                                            활동중
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
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>