<%--
  Created by IntelliJ IDEA.
  User: im-inseop
  Date: 2021/04/01
  Time: 5:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Menu Update Page</title>
    <%@include file="../../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/menu-update.js"></script>
    <script>
        $(() => {
            getLoadCategoryList();

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
                            <h3 class="text-right">메뉴 수정</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <form action="<c:url value="/menu/updateAction"/>" method="post"
                                  enctype="multipart/form-data" id="updateMenuForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <input type="hidden" name="menu_id" value="${menu.menu_id}">
                                <div class="form-group row">
                                    <label for="store_name" class="col-sm-2 col-form-label">가게이름*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="store_name" name="store_name"
                                               value="${menu.store_name}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_name" class="col-sm-2 col-form-label">메뉴명*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_name" name="menu_name"
                                               placeholder="메뉴 이름을 입력하세요" data-valid="required"
                                               value="${menu.menu_name}">
                                        <div class="invalid-feedback">
                                            메뉴 이름을 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_price" class="col-sm-2 col-form-label">메뉴가격*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_price" name="menu_price"
                                               placeholder="메뉴 가격을 입력하세요" data-valid="required"
                                               value="${menu.menu_price}">
                                        <div class="invalid-feedback">
                                            메뉴 가격을 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_desc" class="col-sm-2 col-form-label">메뉴 소개*</label>
                                    <div class="col-sm-10">
                                        <textarea name="menu_desc" id="menu_desc" class="form-control"
                                                  placeholder="메뉴 소개를 입력하세요"
                                                  data-valid="required">${menu.menu_desc}</textarea>
                                        <div class="invalid-feedback">
                                            메뉴 소개를 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <input type="hidden" id="category_name" value="${menu.category_name}">

                                    <label class="col-sm-2 col-form-label">메뉴 카테고리*</label>
                                    <div class="col-sm-10">
                                        <div class="d-flex align-items-center" id="category_target">
                                            <div class="custom-control custom-radio custom-control-inline category_template d-none">
                                                <input type="radio" id="" name="category_id"
                                                       class="custom-control-input">
                                                <label class="custom-control-label" for="">category_name_temp</label>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback" id="categoryCheckFeedback">
                                            카테고리를 선택하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_image" class="col-sm-2 col-form-label">메뉴 이미지*</label>
                                    <div class="col-sm-10">
                                        <div class="custom-file">
                                            <input type="hidden" id="prev_image"
                                                   value="${menu.menu_original_image}">
                                            <input type="hidden" name="image_changed" id="image_changed" value="false">
                                            <input type="file" class="custom-file-input" id="menu_image"
                                                   name="menu_image"
                                                   data-valid="required" accept=".jpg, .jpeg, .png">
                                            <label class="custom-file-label" id="menu_image_name" for="menu_image">
                                                ${menu.menu_original_image}</label>
                                            <div class="invalid-feedback">
                                                메뉴 이미지를 등록하세요
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <img src="/upload${menu.menu_saved_image}" id="menu_preview"
                                                 alt="${menu.menu_original_image}" class="img-fluid float-right">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <input type="hidden" id="menu_status"
                                           value="${menu.menu_status_value}">
                                    <label class="col-sm-2 col-form-label">메뉴 상태*</label>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="menu_status_value"
                                                   id="menu_active" value="active">
                                            <label class="form-check-label" for="menu_active"> 판매중 </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="menu_status_value"
                                                   id="menu_inactive" value="inactive">
                                            <label class="form-check-label" for="menu_inactive"> 판매중지 </label>
                                            <div class="invalid-feedback">메뉴 활성화 상태를 체크하세요</div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <button class="btn btn-success btn-block" id="submitBtn" type="submit">전송</button>
                                <button class="btn btn-info btn-block" id="resetBtn" type="reset">초기화</button>
                            </form>
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