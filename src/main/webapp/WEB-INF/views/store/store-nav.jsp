<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 8:20 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="storeNavVal" value="${storeNav}" scope="request"/>
<c:set var="storeIdVal" value="${store_id}" scope="session"/>

<div id="sideNav" class="col-12 col-sm-2">
    <ul class="nav" id="storeNavWrapper">
        <sec:authorize access="hasRole('ROLE_STORE_OWNER')">
            <li class="nav-item">
                <a href="<c:url value="/store/store-create"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'storeCreate' ? 'active' : ''}"/>">가게 만들기</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/store/store-list"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'storeList' ? 'active' : ''}"/>">가게 리스트</a>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_STORE_STAFF')">
            <li class="nav-item">
                <a href="<c:url value="/staff/order-list"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'orderList' ? 'active' : ''}"/>">오더 리스트</a>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_STORE_OWNER')">
            <li class="nav-item">
                <a href="<c:url value="/store/order-list"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'orderList' ? 'active' : ''}"/>">오더 리스트</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/store/menu-list"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'menuList' ? 'active' : ''}"/>">메뉴 리스트</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/store/store-profit"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'storeProfit' ? 'active' : ''}"/>">가게 매출액</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/store/store-staff"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'storeStaff' ? 'active' : ''}"/>">가게 직원</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/store/store-customers"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'storeCustomer' ? 'active' : ''}"/>">가게 단골</a>
            </li>
            <li class="nav-item">
                <a href="<c:url value="/store/store-comment"/>"
                   class="nav-link <c:out value="${storeNavVal eq 'storeComment' ? 'active' : ''}"/>">가게 리뷰</a>
            </li>
        </sec:authorize>
    </ul>
</div>