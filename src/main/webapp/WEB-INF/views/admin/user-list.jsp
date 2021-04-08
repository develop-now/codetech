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
									<select id="viewcount" name="search_field">
										<option value="0" selected>이메일</option>
										<option value="1">이름</option>
										<option value="2">전화번호</option>
									</select>
									<input type="text" id="search_word" name="search_word" placeholder="이메일을 입력하세요." value="${search_word}">
								</td>
								
								<td>회원 구분</td>
								<td>
									<label><input type="checkbox" name="check_state" value="0" checked>회원 활동</label>&nbsp;
									<label><input type="checkbox" name="check_state" value="1">회원 탈퇴</label>&nbsp;
									<label><input type="checkbox" name="check_state" value="2">활동 정지</label>&nbsp;
									<label><input type="checkbox" name="check_state" value="3">회원 추방</label>&nbsp;
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
			                  <th><div>국적</div></th>
			                  <th><div>가입일</div></th>
			                  <th><div>수정일</div></th>
							</tr>
			            <thead>
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