<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/16
  Time: 2:16 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="login_id" value="${id}" scope="session"/>

<nav class="navbar navbar-expand-sm navbar-light ">
    <a class="navbar-brand" href="<c:url value="/"/>">CODE TECH</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-right" href="#" data-toggle="modal" data-target="#loginModal">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-right" href="#" data-toggle="modal" data-target="#joinModal">회원가입</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-right" href="<c:url value="/user"/>">유저</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-right" href="<c:url value="/admin"/>">어드민</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-right" href="<c:url value="/store"/>">가게</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-right" href="<c:url value="/owner"/>">오너</a>
            </li>


<%--            <c:choose>--%>
<%--                <c:when test="${empty login_id}">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="<c:url value="/member/login"/>">로그인</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="<c:url value="/member/join"/>">회원가입</a>--%>
<%--                    </li>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="<c:url value="/member/info"/>">${login_id}</a>--%>
<%--                    </li>--%>
<%--                    <c:if test="${login_id eq 'Admin'}">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="<c:url value="/member/memberList"/>">유저리스트</a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="<c:url value="/board/index"/>">게시판</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="<c:url value="/member/logout"/>">로그아웃</a>--%>
<%--                    </li>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
        </ul>
    </div>
</nav>
<!-- login Modal -->
<jsp:include page="/WEB-INF/views/user/login.jsp"/>
<!-- join Modal -->
<jsp:include page="/WEB-INF/views/user/join.jsp"/>