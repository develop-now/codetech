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
    <title>Store Order List Page</title>
    <%@include file="../partial/head.jsp" %>

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
                        <%--                        <div class="col-2">--%>
                        <%--                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>--%>
                        <%--                        </div>--%>
                        <div class="ml-auto">
                            <h3 class="text-right">오더 리스트</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12 mb-3">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order-all" name="order-status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="order-all">전체보기</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order-completed" name="order-status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="order-completed">주문 완료만 보기</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order-cooked" name="order-status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="order-cooked">조리 완료만 보기</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order-cooking" name="order-status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="order-cooking">조리중만 보기</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order-received" name="order-status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="order-received">예약 완료만 보기</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="order-cancel" name="order-status"
                                       class="custom-control-input">
                                <label class="custom-control-label" for="order-cancel">취소만 보기</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <table class="table table-sm table-hover text-center">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">주문자</th>
                                    <th scope="col">주문일시</th>
                                    <th scope="col">주문상태</th>
                                    <th scope="col">상태변경</th>
                                    <th scope="col">상세메뉴</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>2021.04.06 17:00:04</td>
                                    <td>조리중</td>
                                    <td>링크</td>
                                    <td>링크</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>2021.04.06 17:30:04</td>
                                    <td>주문접수대기</td>
                                    <td>링크</td>
                                    <td>링크</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Adrian</td>
                                    <td>2021.04.06 17:40:04</td>
                                    <td>주문완료</td>
                                    <td>링크</td>
                                    <td>링크</td>
                                </tr>
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