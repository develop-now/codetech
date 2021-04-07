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
    <ul class="nav flex-column">
        <li class="nav-item">
            <a href="<c:url value="/store/create"/>"
               class="nav-link <c:out value="${storeNavVal eq 'create' ? 'active' : ''}"/>">가게 만들기</a>
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