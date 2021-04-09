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
	
	.user_search {
		width: 100%;
		margin-top: 10px;
		margin-bottom: 30px;
		border: 2px solid #e2e2d0;
		border-collapse: collapse;
	}
	
	.user_search th, td {
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
				overlap[i].checked = false
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
										<option value="0" selected>이메일</option>
										<option value="1">이름</option>
										<option value="2">전화번호</option>
									</select>
									<input type="text" id="search_word" name="search_word" placeholder="이메일을 입력하세요." value="${search_word}">
								</td>
								
								<td>회원 구분</td>
								<td>
									<label><input type="checkbox" name="check_state" value="0" onclick="checkOverlap(this)"/>회원 활동</label>&nbsp;
									<label><input type="checkbox" name="check_state" value="1" onclick="checkOverlap(this)"/>회원 탈퇴</label>&nbsp;
									<label><input type="checkbox" name="check_state" value="2" onclick="checkOverlap(this)"/>활동 정지</label>&nbsp;
									<label><input type="checkbox" name="check_state" value="3" onclick="checkOverlap(this)"/>회원 추방</label>&nbsp;
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
      				<table>
						<thead>
			               <tr>
			                  <th><font size=3>회원 수 : ${listcount}</font></th>
			                  <td><button type="button" name="suspending">활동 정지</button></td>
			                  <td><button type="button" name="banned">강제 탈퇴</button></td>
			               </tr>
				
			               <tr>
			                  <th><div>이메일</div></th>
			                  <th><div>이름</div></th>
			                  <th><div>전화번호</div></th>
			                  <th><div>포인트</div></th>
			                  <th><div>주소</div></th>
			                  <th><div>가입일</div></th>
			                  <th><div>수정일</div></th>
							</tr>
			            <thead>
			            <tbody>
			            	<c:forEach var="users" items="${Userslist}" varStatus="status">
			            		<tr>
			            			<td>${users.user_email}</td>
			         				<td>${Infolist[status.index].user_name}</td>
			         				<td>${Infolist[status.index].user_tel}</td>
			         				<td>${Infolist[status.index].user_point}</td>
			         				<td>${Infolist[status.index].user_address}</td>
			         				<td>${users.created_at}</td>
			         				<td>${users.updated_at}</td>
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