<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store Index Page</title>
    <%@include file="../partial/head.jsp" %>

    <script>
        $(() => {
            $(".counter_animation").each(function () {
                $(this).prop('Counter', 0).animate({
                    Counter: $(this).text()
                }, {
                    duration: 2000,
                    easing: 'swing',
                    step: function (now) {
                        $(this).text(Math.ceil(now));
                    }
                });
            })
        })
    </script>
</head>
<body>
<div class="container-fluid px-0">
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
                <div class="container store-summary--container mt-5 px-sm-3">
                    <h3><i class="fas fa-tachometer-alt"></i> STORE DASHBOARD</h3>
                    <div class="row mx-sm-n3">
                        <div class="col-12 col-sm-6 px-sm-3 my-1">
                            <div class="summary__box bg-danger text-white">
                                <div class="row detail__container">
                                    <i class="fas fa-store dashboard__icon"></i>
                                    <p class="detail__wrapper">
                                        <span id="store_count" class="detail_number counter_animation">
                                            ${store_total_count}
                                        </span>
                                        <br/>
                                        <span class="detail__title">STORE</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 px-sm-3 my-1">
                            <div class="summary__box bg-warning text-white">
                                <div class="row detail__container">
                                    <i class="fas fa-user-check dashboard__icon"></i>
                                    <p class="detail__wrapper">
                                        <span id="customer_count" class="detail_number counter_animation">
                                            ${store_total_customer}
                                        </span>
                                        <br/>
                                        <span class="detail__title">CUSTOMER</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 px-sm-3 my-1">
                            <div class="summary__box bg-success text-white">
                                <div class="row">
                                    <i class="fas fa-won-sign dashboard__icon"></i>
                                    <p class="detail__wrapper">
                                        <span id="income_amount" class="detail_number counter_animation">
                                            <%-- <fmt:formatNumber type="number" value="${store_total_income}"/> --%>
                                            ${store_total_income}
                                        </span>
                                        <br/>
                                        <span class="detail__title">INCOME</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 px-sm-3 my-1">
                            <div class="summary__box bg-info text-white">
                                <div class="row">
                                    <i class="fas fa-clipboard-list dashboard__icon"></i>
                                    <p class="detail__wrapper">
                                        <span id="order_count" class="detail_number counter_animation">
                                            ${store_total_order}
                                        </span>
                                        <br/>
                                        <span class="detail__title">ORDER</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 px-sm-3 my-1">
                            <div class="summary__box bg-primary text-white">
                                <div class="row">
                                    <i class="fas fa-comments dashboard__icon"></i>
                                    <p class="detail__wrapper">
                                        <span id="comment_count" class="detail_number counter_animation">
                                            ${store_total_comment}
                                        </span>
                                        <br/>
                                        <span class="detail__title">COMMENT</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 px-sm-3 my-1">
                            <div class="summary__box bg-dark text-white">
                                <div class="row">
                                    <i class="fas fa-thumbs-up dashboard__icon"></i>
                                    <p class="detail__wrapper">
                                        <span id="like_count" class="detail_number counter_animation">
                                            ${store_total_like}
                                        </span>
                                        <br/>
                                        <span class="detail__title">LIKE</span>
                                    </p>
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
