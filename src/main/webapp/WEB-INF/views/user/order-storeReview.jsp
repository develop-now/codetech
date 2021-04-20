<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="modal fade storeReviewModal2" id="storeReviewModal2" tabindex="-1" role="dialog" aria-labelledby="storeReviewModal2Title"
     aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header storeReviewModal2-header">
                    <h1 class="storeReviewModal2-title" id="storeReviewModalTitle">가게이름</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body storeReviewModal2-body">
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
                <div class="modal-footer storeReviewModal2-footer">
                    <button type="button" class="storeReviewModal2__button">더보기</button>
                </div>
            </div>
        </div>
</div>

