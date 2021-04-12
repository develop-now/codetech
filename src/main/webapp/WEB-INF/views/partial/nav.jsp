<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 2:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="login_id" value="${id}" scope="session"/>
<c:set var="role_value" value="${role}" scope="session"/>

<nav class="navbar navbar-expand-sm navbar-light" id="headerNav">
    <a class="navbar-brand" href="<c:url value="/home"/>">CODE TECH</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal" var="pinfo"/>
                <li class="nav-item">
                    <a class="nav-link text-right" href="#">${pinfo.username}</a>
                </li>

                <sec:authorize access="hasRole('ROLE_SITE_OWNER')">
                    <li class="nav-item">
                        <a class="nav-link text-right" href="<c:url value="/owner"/>">오너</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link text-right" href="<c:url value="/admin"/>">어드민</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_STORE_OWNER')">
                    <li class="nav-item">
                        <a class="nav-link text-right" href="<c:url value="/store"/>">가게</a>
                    </li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_MEMBER')">
                    <li class="nav-item">
                        <a class="nav-link text-right" href="<c:url value="/user"/>">유저정보</a>
                    </li>
                </sec:authorize>


                <li class="nav-item">
                    <form action="<c:url value="/auth/logout"/>" method="post" id="logoutForm">
                        <a class="nav-link" href="#" id="logoutBtn"> 로그아웃</a>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                </li>
            </sec:authorize>

            <sec:authorize access="isAnonymous()">
                <li class="nav-item">
                    <a class="nav-link text-right" href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-right" href="#" data-toggle="modal" data-target="#joinModal">회원가입</a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>

<!-- login Modal -->
<jsp:include page="/WEB-INF/views/user/login.jsp"/>
<!-- join Modal -->
<jsp:include page="/WEB-INF/views/user/join.jsp"/>