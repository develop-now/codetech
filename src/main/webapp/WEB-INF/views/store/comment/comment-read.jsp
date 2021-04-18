<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 5:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store Comments Read Page</title>
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/comment-read.js"></script>
    <script>
        $(() => {
            $("#backBtn").on("click", () => {
                location.href = "/store/store-comment"
            })
        })
    </script>
</head>

<c:set var="idValue" value="${user_id}" scope="session"/>

<body>
<div class="container-fluid px-0">
    <%-- main nav --%>
    <%@include file="../../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid" id="bodyWrapper">
        <div class="row">
            <%@include file="../store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-2">
                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>
                        </div>

                        <div class="ml-auto mr-2">
                            <h3 class="text-right">리뷰 상세보기</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <div class="container">
                                <div class="row">
                                    <c:if test="${!empty list}">
                                        <c:forEach var="comment" items="${list}">
                                            <c:if test="${comment.comment_lev == 0}">

                                                <c:set var="original_comment" value="${comment}"/>

                                                <div class="col-12">
                                                    <div class="card border-primary mb-3" style="max-width:90%">
                                                        <div class="card-header">
                                                            <h5>작성자 : ${comment.comment_writer_value}</h5>
                                                        </div>
                                                        <div class="card-body bg-primary text-white">
                                                            <p class="card-text">${comment.comment_content}</p>
                                                        </div>
                                                        <div class="card-footer text-right">
                                                            <small class="text-muted ">${comment.updated_at.substring(0,10)}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${comment.comment_lev > 0}">
                                                <div class="col-12">
                                                    <div class="card border-success mb-3 float-right"
                                                         style="max-width:90%"
                                                         id="comment_${comment.comment_id}">
                                                        <div class="card-header">
                                                            <h5>작성자 : ${comment.comment_writer_value}</h5>
                                                            <h6 class="text-right"> 상태
                                                                : ${comment.comment_status == 1 ? "<span class='text-success'>활성화</span>" : "<span class='text-danger'>비활성화</span>"}</h6>
                                                        </div>
                                                        <div class="card-body bg-success text-white">
                                                            <p class="card-text">${comment.comment_content}</p>

                                                            <c:if test="${comment.comment_status eq 1}">
                                                                <div class="comment__action__wrapper">
                                                                    <div class="btn-group-sm float-right">
                                                                        <button class="btn btn-sm btn-outline-light"
                                                                                onclick="updateComment('${comment.comment_id}')">
                                                                            수정
                                                                        </button>
                                                                        <button class="btn btn-sm btn-outline-light"
                                                                                onclick="deleteComment('${comment.comment_id}')">
                                                                            삭제
                                                                        </button>
                                                                    </div>

                                                                        <%-- UPDATE MODAL START --%>
                                                                    <div id="update__modal__wrapper">
                                                                        <div class="modal fade"
                                                                             id="updateModal_${comment.comment_id}"
                                                                             data-backdrop="static"
                                                                             data-keyboard="false"
                                                                             tabindex="-1"
                                                                             aria-labelledby="update_staticBackdropLabel_${comment.comment_id}"
                                                                             aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title text-info"
                                                                                            id="update_staticBackdropLabel_${comment.comment_id}">
                                                                                            답변수정
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                                class="close"
                                                                                                data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <form method="post"
                                                                                              action="<c:url value="/comment/updateAction"/>"
                                                                                              id="updateForm_${comment.comment_id}">
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}">
                                                                                            <input type="hidden"
                                                                                                   name="comment_id"
                                                                                                   value="${comment.comment_id}">
                                                                                            <input type="hidden"
                                                                                                   name="comment_ref"
                                                                                                   value="${comment.comment_ref}">
                                                                                            <input type="hidden"
                                                                                                   name="update_flag"
                                                                                                   value="update">
                                                                                            <div class="form-group row">
                                                                                                <label for="update_comment_content_${comment.comment_id}"
                                                                                                       class="col-sm-2 col-form-label text-info">
                                                                                                    답변*</label>
                                                                                                <div class="col-sm-10">
                                                <textarea name="comment_content"
                                                          id="update_comment_content_${comment.comment_id}"
                                                          class="form-control"
                                                          placeholder="답변을 입력하세요"
                                                          data-valid="required">${comment.comment_content}</textarea>
                                                                                                    <div class="invalid-feedback">
                                                                                                        답변을 입력하세요
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </form>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button"
                                                                                                class="btn btn-secondary"
                                                                                                data-dismiss="modal">
                                                                                            닫기
                                                                                        </button>
                                                                                        <button type="button"
                                                                                                class="btn btn-info"
                                                                                                onclick="submitUpdate('${comment.comment_id}')"
                                                                                                id="updateSubmit">
                                                                                            수정
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                        <%-- UPDATE MODAL END --%>

                                                                        <%-- DELETE MODAL START --%>
                                                                    <div id="update__modal__wrapper">
                                                                        <div class="modal fade"
                                                                             id="deleteModal_${comment.comment_id}"
                                                                             data-backdrop="static"
                                                                             data-keyboard="false"
                                                                             tabindex="-1"
                                                                             aria-labelledby="delete_staticBackdropLabel_${comment.comment_id}"
                                                                             aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title text-danger">
                                                                                            답변삭제
                                                                                        </h5>
                                                                                        <button type="button"
                                                                                                class="close"
                                                                                                data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <form method="post"
                                                                                              action="<c:url value="/comment/updateAction"/>"
                                                                                              id="deleteForm_${comment.comment_id}">
                                                                                            <input type="hidden"
                                                                                                   name="${_csrf.parameterName}"
                                                                                                   value="${_csrf.token}">
                                                                                            <input type="hidden"
                                                                                                   name="comment_id"
                                                                                                   value="${comment.comment_id}">
                                                                                            <input type="hidden"
                                                                                                   name="comment_ref"
                                                                                                   value="${comment.comment_ref}">
                                                                                            <input type="hidden"
                                                                                                   name="update_flag"
                                                                                                   value="delete">
                                                                                            <h6 class="text-warning">
                                                                                                삭제를 원하시면 확인을 눌러주세요
                                                                                            </h6>
                                                                                        </form>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button"
                                                                                                class="btn btn-secondary"
                                                                                                data-dismiss="modal">
                                                                                            닫기
                                                                                        </button>
                                                                                        <button type="button"
                                                                                                class="btn btn-danger"
                                                                                                onclick="submitDelete('${comment.comment_id}')"
                                                                                                id="deleteSubmit">
                                                                                            삭제
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                        <%-- DELETE MODAL END --%>
                                                                </div>
                                                            </c:if>

                                                        </div>
                                                        <div class="card-footer text-right">
                                                            <small class="text-muted ">${comment.updated_at.substring(0,10)}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="col-12" id="reply__modal__wrapper">
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                    data-target="#staticBackdrop" id="replyModalOpenBtn">
                                답변달기
                            </button>
                            <%-- CREATE MODAL START --%>
                            <div class="modal fade" id="replyModal" data-backdrop="static" data-keyboard="false"
                                 tabindex="-1" aria-labelledby="reply_staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="reply_staticBackdropLabel">답변달기</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post" action="<c:url value="/comment/createAction"/>"
                                                  id="replyForm">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}">
                                                <input type="hidden" name="comment_writer" value="${idValue}">
                                                <input type="hidden" name="comment_store"
                                                       value="${original_comment.comment_store}">
                                                <input type="hidden" name="comment_ref"
                                                       value="${original_comment.comment_ref}">
                                                <input type="hidden" name="comment_lev"
                                                       value="${original_comment.comment_lev}">
                                                <input type="hidden" name="comment_seq"
                                                       value="${original_comment.comment_seq}">

                                                <div class="form-group row">
                                                    <label for="comment_content" class="col-sm-2 col-form-label">
                                                        답변*
                                                    </label>
                                                    <div class="col-sm-10">
                                                <textarea name="comment_content" id="comment_content"
                                                          class="form-control"
                                                          placeholder="답변을 입력하세요" data-valid="required"></textarea>
                                                        <div class="invalid-feedback">
                                                            답변을 입력하세요
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                닫기
                                            </button>
                                            <button type="button" class="btn btn-success" id="replySubmit">전송
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- CREATE MODAL END --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../../partial/footer.jsp" %>
</div>
</body>
</html>