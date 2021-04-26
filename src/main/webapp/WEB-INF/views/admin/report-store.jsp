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
	/* 메뉴 리스트 클릭 CSS */
	.report_head {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr; 
		margin: 20px 0px;
	}
	
	.report_select_list {
		text-align: center;
		display: grid;
		grid-template-columns: 0.5fr 0.5fr 0.5fr 5fr;
		margin: 30px 0px;
		color: #737373;
	}
	
	.reportStore {
		border-top: 3px solid #392714;
		border-left: 1px solid #392714;
		border-right: 1px solid #392714;
		color: #392714;
		background: white;
	}
	
	.reportUser {
		border-top: 1px solid #e2e2d0;
		border-left: 1px solid #e2e2d0;
		border-bottom: 1px solid #C3C3D1;
	}
	
	.reportUserStore {
		border-top: 1px solid #e2e2d0;
		border-right: 1px solid #e2e2d0;
		border-bottom: 1px solid #C3C3D1;
	}
	
	.etc {
		border-bottom: 1px solid #C3C3D1;
	}
	
	.report_select_list > div{
		padding: 10px;
	}
	
	.reportStore:hover {
		cursor: pointer
	}
	
	.reportUser:hover {
		background: #F2F2F8;
		cursor: pointer
	}
	
	.reportUserStore:hover {
		background: #F2F2F8;
		cursor: pointer
	}
	
	.report_condition {
		border: 1px solid #392714;
		display: grid;
		grid-template-columns: 0.5fr 2.5fr 4fr 1fr;
		padding: 20px;
	}
	
	#search_btn {
		border-radius: 5px;
		border: 0px;
		padding: 5px 15px;
		background:  #4e3418;
		color: white;
	}
	
	/* div 영역에 테이블 있음 */
	.report_user_list {
		margin: 30px 0px;
	}
	
	.report_user_table {
		width: 100%;
		border-collapse: collapse
	}
	
	.report_user_list th {
		border-top: 1px solid #392714;
		border-bottom: 1px solid #392714;
		padding: 20px 0px;
		text-align: center;	
	}
	
	.report_user_list td {
		border-bottom: 1px solid #392714;
		padding: 20px 0px;
		text-align: center;	
	}
	
	.reported_user_if {
		display: grid;
		grid-template-columns: 1fr 5fr;
		padding: 30px 0px;
	}
	
	.reported_user_img {
		border: 1px solid #392714;
		height: 100px;
		width: 100px;
	}
</style>
<head>
    <title>Report Store</title>
    <%@include file="../partial/head.jsp" %>
    <script>
    	$(function() {
    		/* 신고 글 클릭 시 이벤트 발생 */
    		$('.changeStatus').click(function() {
				console.log("글번호: [" + $(this).parent().parent().find("input").val() + "] 신고 글의 상태를 변경합니다.");
				
				$.ajax({
					method 	 : "post",
					url	   	 : "RSLstatusProcessing",
					data   	 : { "user_status_id" : $(this).parent().parent().find("input").val() },
					dataType : "json",
					cache	 : false,
					success	 : function(data) {
						console.log("유저 신고 글 변경 성공");
					},
					
					error 	 : function() {
						console.log("유저 신고 글 상태 변경 실패");
					}
				});
    		});
    		
    		$('.Completed').click(function() {
    			console.log("글번호: [" + $(this).closest('tr').find('input').val() + "] 신고 글을 처리 상태로 변경합니다.");
				var answer = confirm("해당 신고 글을 처리 상태로 변경 하시겠습니까?");
				
				if (!answer) {
					event.preventDefault();
				} else {
	    			$.ajax({
						method 	 : "post",
						url	   	 : "RSLstatusCompleted",
						data   	 : { "user_status_id" :$(this).closest('tr').find('input').val() },
						dataType : "json",
						cache	 : false,
						success	 : function(data) {
							console.log("유저 신고 글 처리 성공");
							alert("신고 글에 대한 처리가 완료 되었습니다.");
						},
						
						error 	 : function() {
							console.log("유저 신고 글 처리 실패");
						}
					});	
				} 
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
                <form action="reportStore">
	            	<div class="report_head">
	            		<div><h3 class="report_h3">신고 리스트</h3></div>
	            		<div></div>
	            		<div></div>
	            		<div></div>
	            	</div>
	            	
	            	<div class="report_select_list">
	            		<div class="reportUser" onclick="location.href='${pageContext.request.contextPath}/admin/reportUser';">유저 신고 </div>
	            		<div class="reportStore" onclick="location.href='${pageContext.request.contextPath}/admin/reportStore';">파트너 신고</div>
	            		<div class="reportUserStore" onclick="location.href='${pageContext.request.contextPath}/admin/reportUserStore';">가게 신고</div>
	            		<div class="etc"></div>
	            	</div> <!-- report_select_list End -->
	            	
	            	<div class="report_condition">
	            		<div style="margin: auto">조건</div>
	            		<div>
	            			<select class="select_search" name="select_field" style="height: 100%">
	            				<option value="0" selected>신고자</option>
	            				<option value="1">신고 대상</option>
	            				<option value="2">신고 일자</option>
	            			</select>
	            			&nbsp;
	            			<input type="text" name="search_text" style="width: 300px; height: 100%">
	            		</div>
	            		<div></div>
	            		<div style="text-align: center">
	            			<button type="submit" id="search_btn">조회하기</button>
	            		</div>
	            	</div>	 <!-- report_condition End -->
	            	
	            	<div class="report_user_list">
	            		<table class="report_user_table">
	            			<tr>
	            				<th>신고자</th>
	            				<th>신고 제목</th>
	            				<th>신고 대상</th>
	            				<th>신고된 수</th>
	            				<th>신고글 상태</th>
	            				<th>신고된 날짜</th>
	            			</tr>
	            			
	            			<c:forEach var="rul" items="${ReportUserList}" varStatus="status">
	            			<tr>
					            <input type="hidden" value="${rul.user_report_id}" id="user_report_id"/>
	            				<td><div>${rul.reporter_user_name}</div></td>
	            				<td>
	            					<div class="changeStatus" data-toggle="modal" data-target=".bd-example-modal-lg${status.index}">${rul.report_subject}</div>
	            					<div class="modal fade bd-example-modal-lg${status.index}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
										    <div class="modal-content">
												<div class="modal-header">
										        	<h4 class="modal-title">${rul.report_subject}</h4>
										      	</div>
										      	<div class="modal-body">
										        	<div class="reported_user_if">
											        	<div class="reported_user_img">${rul.reported_user_profile}</div>
											        	<div style="text-align: left">
											        		<div>아이디: ${rul.reported_user_email}</div>
											        		<div>사용자: ${rul.reported_user_name}</div>
											        		<div>전화번호: ${rul.reported_user_tel}</div>
											        		<div>주소: ${rul.reported_user_address}</div>
											        	</div>
										        	</div>
										        	<div style="text-align: left">신고 사유 (누적된 신고 수: ${rul.reported_report_count})</div>
										        	<div style="text-align: left; margin: 30px 0px">${rul.report_content}</div>
										        </div>
										        <div class="modal-footer">
										        	<button type="button" class="btn btn-submit" name="cld_btn"><div class="Completed">신고 처리</div></button>
													<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
										        </div>
										    </div>
										</div>
									</div>
	            				</td> 
	            				<td><div>${rul.reported_user_name}</div></td>
	            				<td><div>${rul.reported_report_count}</div></td>
	            				<td><!-- 읽으면 글씨 색깔 변하고 새로고침 되게끔? -->
		            				<c:choose>
		            					<c:when test="${rul.report_status == 1}">
				            				<div><c:out value="신고 접수"/></div>
		            					</c:when>   					
		            					
		            					<c:when test="${rul.report_status == 2}">
		            						<div><c:out value="처리 대기"/></div>
		            					</c:when>
		            				</c:choose>
	            				</td>
	            				
	            				<td><div>${rul.created_at}</div></td>
	            			</tr>
	            			</c:forEach>
	            		</table>
	            	</div>
	            	
	            	<div style="margin: 50px;">
		         	<ul class="pagination justify-content-center">
		              <c:if test="${page <= 1}">
		                 <li class="page-item"><a class="page-link current" href="#">이전&nbsp;</a>
		                 </li>
		               </c:if>
		               <c:if test="${page > 1}">
		                  <li class="page-item"><a
		                     href="reportStore?page=${page-1}&search_text=${search_text}&search_word=${search_word}"
		                     class="page-link">이전</a> &nbsp;</li>
		               </c:if>
		
		
		               <c:forEach var="a" begin="${startpage}" end="${endpage}">
		                  <c:if test="${a == page }">
		                     <li class="page-item"><a class="page-link current" href="#">${a}</a>
		                     </li>
		                  </c:if>
		
		                  <c:if test="${a != page }">
		                     <li class="page-item"><a
		                        href="reportStore?page=${a}&search_text=${search_text}&search_word=${search_word}"
		                        class="page-link">${a}</a></li>
		                  </c:if>
		               </c:forEach>
		
		
		               <c:if test="${page >= maxpage }">
		                  <li class="page-item"><a class="page-link current" href="#">&nbsp;다음</a>
		                  </li>
		               </c:if>
		
		               <c:if test="${page < maxpage }">
		                  <li class="page-item"><a
		                     href="reportStore?page=${page+1}&search_text=${search_text}&search_word=${search_word}"
		                     class="page-link">&nbsp;다음</a></li>
		               </c:if>
		         	</ul>
		         	</div>
				</form>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>
