<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade loginModal" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalTitle" aria-hidden="true">
<form name="joinform" id="joinModalForm" action="jopin_process" method="post" class="border-light p-5" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header joinModal-header">
         <h1 class="joinModal-title" id="joinModalTitle">회원가입</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body joinModal-body">
         <label for="USER_ID"><strong>아이디</strong></label>
         <span id="message-id"></span>     
         <input type="text" placeholder="이메일형식의 아이디를 입력하세요" name="USER_ID" id="USER_ID" required>
         
         <label for="USER_NAME"><strong>닉네임</strong></label>
         <span id="message-nick"></span>
         <input type="text" placeholder="닉네임을 입력하세요" name="USER_NAME" id="USER_NAME" required>
		
		<label for="USER_PASSWORD"><strong>비밀번호</strong></label>
		<span id="message-pass"></span>
         <input type="password" placeholder="비밀번호를 입력하세요" name="USER_PASSWORD" id="USER_PASSWORD"required>
         
         <label for="USER_PASSWORD_CHECK"><strong>비밀번호 재확인</strong></label><span></span>
         <span id="message-passcheck"></span>
         <input type="password" placeholder="위와 일치하는 비밀번호를 입력하세요" name="USER_PASSWORD_CHECK" id="USER_PASSWORD_CHECK"required>
         
         <label for="USER_TEL"><strong>연락처</strong></label>
         <span id="message-tel"></span>
         <input type="text" placeholder="예)01012341234" name="USER_TEL" id="USER_TEL"required>
         
         <label for="USER_ADDRESS"><strong>주소</strong></label><br>
         <div class="joinModal-body-postcode">
	         <input type="text" name="USER_POSTCODE" placeholder="예)13566" id="USER_POSTCODE"required>
	         <button class="joinModal-body__button-code">우편검색</button>
         </div>
         <input type="text" name="USER_ADDRESS" class="joinModal-body__addressinput" required>
         
      </div>
      <div class="modal-footer joinModal-footer">
         <button type="submit" class="joinModal__button-join" >회원가입</button>
      </div>
    </div>
  </div>
 </form>
</div>

