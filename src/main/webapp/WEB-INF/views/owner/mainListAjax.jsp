<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 class="my-4">
					이번달 랭커 카페 <small>소개합니다!</small>
				</h1>

				<!-- Blog Post -->
				<c:forEach var="store" items="${stores}" varStatus="status">
					<c:if test="${store.store_status == 1}">

						<div class="card mb-4">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}"
								alt="Card image cap">
							<div class="card-body">
								<h2 class="card-title">${store.store_name}</h2>

								<p class="card-text">5분후 수령 가능</p>
								<a href="#" class="btn btn-primary">주문하기 &rarr;</a>
							</div>
							<div class="card-footer text-muted">
								<img class="card-img-heart"
									src="${pageContext.request.contextPath}/resources/upload/love.png"
									width="30" height="30" alt="">
								${likes[status.index]}&nbsp;&nbsp;<img class="card-img-comments"
									src="${pageContext.request.contextPath}/resources/upload/message.png"
									width="30" height="30" alt="">&nbsp;${comments[status.index]}
							</div>
						</div>
					</c:if>

					<c:if test="${store.store_status == 2}">

						<div class="card mb-4">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/resources/upload/${store.store_saved_image}"
								alt="Card image cap" style="filter: blur(5px)">
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
								${likes[status.index]}&nbsp;&nbsp;<img class="card-img-comments"
									src="${pageContext.request.contextPath}/resources/upload/message.png"
									width="30" height="30" alt="">&nbsp;${comments[status.index]}
							</div>
						</div>
					</c:if>

				</c:forEach>
	
