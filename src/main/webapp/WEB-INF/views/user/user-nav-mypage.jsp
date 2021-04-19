<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
	.mypage-logo{
	width:100%;
	text-align: center;
	border-bottom:solid 1px gray;
	padding:5px;
	}
</style>
<div id="sideNav" class="col-12 col-sm-2">
	<div  class="mypage-logo"><strong>마이페이지</strong></div>
	<ul class="nav" id="storeNavWrapper">
		<li class="nav-item">
			<a href="${pageContext.request.contextPath}/user/infoMain"
				class="nav-link">정보관리</a>
		</li>
		<li class="nav-item">
			<a href="${pageContext.request.contextPath}/user/pointList"
				class="nav-link">포인트내역</a>
		</li>
		<li class="nav-item">
			<a href="${pageContext.request.contextPath}/user/reportList"
				class="nav-link">신고관리</a>
		</li>
		<li class="nav-item">
			<a href="${pageContext.request.contextPath}/comment/comment-list-by-user-ajax"
				class="nav-link">리뷰관리</a>
		</li>
				<li class="nav-item">
			<a href="${pageContext.request.contextPath}/user/orderList"
				class="nav-link">주문하기</a>
				
					<li class="nav-item">
			<a href="${pageContext.request.contextPath}/user/orderView?user_id=${user_id}"
				class="nav-link">주문내역</a>
				
									<li class="nav-item">
			<a href="${pageContext.request.contextPath}/user/favorite?user_id=${user_id}"
				class="nav-link">즐겨찾는 카페</a>
		</li>
		
	</ul>
</div>
