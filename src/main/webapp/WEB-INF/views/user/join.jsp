<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="modal fade loginModal" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalTitle"
     aria-hidden="true">
    <form name="joinform" id="joinModalForm"
          action="<c:url value="/user/joinProcess"/>"
          method="post" enctype="multipart/form-data"
          class="border-light p-5">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header joinModal-header">
                    <h1 class="joinModal-title" id="joinModalTitle">회원가입</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="loginModal-imgcontainer">
                    <label>
                        <input type="file" name="uploadfile"
                               class="loginModal__img-profile"
                               accept="image/gif, image/jpeg,image/jpg, image/png"
                               style="display:none">
                        <img src="${pageContext.request.contextPath}/resources/image/common/default.png" alt="profile"
                             class="loginModal__img-profile" title="프로필사진 변경"><br>
                        <span class="loginModal-imgcontainer-dis">*profile사진 변경 가능</span><br>
                        <span id="message-profile"></span>
                    </label>
                </div>
                <div class="modal-body joinModal-body">
                    <label for="user_email"><strong>아이디</strong></label>
                    <span id="message-id"></span>
                    <input type="text" placeholder="이메일형식의 아이디를 입력하세요" name="user_email" id="user_email" required>

                    <label for="user_password"><strong>비밀번호</strong></label>
                    <span id="message-pass"></span>
                    <input type="password" placeholder="비밀번호를 입력하세요" name="user_password" id="user_password" required>

                    <label for="user_password_check"><strong>비밀번호 재확인</strong></label><span></span>
                    <span id="message-passcheck"></span>
                    <input type="password" placeholder="위와 일치하는 비밀번호를 입력하세요" name="user_password_check"
                           id="user_password_check" required>

                    <label for="user_name"><strong>닉네임</strong></label>
                    <span id="message-nick"></span>
                    <input type="text" placeholder="닉네임을 입력하세요" name="user_name" id="user_name" required>
                    
                    <label for="user_tel"><strong>연락처</strong></label>
                    <span id="message-tel"></span>
                    <input type="text" placeholder="예)01012341234" name="user_tel" id="user_tel" required>

                    <label for="user_address"><strong>주소</strong></label><span id="message-add"></span><br>
                    <div class="joinModal-body-postcode">
                        <input type="text" name="user_postcode" placeholder="예)13566" id="user_postcode" required
                               readonly>
                        <input type="button" class="joinModal-body__button-code" onclick="DaumPostcode()" value="우편검색">
                    </div>
                    <input type="text" name="user_address" id="user_address" class="joinModal-body__addressinput"
                           required readonly>

                </div>
                <div class="modal-footer joinModal-footer">
                    <button type="submit" class="joinModal__button-join">회원가입</button>
                </div>
            </div>
        </div>
    </form>
</div>

