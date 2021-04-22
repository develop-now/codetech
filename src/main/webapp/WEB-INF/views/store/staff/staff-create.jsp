<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/14
  Time: 12:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Insert Page</title>
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/staff-create.js"></script>
    <script>
        $(() => {
            getLoadStoreListByOwner()

            $("#backBtn").on("click", () => {
                history.back();
            })
        })
    </script>
</head>
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
                            <h3 class="text-right">직원추가하기</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <form action="<c:url value="/staff/searchAction"/>" method="post"
                                  id="searchStaffForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <input type="hidden" name="owner_id" value="${idValue}">

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">내 가게*</label>
                                    <div class="col-sm-10">
                                        <div class="d-flex align-items-center" id="store_target">
                                            <div class="custom-control custom-radio custom-control-inline store_template d-none">
                                                <input type="radio" id="store" name="store_id"
                                                       class="custom-control-input">
                                                <label class="custom-control-label" for="store">store_name_temp</label>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback" id="storeCheckFeedback">
                                            가게를 선택하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="search_val" class="col-sm-2 col-form-label">검색값*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="search_val" name="search_val"
                                               placeholder="검색할 이름이나 이메일주소를 입력하세요" data-valid="required">
                                        <div class="invalid-feedback">
                                            이름이나 이메일주소를 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group d-flex">
                                    <button class="btn btn-success" id="submitBtn" type="submit">검색</button>
                                    <button class="btn btn-info" id="resetBtn" type="reset">초기화</button>
                                </div>
                            </form>
                        </div>

                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <div class="container">
                                <div class="col-12">
                                    <h6>직원 후보 리스트</h6>
                                </div>
                                <div class="col-12 table-responsive">
                                    <table class="table table-hover text-center">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">이름</th>
                                            <th scope="col">이메일</th>
                                            <th scope="col">가입일</th>
                                            <th scope="col">등록</th>
                                        </tr>
                                        <tr id="staff_template_tr" class="d-none">
                                            <th scope="row" class="staff_count"></th>
                                            <td class="staff_name"></td>
                                            <td class="staff_email"></td>
                                            <td class="staff_date"></td>
                                            <td class="staff_register"></td>
                                        </tr>
                                        </thead>
                                        <tbody id="target-tbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
