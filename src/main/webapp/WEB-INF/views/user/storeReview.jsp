<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/03/31
  Time: 2:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>User Index</title>
<%@include file="../partial/head.jsp"%>
</head>
<body>
	<div class="container-fluid px-0">
		<%-- main nav --%>
		<%@include file="../partial/nav.jsp"%>

		<%-- info Modal --%>
		<%@include file="../partial/infoModal.jsp"%>

		<%-- alert Modal --%>
		<%@include file="../partial/alertModal.jsp"%>


		<!-- Page Content -->
		<div class="container-fluid">
			<div class="row">
				<%@include file="user-nav-mypage.jsp"%>
				<div class="col-12 col-sm-10">
				<!--original modal-->
					<input type="text" name="store_id" id="store_id" value="1">
					<button type="button" id="cmtReviewbtn"onclick='modalOpen();'>리뷰보기</button>
					

					
					<div class="modal fade storeReviewModal" id="storeReviewModal"
						tabindex="-1" role="dialog"
						aria-labelledby="storeReviewModalTitle" aria-hidden="true">

						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header storeReviewModal-header">
									<h1 class="storeReviewModal-title" id="storeReviewModalTitle">가게이름</h1>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							
								<div class="modal-body storeReviewModal-body">
									<table>
										<tbody>
											<tr>
												<td>유저닉네임</td>
												<td>리뷰</td>
											</tr>
											<tr>
												<td>사장님</td>
												<td>사장님 댓글</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="modal-footer storeReviewModal-footer">
									<button type="button" onclick='modalOpen(1);'class="storeReviewModal__button" >더보기</button>
								</div>
							</div>
						</div>
				<!--original moda end-->
					</div>
				</div>
			</div>
		</div>
			<!-- /.container -->

			<%-- footer --%>
			<%@include file="../partial/footer.jsp"%>

			<script type="text/javascript">
				function goReportStore() {
					var query = "reported_store=1"
					location.href = "user/reportWrite?" + query;

				}
			</script>
		</div>
		
<script src="${pageContext.request.contextPath}/resources/js/user/order-storeReview.js"></script>
</body>
</html>
