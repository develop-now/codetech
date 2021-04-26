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
	/* 왼쪽 상단 파트너 관리 글씨 css */
	.partner_h3 {
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
	
	.partner_search th, .partner_search td {
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
	
	.Partner_tb {
		border-collapse: collapse;
		width: 100%;
	}

	.Partner_tb tbody {
		text-align: center;
	}
	
	/* 표의 헤더 부분 */
	.Partner_tb tbody > tr:nth-child(1) > th {
		background: #f5f5ef;
		font-size: 20px;
		border-top: 2px solid #e2e2d0;
		padding: 10px 25px;
	}
	
	/* 표의 td 부분 */
	.Partner_tb td {
		padding: 10px 20px;
		border-top: 2px solid #e2e2d0;
		border-bottom: 2px solid #e2e2d0;
	}
	
	/* row에 마우스 가져다 놓으면 색깔 변경 */
	.Partner_tb tr:hover {
		background: #f2f2f2;
		padding: 10px 20px;
		border-top: 2px solid #e2e2d0;
		border-bottom: 2px solid #e2e2d0;
	}
	
	.Partnerfunction_gird {
		text-align: center;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr; 
		margin: 20px 0px;
	}
	
	.PartnerStoreIf_gird {
		text-align: center;
		display: grid;
		grid-template-columns: 1fr 4fr; 
		margin: 20px 0px;
	}
	
	.PartnerStoreIf_gird li {
		text-align: left;
	}
	
	
	.ajax_menu li {
		text-align: left;
	}
	
	a:link { color: black; text-decoration-line: none;}
 	a:visited { color: black; text-decoration-line: none;}
 	a:hover { color: black; text-decoration-line: none;}
</style>

<head>
    <title>Partner Index</title>
    <%@include file="../partial/head.jsp" %>
<script>
$(function() {
	var selectedValue = '${search_field}'
		
	/* 선택된 필드 값이 있으면 select class="viewcount"를 가진 option value 값을 유지 */	
	if (selectedValue != '-1')
		$(".viewcount").val(selectedValue);
	
	$("input[value='${check_state}']").prop('checked', true);
	
	$(".PartnerTermi").click(function(event) {
		var answer = confirm("해당 가게를 계약 해지 하시겠습니까?");
		
		if (!answer) {
			event.preventDefault();
		}
	});
	
	$(".PartnerSusp").click(function(event) {
		var answer = confirm("해당 가게를 정지를 하시겠습니까?");
		
		if (!answer) {
			event.preventDefault();
		}
	});

	/* 기능 사용시 나오는 알림창 */
	var result = "${ result }";
	
	if (result == 'storeActSuccess') {
		alert("해당 가게 정지 해제 또는 계약에 성공 했습니다.");	
	} else if (result == 'storeActFail') {
		alert("해당 가게 정지 해제 또는 계약에 실패 했습니다.");
	}
	
	if (result == 'termiSuccess') {
		alert("해당 가게와의 계약을 해지 했습니다.");	
	} else if (result == 'termiFail') {
		alert("해당 가게와의 계약 해지를 실패 했습니다.");
	}
	
	if (result == 'storeSuspSuccess') {
		alert("해당 가게를 정지 했습니다.");
	} else if (result == 'storeSuspFail') {
		alert("해당 가게 정지를 실패 했습니다.");
	}
	
	$('.getStoreIf').click(function() {
		console.log("글 번호: " + $(this).closest('tr').find("input").val());
		var store_id = $(this).closest('tr').find("input").val()
		
		$.ajax({
			method : "get",
			url : "PartnerPend",
			data : { "store_id" : store_id },
			dataType : "json",
			cache : false,
			success : function(data) {
				console.log(data);
				$('.ajax_menu').empty();
				$('.modal-footer').empty();
				
				var output = "";
				$(data).each(function(index, item) {
					output += '	  <div> Menu Name: ' + item.menu_name + '</div>';
					output += '	  <div> Menu Price: ' + item.menu_price + '</div>';
					output += '	  <div> Menu Description: ' + item.menu_desc + '</div>';
				})
				
				$('.ajax_menu').append(output);
				
				output = '<button type="button" class="btn btn-submit" onClick="storeApprove()">승인</button>'
				output += '<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>'
				$('.modal-footer').append(output);
			},
			error : function() {
	            console.log("admin modal err");
	        }
		})
	});
});
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
        <div class="row">
            <div id="sideNav" class="col-12 col-sm-2">
            	<div><a href="${pageContext.request.contextPath}/admin/userList">회원 관리</a></div>
                <div><a href="${pageContext.request.contextPath}/admin/partnerList">파트너 관리</a></div>
                <div><a href="${pageContext.request.contextPath}/admin/noticeAll">공지사항 관리</a></div>
                <div><a href="${pageContext.request.contextPath}/admin/noticeWrite">공지사항 작성</a></div>
                <div><a href="${pageContext.request.contextPath}/admin/reportUser">신고 관리</a></div>
            </div>
            <div class="col-12 col-sm-10">
                <h3 class="partner_h3">파트너 관리</h3> <!-- 왼쪽 상단 회원관리 글씨 css -->
 		<hr style="border: solid 1px #4e3418;">
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
										<option value="1">대표명</option>
										<option value="2">전화번호</option>
									</select>
									<input type="text" id="search_word" name="search_word" value="${search_word}">
								</td>
								
								<td>가게 상태 구분</td>
								<td>
								<ul class="checkbox_ul">
									<li><label><input type="radio" name="check_state" value="0" checked/> 파트너 가게</label></li>
									<li><label><input type="radio" name="check_state" value="1" /> 파트너 승인 대기</label></li>
									<li><label><input type="radio" name="check_state" value="2" /> 계약 해지된 가게</label></li>
									<li><label><input type="radio" name="check_state" value="3" /> 정지된 가게</label></li>
								</ul>
								</td>
							</tr>
						</table>
					</div>
					<div class="submit_btn">
						<button type="submit" id="search_btn">검색</button>
					</div>
					<hr style="border: solid 1px #4e3418;">

					<%-- 파트너가 있는 경우 --%>
      				<c:if test="${listcount > 0}">
	      			<div class="Partnerfunction_gird">
	      				<div id="listcount_div">
			      			<b><font size=4>파트너 수 : ${listcount}</font></b>	      				
	      				</div>
	      				<div></div>
	      				<div></div>
	      				<div></div>
	      				<div></div>
      				</div>    				
      				
      				<table class="Partner_tb">
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
			               	               
			               <c:forEach var="sil" items="${Storelist}" varStatus="status">
			               		<!-- 정상 영업중인 가게 리스트 -->
			               		<!-- 파트너 승인 대기 리스트 -->
			               		<!-- 활동 정지를 당한 가게 리스트 -->
			               		<!-- 계약 관계 종료로 인한 가게 리스트 -->
			               <c:choose>
			               		<c:when test="${sil.store_status == 1 or sil.store_status == 2}">
			               		<tr>
			            			<td>${sil.user_email}</td>
			         				<td>${sil.store_name}</td>
			         				<td>${sil.user_name}</td>
			         				<td>${sil.user_tel}</td>
			         				<td>${sil.store_tel}</td>
			         				<td>${sil.store_address_si} ${sil.store_address_gu} ${sil.store_address_dong} ${sil.store_address_etc}</td>
			         				<td>
			         					<a href="PartnerSusp?store_id=${sil.store_id}" class="PartnerSusp">가게 정지</a>&nbsp;
			         				</td>
			            		</tr>
			               		</c:when>
			               		
			               		<c:when test="${sil.store_status == 3}">
			               		<tr>
			               			<input type="hidden" value="${sil.store_id}" id="store_id">
			            			<td>${sil.user_email}</td>
			         				<td>${sil.store_name}</td>
			         				<td>${sil.user_name}</td>
			         				<td>${sil.user_tel}</td>
			         				<td>${sil.store_tel}</td>
			         				<td>${sil.store_address_si} ${sil.store_address_gu} ${sil.store_address_dong} ${sil.store_address_etc}</td>
			         				<td>			
										<!-- Large modal -->
										<div class="btn btn-primary" data-toggle="modal"
														data-target=".bd-example-modal-lg${status.index}"><div class="getStoreIf">가게 정보</div></div>
										
										<div class="modal fade bd-example-modal-lg${status.index}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
										  <div class="modal-dialog modal-lg">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h4 class="modal-title">${sil.store_name}</h4>
										      </div>
										      <div class="modal-body">
										        <div class="PartnerStoreIf_gird">
										        	<div>${sil.store_saved_image}</div>
										        	<div style="text-align: left;">
											        	<div>상호명: ${sil.store_name}</div>
											        	<div>대표명: ${sil.user_name}</div>		
											        	<div>가게 주소: ${sil.store_address_si} ${sil.store_address_gu} ${sil.store_address_dong} ${sil.store_address_etc}</div>		
														<div>가게 전화번호: ${sil.store_tel}</div>
											        	<div>평일 영업 시간: ${sil.opening_h_w_open} ~ ${sil.opening_h_w_close}</div>		
											        	<div>휴일 영업 시간: ${sil.opening_h_h_open} ~ ${sil.opening_h_h_close}</div>		
											        	<div>휴일: ${sil.holiday}</div>	
										        	</div>	
										        </div>
											     	<!-- ajax 처리 -->
											        <div class="ajax_menu" style="text-align: left; padding: 10px 0px;">
											        	
											        </div>
										        </div>
										      <div class="modal-footer">
	      											
	      											<script>
		      											function storeApprove() {
		      												location.href="${pageContext.request.contextPath}/admin/PartnerAct?store_id=${sil.store_id}";
		      												
		      											}
	      											</script>
										      </div>
										    </div>
										  </div>
										</div>
			         				</td>
			            		</tr>
			               		</c:when>
			               		
			               		<c:when test="${sil.store_status == 4}">
			               		<tr>
			            			<td>${sil.user_email}</td>
			         				<td>${sil.store_name}</td>
			         				<td>${sil.user_name}</td>
			         				<td>${sil.user_tel}</td>
			         				<td>${sil.store_tel}</td>
			         				<td>${sil.store_address_si} ${sil.store_address_gu} ${sil.store_address_dong} ${sil.store_address_etc}</td>
			         				<td>
			         					<a href="PartnerAct?store_id=${sil.store_id}" class="PartnerActive">가게 정지 해제</a>&nbsp;
			         				</td>
			            		</tr>
			               		</c:when>	

			               		<c:when test="${sil.store_status == 5}">
			               		<tr>
			            			<td>${sil.user_email}</td>
			         				<td>${sil.store_name}</td>
			         				<td>${sil.user_name}</td>
			         				<td>${sil.user_tel}</td>
			         				<td>${sil.store_tel}</td>
			         				<td>${sil.store_address_si} ${sil.store_address_gu} ${sil.store_address_dong} ${sil.store_address_etc}</td>
			         				<td>
			         					<a href="#" class="PartnerTermi">재계약</a>&nbsp;
			         				</td>
			            		</tr>
			               		</c:when>
			                </c:choose>
			            	</c:forEach>
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
		                     href="PartnerList?page=${page-1}&search_field=${search_field}&search_word=${search_word}&check_state=${check_state}"
		                     class="page-link">이전</a> &nbsp;</li>
		               </c:if>
		
		
		               <c:forEach var="a" begin="${startpage}" end="${endpage}">
		                  <c:if test="${a == page }">
		                     <li class="page-item"><a class="page-link current" href="#">${a}</a>
		                     </li>
		                  </c:if>
		
		                  <c:if test="${a != page }">
		                     <li class="page-item"><a
		                        href="PartnerList?page=${a}&search_field=${search_field}&search_word=${search_word}&check_state=${check_state}"
		                        class="page-link">${a}</a></li>
		                  </c:if>
		               </c:forEach>
		
		
		               <c:if test="${page >= maxpage }">
		                  <li class="page-item"><a class="page-link current" href="#">&nbsp;다음</a>
		                  </li>
		               </c:if>
		
		               <c:if test="${page < maxpage }">
		                  <li class="page-item"><a
		                     href="PartnerList?page=${page+1}&search_field=${search_field}&search_word=${search_word}&check_state=${check_state}"
		                     class="page-link">&nbsp;다음</a></li>
		               </c:if>
		         </ul>
		         </div>
			</c:if>
			<%-- <c:if test="${listcount > 0}"> end --%>
			</div>
			
			<%-- 파트너가 없는 경우 --%>
			<c:if test="${listcount == 0 && empty search_word}">
				<h1>파트너가 없습니다.</h1>
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
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</body>
</html>