<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 8:20 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="storeNavVal" value="${storeNav}"/>
<c:set var="roleIdVal" value="${role_id}"/>

<div id="sideNav" class="col-12 col-sm-2">
    <ul class="nav" id="storeNavWrapper">
        <li class="nav-item">
            <a href="<c:url value="/store/store-create"/>"
               class="nav-link <c:out value="${storeNavVal eq 'storeCreate' ? 'active' : ''}"/>">가게 만들기</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/order/order-list?store_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'orderList' ? 'active' : ''}"/>">오더 리스트</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/store/store-list?owner_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'storeList' ? 'active' : ''}"/>">가게 리스트</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/menu/menu-list-by-owner?owner_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'menuList' ? 'active' : ''}"/>">메뉴 리스트</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/store/store-profit?store_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'storeProfit' ? 'active' : ''}"/>">가게 매출액</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/store/store-staff?store_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'storeStaff' ? 'active' : ''}"/>">가게 직원</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/store/store-customers?store_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'storeCustomer' ? 'active' : ''}"/>">가게 단골</a>
        </li>
        <li class="nav-item">
            <%-- TODO:: FIX HARD CODING VALUE!!--%>
            <a href="<c:url value="/comment/comment-list?store_id=3"/>"
               class="nav-link <c:out value="${storeNavVal eq 'commentList' ? 'active' : ''}"/>">가게 리뷰</a>
        </li>

        <c:choose>
            <c:when test="${roleIdVal && roleIdVal eq 4}">
                <li class="nav-item">
                    <a class="nav-link" href="#">오더 확인</a>
                </li>
            </c:when>
            <c:when test="${roleIdVal && roleIdVal eq 3}">
                <li class="nav-item">
                    <a class="nav-link" href="#">오더 확인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">매출 분석</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">메뉴 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">가게 단골</a>
                </li>
            </c:when>
            <c:otherwise>

            </c:otherwise>
        </c:choose>
    </ul>
</div>