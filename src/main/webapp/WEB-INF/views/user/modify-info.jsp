<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="modal fade modifyModal" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalTitle"
     aria-hidden="true">
    <form name="modifyform" id="modifyModalForm"
          action="<c:url value="/user/infoModifyAction"/>"
          method="post" enctype="multipart/form-data"
          class="border-light p-5">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<input type="hidden" name="user_profile" value="${userPlusInfo.user_profile}">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header modifyModal-header">
                    <h1 class="modifyModal-title" id="modifyModalTitle">정보수정</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modifyModal-imgcontainer">
                    <label>
                        <input type="file" name="uploadfile_m" id="upfile"
                               class="modifyModal__img-profile"
                               accept="image/gif, image/jpeg,image/jpg, image/png"
                               style="display:none">
                        <span id="filevalue">${userPlusInfo.original_file}</span>
                        <img src="${pageContext.request.contextPath}/resources/upload${userPlusInfo.user_profile}" alt="profile"
                             class="modifyModal__img-profile" title="프로필사진 변경"><br>
                        <span class="modifyModal-imgcontainer-desc">*profile사진 변경 가능</span><br>
                        <span id="message-profile_m"></span>
                    </label>
                </div>
                <div class="modal-body modifyModal-body">
               	 <sec:authentication property="principal" var="pinfo"/>
                    <label for="user_email"><strong>아이디</strong></label>
                    <input type="text" value="${pinfo.username}" name="user_email" id="user_email" readonly>

                    <label for="user_name_m"><strong>닉네임</strong></label>
                    <span id="message-nick_m"></span>
                    <input type="text" value="${userPlusInfo.user_name}" name="user_name_m" id="user_name_m" placeholder="닉네임을 입력하세요" required>
                    
                    <label for="user_tel_m"><strong>연락처</strong></label>
                    <span id="message-tel_m"></span>
                    <input type="text" value="${userPlusInfo.user_tel}" name="user_tel_m" id="user_tel_m" placeholder="예)01012341234" required>

                    <label for="user_address"><strong>주소</strong></label><span id="message-add"></span><br>
                    <div class="modifyModal-body-postcode">
                        <input type="text" name="user_postcode_m" id="user_postcode_m" required
                               readonly>
                        <input type="button" class="modifyModal-body__button-code" onclick="DaumPostcode()" value="우편검색">
                    </div>
                    <input type="text" name="user_address_m" id="user_address_m" class="modifyModal-body__addressinput"
                          required readonly>

                </div>
                <div class="modal-footer modifyModal-footer">
                    <button type="submit" class="modifyModal__button-join">정보수정</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
var DBaddress = "${userPlusInfo.user_address}";
var code = DBaddress.substring(0,5);
var address = DBaddress.substring(5);

$("#user_postcode_m").val(code);
$("#user_address_m").val(address);

</script>
