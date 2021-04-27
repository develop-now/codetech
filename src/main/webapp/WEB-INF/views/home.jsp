<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 1:12 오후
  To change this partial use File | Settings | File partials.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home Page</title>
    <%@include file="partial/head.jsp" %>
</head>
<body>
<div class="container-fluid px-0 pb-5">
    <%@include file="partial/nav.jsp" %>

    <%--    info Modal      --%>
    <%@include file="partial/infoModal.jsp" %>

    <%--    alert Modal      --%>
    <%@include file="partial/alertModal.jsp" %>


    <div class="container-fluid">
        <!-- Jumbotron Header -->
        <header class="jumbotron my-4">
            <h1 class="display-3">커피 구독 서비스 출시!</h1>
            <p class="lead">
                월 19,800원으로 커피를 구독하세요! 제휴 매장에서 하루 1잔 사용 가능합니다.(아메리카노 한정)<br>
                많은 분들이 커피테크로 하루 평균 3분의 시간을 절약하셨습니다.
            </p>
            <a href="owner/mainList" class="btn btn-primary btn-lg">주문하러 가기!</a>
        </header>

        <!-- Page Features -->
        <div class="row text-center">

            <c:forEach var="store" items="${stores}" varStatus="status">
                <c:if test="${store.store_status == 1}">
                    <div class="col-lg-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <img class="card-img-top"
                                 src="/upload${store.store_saved_image}" alt=""
                                 style="height: 50% !important;">
                            <div class="card-body">
                                <h4 class="card-title">${store.store_name}</h4>
                                <p class="card-text">
                                    5분 후 수령 가능 <br>
                                    <img class="card-img-heart"
                                         src="${pageContext.request.contextPath}/resources/image/common/like.png"
                                         width="20" height="20" alt=""> ${store.like_count}&nbsp;&nbsp;
                                    <img class="card-img-comments"
                                         src="${pageContext.request.contextPath}/resources/image/common/message.png"
                                         width="20" height="20" alt="">&nbsp;${store.comment_count}
                                </p>
                            </div>

                            <div class="card-footer">
                                <a href="${pageContext.request.contextPath}/user/orderMain?store_id=${store.store_id}"
                                   class="btn btn-primary">주문하러 가기!</a>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${store.store_status == 2 || store.store_status == 3}">
                    <div class="col-lg-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <img class="card-img-top"
                                 src="/upload${store.store_saved_image}" alt=""
                                 style="filter: blur(5px); height: 50% !important;">
                            <div class="card-body">
                                <h4 class="card-title">${store.store_name}</h4>
                                <p class="card-text">
                                    준비중<br>
                                    <img class="card-img-heart"
                                         src="${pageContext.request.contextPath}/resources/image/common/like.png"
                                         width="20" height="20" alt=""> ${store.like_count}&nbsp;&nbsp;
                                    <img class="card-img-comments"
                                         src="${pageContext.request.contextPath}/resources/image/common/message.png"
                                         width="20" height="20" alt="">&nbsp;${store.comment_count}
                                </p>
                            </div>
                            <div class="card-footer">
                                <a href="#" class="btn btn-primary disabled"
                                   style="background-color: gray">준비중</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>

        </div>
    </div>

    <%@include file="partial/footer.jsp" %>
</div>
</body>
</html>
