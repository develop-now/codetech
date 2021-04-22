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
	
	.reportUser {
		border-top: 3px solid #392714;
		border-left: 1px solid #392714;
		border-right: 1px solid #392714;
		color: #392714;
		background: white;
	}
	
	.reportStore {
		border-top: 1px solid #e2e2d0;
		border-right: 1px solid #e2e2d0;
		border-bottom: 1px solid #C3C3D1;
	}
	
	.reportComment {
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
	
	.reportUser:hover {
		cursor: pointer
	}
	
	.reportStore:hover {
		background: #F2F2F8;
		cursor: pointer
	}
	
	.reportComment:hover {
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
    <title>Report User</title>
    <%@include file="../partial/head.jsp" %>
    <script>
    	$(function() {
    		$('#modal').on('hidden.bs.modal', function () {
    		    console.log('modal close');
    		  this.reset();
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
            <div class="col-12 col-sm-10">
                <form action="reportUser">
	            	<div class="report_head">
	            		<div><h3 class="report_h3">신고 리스트</h3></div>
	            		<div></div>
	            		<div></div>
	            		<div><input type="hidden" name="report_status" value="0"/></div>
	            	</div>
	            	
	            	<div class="report_select_list">
	            		<div class="reportUser" onclick="location.href='${pageContext.request.contextPath}/admin/reportUser';">유저 신고 </div>
	            		<div class="reportStore" onclick="location.href='${pageContext.request.contextPath}/admin/reportStore';">가게 신고</div>
	            		<div class="reportComment" onclick="location.href='${pageContext.request.contextPath}/admin/reportComment';">댓글 신고</div>
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
	            			
	            			<c:forEach var="rul" items="${ReportUserList}">
	            			<tr>
	            				<td><div>${rul.reporter_user_name}</div></td>
	            				<td>
	            					<div data-toggle="modal" data-target=".bd-example-modal-lg">${rul.report_subject}</div>
	            					
	            					<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
										        	<button type="button" class="btn btn-submit">신고 접수</button>
													<button type="button" class="btn btn-default">취소</button>
										        </div>
										    </div>
										</div>
									</div>
	            				</td>
	            				<td><div>${rul.reported_user_name}</div></td>
	            				<td><div>${rul.reported_report_count}</div></td>
	            				<td><div>${rul.report_status}</div></td>
	            				<td><div>${rul.created_at}</div></td>
	            			</tr>
	            			</c:forEach>
	            		</table>
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
