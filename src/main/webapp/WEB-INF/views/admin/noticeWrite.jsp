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
		margin: 20px 0px;
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
	<!-- ckeditor5 -->
	<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js"></script>
	
    <title>Admin Notice</title>
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
        <div class="row">
            <div class="col-12 col-sm-10">
                <h3 class="notice_h3">공지 사항 작성</h3>
	    		<hr style="border: solid 1px #e2e2d0;">
	    		<div>
		    		<b><span style="font-size:1.2em">제목</span></b>
		    		<input type="text" name="Notice_subject" id="Notice_subject" placeholder="공지사항 제목을 입력하세요." required>
		    		
		    		<b><span style="font-size:1.2em">내용</span></b>
		    		<textarea name="Notice_content" id="Notice_content" placeholder="내용을 입력하세요."></textarea>
		    		<script>
			            ClassicEditor /* 에디터 사용을 위해 textarea 밑에 스크립트 추가 */
			                .create( document.querySelector( '#Notice_content' ))
			                .catch( error => {
			                    console.error( error );
			                });
			        </script>
    			</div>
    			
			    <div class="btn_group">
					<button type=submit class="btn_submit">등록</button>
					<button type=reset class="btn_cancle">취소</button>
				</div>
            </div>
        </div>
    </div>
    <!-- /.container -->


    <!-- Page Content -->
    <div class="container-fluid">
    	
    </div>
    <!-- /.container -->
	
    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>

