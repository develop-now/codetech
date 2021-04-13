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
	.parter_h3 {
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
	
	.partner_search {
		width: 100%;
		margin-top: 10px;
		margin-bottom: 30px;
		border: 2px solid #e2e2d0;
		border-collapse: collapse;
	}
	
	.partner_search th, .user_search td {
		padding: 5px 20px;
    	border: 2px solid #e2e2d0;
	}
	
	/* 짝수로 배경 색깔 지정 */
	.partner_search td:nth-child(odd) {
    	background: #f5f5ef;
	}
	
	.partner_search label {
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
		<h3 class="partner_h3">파트너 관리</h3> <!-- 왼쪽 상단 회원관리 글씨 css -->
 		<hr style="border: solid 1px #e2e2d0;">
			<form action="partnerList">
				<div class=search_div>
					<b>파트너 검색</b><br>
					<div>
						<table class="partner_search">
							<tr>
								<td>검색어</td>
								<td>
									<select class="viewcount" name="search_field">
										<option value="0" selected>상호명</option>
										<option value="1">이메일</option>
										<option value="2">전화번호</option>
									</select>
									<input type="text" id="search_word" name="search_word" placeholder="상호명을 입력하세요." value="${search_word}">
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
	      			<div class="Partnerfunction_gird">
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
			                  <th>상호명</th>
			                  <th>대표자 명</th>
			                  <th>전화 번호</th>
			                  <th>가게 번호</th>
			                  <th>주소</th>
			                  <th>관리</th>
			               </tr>
						</tbody>
      				</table>
		      	 <div style="margin: 50px;">
		         <ul class="pagination justify-content-center">
		              <c:if test="${page <= 1}">
		                 <li class="page-item"><a class="page-link current" href="#">이전&nbsp;</a>
		                 </li>
		               </c:if>
		
		               <c:if test="${page > 1}">
		                  <li class="page-item"><a
		                     href="userList?page=${page-1}&search_field=${search_field}&search_word=${search_word}&check_state=${check_state}"
		                     class="page-link">이전</a> &nbsp;</li>
		               </c:if>
		
		
		               <c:forEach var="a" begin="${startpage}" end="${endpage }">
		                  <c:if test="${a == page }">
		                     <li class="page-item"><a class="page-link current" href="#">${a}</a>
		                     </li>
		                  </c:if>
		
		                  <c:if test="${a != page }">
		                     <li class="page-item"><a
		                        href="userList?page=${a}&search_field=${search_field}&search_word=${search_word}&check_state=${check_state}"
		                        class="page-link">${a}</a></li>
		                  </c:if>
		               </c:forEach>
		
		
		               <c:if test="${page >= maxpage }">
		                  <li class="page-item"><a class="page-link current" href="#">&nbsp;다음</a>
		                  </li>
		               </c:if>
		
		               <c:if test="${page < maxpage }">
		                  <li class="page-item"><a
		                     href="userList?page=${page+1}&search_field=${search_field}&search_word=${search_word}&check_state=${check_state}"
		                     class="page-link">&nbsp;다음</a></li>
		               </c:if>
		         </ul>
		         </div>
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