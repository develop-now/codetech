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
<head>
<style>
	.notice_h3 {
		margin-top: 20px;
		margin-bottom: 40px
	}
	
	.Not_subject {
		border-top: solid 1px #4e3418;
		display: grid;
		grid-template-columns: 1fr 5fr;
	}
	
	.Not_categories {
		display: grid;
		grid-template-columns: 1fr 1.7fr 3.3fr; 
	}
	
	.Not_content {
		display: grid;
		grid-template-columns: 1fr 5fr 1fr;
		padding-top: 30px;
	}
	
	#Notice_subject {
		margin: 10px 0px;
		padding: 5px;
		width: 100%;
		border: 1px solid #C6C6C6;
	}
	
	.ck.ck-editor {
		max-width: 100%;
	}
	
	.ck-editor__editable {
	    min-height: 500px;
	}
	
	.btn_group {
		margin: 20px 0px;
	}
	
	.btn_submit {
		border-radius: 5px;
		border: 0px;
		padding: 5px 15px;
		background:  #4e3418;
		color: white;
		margin-bottom: 14px;
		margin-right: 10px;
	}
	
	.btn_cancle {
		border-radius: 5px;
		border: 0px;
		padding: 5px 15px;
		background:  #ecf2f8;
		color: black;
		margin-bottom: 14px;
	}
	
	.btn_submit:hover {
		border-radius: 5px;
		border: 0px;
		padding: 8px 18px;
		background:  #4e3418;
		color: white;
		margin-bottom: 14px;
		margin-right: 10px;
		box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2);
	}
	
	.btn_cancle:hover {
		border-radius: 5px;
		border: 0px;
		padding: 8px 18px;
		background:  #ecf2f8;
		color: black;
		margin-bottom: 14px;
		margin-right: 10px;
		box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2);
	}
</style>

    <title>Notice Write</title>
    <%@include file="../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 
	<script>
		window.onload = function() {
			ck = CKEDITOR.replace("Notice_content");
		};
		
		$(function() {	
			$("form").submit(function() {
				if ($.trim($('input[name="notice_subject"]').val()) == "") {
					alert ("작성할 게시글의 제목을 입력해 주세요.");
					
					$('input[name="notice_subject"]').focus();
					return false;
				}
				
				if ($('input:radio(name="notice_status"):checked').length < 1) {
					alert("작성할 게시글의 카테고리를 선택 해주세요.");
					
					event.preventDefault();
				}
				
				if ($.trim($('input[name="notice_content"]').val()) == "") {
					alert ("작성할 게시글의 내용을 입력해 주세요.");
					
					$('input[name="notice_content"]').focus();
					return false;
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
	    		<form action="noticeAdd" method="post">
                <h3 class="notice_h3">공지 사항 작성</h3> <!-- style="border: solid 1px #e2e2d0; -->
	    		<div>
		    		<div class="Not_subject">
		    			<div style="margin:auto 0px; padding: 30px 0px">
		    				<b><span style="font-size:1.2em">제목</span></b>
		    			</div>
			    		<div style="padding: 30px 0px">
			    			<input type="text" name="notice_subject" id="Notice_subject" placeholder="제목을 입력하세요." required>
			    		</div>  		
		    		</div>
		    		
		    		<div class="Not_categories">
		    			<div style="margin:auto 0px">
		    				<b><span style="font-size:1.2em">카테고리</span></b>
		    			</div>
		    			<div style="margin:auto 0px; height: 28px">
				    		<input type="radio" name="notice_status" id="noticeNews" value="1"/><label for="noticeNews">&nbsp;공지사항 &nbsp;</label>
				    		<input type="radio" name="notice_status" id="noticeEvent" value="2"/><label for="noticeEvent">&nbsp;이벤트 &nbsp;</label>
				    		<input type="radio" name="notice_status" id="noticeInspect" value="3"/><label for="noticeInspect">&nbsp;점검사항 &nbsp;</label>
		    			</div>
		    			<div></div>
		    		</div>    			    		
		    		
		    		<div class="Not_content">
			    		<div style="padding: 20px 0px">
			    			<b><span style="font-size:1.2em">내용</span></b>
			    		</div>
			    		<div></div>
			    		<div style="text-align: right">
			    			<!-- <input type="checkbox" name="noticeTop" id="noticeTop" value="0"/><label for="noticeTop">&nbsp;최상단에 등록</label> -->
			    		</div>
    				</div>
			    	<div>
				    	<textarea name="notice_content" id="Notice_content" placeholder="내용을 입력하세요." required></textarea>
			    	</div>
		    	</div>    		
    			
			    <div class="btn_group">
					<button type=submit class="btn_submit">등록</button>
					<button type=reset class="btn_cancle" onClick="history.go(-1)">취소</button>
				</div>	    		
	    		</form>
            </div>
        </div>
    </div>
    
    <!-- /.container -->


    <!-- Page Content -->
    <div class="container-fluid">
    	
    </div>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>

