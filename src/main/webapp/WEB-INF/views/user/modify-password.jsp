<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="modal fade pwdModal" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="pwdModalTitle"
     aria-hidden="true">
    <form name="pwdform" id="pwdModalForm"
          action="<c:url value="/user/modifyPassword"/>"
          method="post" class="border-light p-5">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header pwdModal-header">
                    <h1 class="pwdModal-title" id="pwdModalTitle">비밀번호 변경</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pwdModal-body">
                    <label for="user_originpassword"><strong>현재 비밀번호</strong></label>
                    <span id="message-originpass"></span>
                    <input type="password" placeholder="기존 비밀번호를 입력하세요" name="user_originpassword" id="user_originpassword" required>

					<label for="user_newpassword"><strong>새로운 비밀번호</strong></label>
                    <span id="message-newpass"></span>
                    <input type="password" placeholder="기존 비밀번호를 입력하세요" name="user_newpassword" id="user_newpassword" required>

                    <label for="user_newpassword_check"><strong>비밀번호 재확인</strong></label><span></span>
                    <span id="message-newpasscheck"></span>
                    <input type="password" placeholder="새로운비밀번호와  일치되게 입력하세요" name="user_newpassword_check"
                           id="user_newpassword_check" required>
                   
                </div>
                <div class="modal-footer pwdModal-footer">
                    <button type="submit" class="pwdModal__button-join">변경하기</button>
                </div>
            </div>
        </div>
    </form>
</div>

