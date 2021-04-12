<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<style>
	/* 왼쪽 상단 회원관리 글씨 css */
	.user_h3 {
		margin: 20px 0px;
	}
	
	select {
		width: 110px;
		padding: .4em .5em;
	}
	
	#search_word {
		width:300px;
		padding: .3em .5em;
	}
	
	.user_search {
		width: 100%;
		margin-top: 10px;
		margin-bottom: 30px;
		border: 2px solid #e2e2d0;
		border-collapse: collapse;
	}
	
	.user_search th, .user_search td {
		padding: 5px 20px;
    	border: 2px solid #e2e2d0;
	}
	
	/* 짝수로 배경 색깔 지정 */
	.user_search td:nth-child(odd) {
    	background: #f5f5ef;
	}
	
	.user_search label {
		margin: 0px;
	}
	
	/* 버튼 정중앙 */
	.submit_btn {
		text-align: center;
	}
	
	#search_btn {
		border-radius: 5px;
		border: 0px;
		padding: 5px 15px;
		background:  #4e3418;
		color: white;
		margin-bottom: 14px;
	} /* 버튼 Css End */
	
	/* 체크 박스 일정 간격으로 정리  */
	.checkbox_ul {
		padding: 0px;
		list-style-type: none;
		width: 100%;
	}
	
	.checkbox_ul li {
		float: left;
		width: 25%;
		line-height: 50px;
		text-align: center;
	} /* 체크 박스 Css End */
	
	.Users_tb {
		border-collapse: collapse;
		width: 100%;
	}

	.Users_tb tbody {
		text-align: center;
	}
	
	/* 표의 헤더 부분 */
	.Users_tb tbody > tr:nth-child(1) > th {
		background: #f5f5ef;
		font-size: 20px;
		border-top: 2px solid #e2e2d0;
		padding: 10px 25px;
	}
	
	/* 표의 td 부분 */
	.Users_tb td {
		padding: 10px 20px;
		border-top: 2px solid #e2e2d0;
		border-bottom: 2px solid #e2e2d0;
	}
	
	/* row에 마우스 가져다 놓으면 색깔 변경 */
	.Users_tb tr:hover {
		background: #f2f2f2;
		padding: 10px 20px;
		border-top: 2px solid #e2e2d0;
		border-bottom: 2px solid #e2e2d0;
	}
	
	.Usersfunction_gird {
		text-align: center;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr 1fr; 
		margin: 20px 0px;
	}
	
	a:link { color: black; text-decoration-line: none;}
 	a:visited { color: black; text-decoration-line: none;}
 	a:hover { color: black; text-decoration-line: none;}
	
	.UserSusp {
		background: #ff9900;
		text-color: black;
		padding: 5px;
	}
	
	.UserReAc {
		background: #e6ccb3;
		text-color: white;
		padding: 5px;
	}
	
	.UserBanned {
		background: red;
		text-color: black;
		padding: 5px;
	}
	
	.UserInac {
		background: #d9b18c;
		text-color: black;
		padding: 5px;
	}
	
</style>

<head>
    <title>User Index</title>
    <%@include file="../partial/head.jsp" %>
<script>
	var selectedValue = '${search_field}'
	
	/* 선택된 필드 값이 있으면 select class="viewcount"를 가진
	   option value 값을 유지 */
	if (selectedValue != '-1')
		$(".viewcount").val(selectedValue);
	
	$("check_state").click(function() {
		checkedValue = $(this).val();
		$(this).checked(true);
	})
	
	// 선택한 옵션 값을 placeholder에 표시
	$(".viewcount").change(function() {
		selectedValue = $(this).val();
		
		$("input").val('');
		
		message=["이메일을", "이름을", "전화번호를"]
		$("input").attr("placeholder", message[selectedValue] + " 입력하세요.");
	})

	$(function() {		
		$(".UserSusp").click(function(event) {
			var answer = confirm("회원 정지를 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".UserReAc").click(function(event) {
			var answer = confirm("정지 해제를 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".UserBanned").click(function(event) {
			var answer = confirm("회원을 추방 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".UserInac").click(function(event) {
			var answer = confirm("회원 탈퇴를 취소 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
	});
	
	var result = "${ result }";
	
	if (result == 'suspSuccess') {
		alert("선택한 아이디 회원을 정지 겅공.");	
	} else if (result == 'suspFail') {
		alert("선택한 아이디 회원 정지 실패.");
	}
	
	if (result == 'reacSuccess') {
		alert("선택한 아이디 정지 해제 완료");
	} else if (result == 'reacFail') {
		alert("선택한 아이디 정지 해제 실패");
	}
	
	if (result == 'bannedSuccess') {
		alert("선택한 아이디 강제 추방 완료");
	} else if (result == 'bannedFail') {
		alert("선택한 아이디 탈퇴 취소 완료");
	}
	
	if (result == 'inacSuccess') {
		alert ("선택한 아이디 탈퇴 취소 성공");
	} else if (result == 'inacFail') {
		alert ("선택한 아이디 탈퇴 취소 실패");
	}	
</script>
</head>
<body>
<div class="container-fluid px-0">
    <%-- main nav --%>
    <%@include file="../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../partial/alertModal.jsp" %>
    
    <!-- Page Content -->
    <div class="container-fluid">
		<h3 class="user_h3">회원 관리</h3> <!-- 왼쪽 상단 회원관리 글씨 css -->
 		<hr style="border: solid 1px #e2e2d0;">
			<form action="userList">
				<div class=search_div>
					<b>회원 검색</b><br>
					<div>
						<table class="user_search">
							<tr>
								<td>검색어</td>
								<td>
									<select class="viewcount" name="search_field">
										<option value="0" selected>이메일</option>
										<option value="1">이름</option>
										<option value="2">전화번호</option>
									</select>
									<input type="text" id="search_word" name="search_word" value="${search_word}">
								</td>
								
								<td>회원 구분</td>
								<td>
								<ul class="checkbox_ul">
									<li><label><input type="radio" name="check_state" value="0" checked/> 회원 활동</label>&nbsp;</li>
									<li><label><input type="radio" name="check_state" value="1" /> 회원 탈퇴</label>&nbsp;</li>
									<li><label><input type="radio" name="check_state" value="2" /> 활동 정지</label>&nbsp;</li>
									<li><label><input type="radio" name="check_state" value="3" /> 회원 추방</label>&nbsp;</li>
								</ul>
								</td>
							</tr>
						</table>
					</div>
					<div class="submit_btn">
						<button type="submit" id="search_btn">검색</button>
					</div>
					<hr style="border: solid 1px #e2e2d0;">
					
						
					<%-- 회원이 있는 경우 --%>
      				<c:if test="${listcount > 0}">
	      			<div class="Usersfunction_gird">
	      				<div id="listcount_div">
			      			<b><font size=4>회원 수 : ${listcount}</font></b>	      				
	      				</div>
	      				<div></div>
	      				<div></div>
	      				<div></div>
	      				<div></div>
      				</div>    				
      				
      				<table class="Users_tb">
			            <tbody>
			               <tr>
			                  <th>이메일</th>
			                  <th>이름</th>
			                  <th>전화번호</th>
			                  <th>포인트</th>
			                  <th>주소</th>
			                  <th>가입일</th>
			                  <th>수정일</th>
			                  <th>회원 상태</th>
			                  <th>관리</th>
							</tr>
							
			            	<c:forEach var="users" items="${Userslist}">
			            		<tr>
			            			<td>${users.user_email}</td>
			         				<td>${users.user_name}</td>
			         				<td>${users.user_tel}</td>
			         				<td>${users.point}</td>
			         				<td>${users.user_address}</td>
			         				<td>${users.created_at}</td>
			         				<td>${users.updated_at}</td>
			         				<td>
			         					<c:choose>
			         						<c:when test="${users.user_status == 1}">
				         						<c:out value="활동"/>
			         						</c:when>
			         						
			         						<c:when test="${users.user_status == 2}">
				         						<c:out value="탈퇴"/>
			         						</c:when>
			         						
			         						<c:when test="${users.user_status == 3}">
				         						<c:out value="정지"/>
			         						</c:when>
			         						
			         						<c:when test="${users.user_status == 4}">
				         						<c:out value="추방"/>
			         						</c:when>
			         					</c:choose>
			         				</td>
			         				<td>
			         					<a href="UserSusp?user_id=${users.user_id}" class="UserSusp">회원 정지</a>&nbsp;
			         					<a href="UserReAc?user_id=${users.user_id}" class="UserReAc">정지 해제</a>&nbsp;
			         					<a href="UserBanned?user_id=${users.user_id}" class="UserBanned">강제 탈퇴</a>&nbsp;
			         					<a href="UserInac?user_id=${users.user_id}" class="UserInac">탈퇴 취소</a>&nbsp;
			         					
				         				<!-- <button type="button" id="suspending" onclick="">회원 정지</button>&nbsp;
										<button type="button" id="re_active">정지 해제</button>&nbsp;
										<button type="button" id="banned">강제 탈퇴</button>&nbsp;
										<button type="button" id="inactive">탈퇴 취소</button>&nbsp; -->
									</td>
			            		</tr>	
			            	</c:forEach>
			            </tbody>
      				</table>
      			</c:if>
			<%-- <c:if test="${listcount > 0}"> end --%>
			</div>
			
			<%-- 회원이 없는 경우 --%>
			<c:if test="${listcount == 0 && empty search_word}">
				<h1>회원이 없습니다.</h1>
			</c:if>
			   
			<c:if test="${listcount == 0 && !empty search_word}">
			    <h1>검색 결과가 없습니다.</h1>
			</c:if>
		</form>
	</div>
    <!-- /.container -->
    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>