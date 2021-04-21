<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">
	<div class="row1">
		<div class="col-12 col-sm-10">
			<div class="container">

				<!-- Blog Post -->
				<c:forEach var="store" items="${stores}" varStatus="status">
					<c:if test="${store.store_status == 1}">

						<div class="card mb-4" style="width: 555px">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}"
								alt="Card image cap" style="height: 50% !important;">
							<div class="card-body">
								<h2 class="card-title">${store.store_name}</h2>

								<p class="card-text">5분후 수령 가능</p>
								<a href="${pageContext.request.contextPath}/user/orderMain?store_id=${store.store_id}" class="btn btn-primary">주문하기 &rarr;</a>
							</div>
							<div class="card-footer text-muted">
								<img class="card-img-heart"
									src="${pageContext.request.contextPath}/resources/upload/love.png"
									width="30" height="30" alt="">
								${store.like_count}&nbsp;&nbsp;<img class="card-img-comments"
									src="${pageContext.request.contextPath}/resources/upload/message.png"
									width="30" height="30" alt="">&nbsp;${store.comment_count}
							</div>
						</div>
					</c:if>

					<c:if test="${store.store_status == 2}">

						<div class="card mb-4" style="width: 555px">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}"
								alt="Card image cap" style="filter: blur(5px)"
								style="height: 50% !important;">
							<div class="card-body">
								<h2 class="card-title">${store.store_name}</h2>

								<p class="card-text">${store.store_name}</p>
								<a href="#" class="btn btn-primary"
									style="background-color: gray">준비중 &rarr;</a>
							</div>
							<div class="card-footer text-muted">
								<img class="card-img-heart"
									src="${pageContext.request.contextPath}/resources/upload/love.png"
									width="30" height="30" alt="">
								${store.like_count}&nbsp;&nbsp;<img class="card-img-comments"
									src="${pageContext.request.contextPath}/resources/upload/message.png"
									width="30" height="30" alt="">&nbsp;${store.comment_count}
							</div>
						</div>
					</c:if>

				</c:forEach>

			</div>
		</div>
	</div>
</div>