<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (Cookie c : cookies) {
			String cName = c.getName();
			System.out.println("cookie name : " + cName);
		}
	}

%>

<div class="modal fade loginModal" id="reportModal" tabindex="-1"
	role="dialog" aria-labelledby="reportModalTitle" aria-hidden="true">
	<form name="loginform" action="<c:url value="/user/addReport"/>"
		method="post" class="border-light p-5">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">

		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header loginModal-header">
					<h1 class="loginModal-title" id="loginModalTitle">신고하기</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body loginModal-body">
				
					<label><strong>신고대상</strong></label> <input
						type="text" placeholder="신고할 대상의 닉네임이나 가게이름을 입력하세요" id="reported"
						name="reported" required>
						<label><strong>제 목</strong></label> <input
						type="text" placeholder="제목을 입력하세요" id="subject"
						name="subject" required>
					<label ><strong>신고사유</strong></label><br>
					<textarea placeholder="신고 사유를 입력하세요" id="rp_content"
						name="content" required></textarea>

				</div>
				<div class="modal-footer loginModal-footer">


					<button type="submit" class="loginModal__button-login">신고하기</button>
					<input type="hidden" id="ab"
						value="${pageContext.request.contextPath}">
						<input type="hidden" name="user_id" value="${user_id }">

				</div>
			</div>
		</div>
	</form>
</div>

