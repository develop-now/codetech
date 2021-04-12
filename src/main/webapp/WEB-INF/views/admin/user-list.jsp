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
	
</style>
<head>
    <title>User Index</title>
    <%@include file="../partial/head.jsp" %>
</head>
<body>
<div class="container-fluid px-0">
    <%-- main nav --%>
    <%@include file="../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../partial/alertModal.jsp" %>

	<script type="text/javascript">
		
	$(function() {
		// 검색 클릭 후 응답 화면에는 검색시 선택한 필드가 선택되도록 한다.
			
		/* 선택된 필드 값 저장 */
		var selectedValue = '${search_field}'
			
		/* 선택된 필드 값이 있으면 select class="viewcount"를 가진
		   option value 값을 유지 */
		if (selectedValue != '-1')
			$(".viewcount").val(selectedValue);
		
		// 선택한 옵션 값을 placeholder에 표시
		$(".viewcount").change(function(){
			selectedValue = $(this).val();
			
			$("input").val('');
			
			message=["이메일을", "이름을", "전화번호를"]
			$("input").attr("placeholder", message[selectedValue] + " 입력하세요.");
		})
	});
	
	/* 회원 구분 체크박스 중복 체크 불가 */
	function checkOverlap(chk) {
		var overlap = document.getElementsByName("check_state");
		
		for (i = 0; i < overlap.length; i ++) {
			/* 체크로 들어온 값이 전에 갖고 있는 값과 다르면 */
			if (overlap[i] != chk) {
				/* 전에 갖고 있던 체크값 false로 비활성화 */
				overlap[i].checked = false;
			}
		}
	}
	</script>
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
										<option value="0" selected>전체</option>
										<option value="1">이메일</option>
										<option value="2">이름</option>
										<option value="3">전화번호</option>
									</select>
									<input type="text" id="search_word" name="search_word" placeholder="이메일을 입력하세요." value="${search_word}">
								</td>
								
								<td>회원 구분</td>
								<td>
								<ul class="checkbox_ul">
									<li><label><input type="checkbox" name="check_state" value="0" onclick="checkOverlap(this)"/> 회원 활동</label>&nbsp;</li>
									<li><label><input type="checkbox" name="check_state" value="1" onclick="checkOverlap(this)"/> 회원 탈퇴</label>&nbsp;</li>
									<li><label><input type="checkbox" name="check_state" value="2" onclick="checkOverlap(this)"/> 활동 정지</label>&nbsp;</li>
									<li><label><input type="checkbox" name="check_state" value="3" onclick="checkOverlap(this)"/> 회원 추방</label>&nbsp;</li>
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
	      				<div id="status_btn">
	      				<!-- 버튼 활성화 부분 -->
				      		<button type="button" name="suspending">회원 정지</button>&nbsp;
							<button type="button" name="banned">강제 탈퇴</button>
	      					<%-- <c:if test="${ Userslist.user_status == 1}">
				      			<button type="button" name="suspending">회원 정지</button>&nbsp;
								<button type="button" name="banned">강제 탈퇴</button>
							</c:if>
														
	      					<c:if test="${ Userslist.user_status == 2}">
		      					<button type="button" name="inactive">탈퇴 취소</button>&nbsp;
	      					</c:if>
	      					
	      					<c:if test="${ Userslist.user_status == 3}">
		      					<button type="button" name="re_active">정지 해제</button>&nbsp; --%>
		      					
	      				</div>
      				</div>    				
      				
      				<table class="Users_tb">
			            <tbody>
			               <tr>
			               	  <th></th>
			                  <th>이메일</th>
			                  <th>이름</th>
			                  <th>전화번호</th>
			                  <th>포인트</th>
			                  <th>주소</th>
			                  <th>가입일</th>
			                  <th>수정일</th>
			                  <th>관리</th>
							</tr>
							
			            	<c:forEach var="users" items="${Userslist}">
			            		<tr>
			            			<td><input type="checkbox" name="check_select" value="${users.user_id}"></td>
			            			<td>${users.user_email}</td>
			         				<td>${users.user_name}</td>
			         				<td>${users.user_tel}</td>
			         				<td>${users.point}</td>
			         				<td>${users.user_address}</td>
			         				<td>${users.created_at}</td>
			         				<td>${users.updated_at}</td>
			         				<td>버튼 추가</td>
			            		</tr>	
			            	</c:forEach>
			            </tbody>
      				</table>
      			</c:if>
			<%-- <c:if test="${listcount > 0}"> end --%>
			</div>
		</form>
	</div>
    <!-- /.container -->
    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>