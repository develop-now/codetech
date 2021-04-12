<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade loginModal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
<form name="loginform" action="user/loginProcess" method="post" class="border-light p-5" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header loginModal-header">
         <h1 class="loginModal-title" id="loginModalTitle">로그인</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body loginModal-body">
              <label for="user_email"><strong>아이디</strong></label>      
         <input type="text" placeholder="이메일형식의 아이디를 입력하세요" name="user_email" required>
         
         <label for="user_password"><strong>비밀번호</strong></label>
         <input type="password" placeholder="비밀번호를 입력하세요" name="user_password" required>

      </div>
      <div class="modal-footer loginModal-footer">
            <div class="loginModal-footer-control custom-checkbox">
	        	<input type="checkbox" class="loginModal-footer-control-input" 
	               id="id-remember" name="id-remember" value="store"
	               <c:if test="${!empty saveid }">
	       			checked
	       			</c:if>
	       		>
		        <label class="loginModal-footer-control-label" for="id-remember"
		        >아이디 기억하기
		        </label>
    		</div>
         
         <button type="submit" class="loginModal__button-login">로그인</button>
         <button type="button" class="loginModal__button-join" data-toggle="modal" data-target="#joinModal">회원가입</button>
         <div class="loginModal-footer__links">
         <span class="loginModal__link"><a href="#">아이디찾기</a></span>&nbsp;&nbsp;
         <span class="loginModal__link"><a href="#">&nbsp;비밀번호찾기</a></span>
         </div>

      </div>
    </div>
  </div>
 </form>
</div>

