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
    <title>Menu Read Page</title>
    <%@include file="../partial/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/menu-create.js"></script>
    <script>
        $(() => {
            $("#backBtn").on("click", () => {
                history.back();
            })

            // TODO:: FIX HARDCODING OWNER ID VALUE
            $("#listBtn").on("click", () => {
                location.href = "/menu/menu-list-by-owner?owner_id=3"
            })

            $("#updateBtn").on("click", () => {
                location.href = "/menu/menu-update?menu_id=" + "${menu.menu_id}";
            })
        })
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
    <div class="container-fluid" id="bodyWrapper">
        <div class="row">
            <%@include file="store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-2">
                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>
                        </div>

                        <div class="ml-auto mr-2">
                            <h3 class="text-right">메뉴 상세보기</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <form>
                                <%-- TODO:: FIX HARDCODING VALUE--%>
                                <input type="hidden" name="owner_id" value="3" id="owner_id">
                                <%--<input type="hidden" name="owner_id" value="${idValue}">--%>

                                <input type="hidden" name="menu_id" value="${menu.menu_id}">

                                <div class="form-group row">
                                    <label for="store_name" class="col-sm-2 col-form-label">가게이름*</label>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="store_id" value="${menu.store_id}">
                                        <input type="text" class="form-control" id="store_name" name="store_name"
                                               value="${menu.store_name}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_name" class="col-sm-2 col-form-label">메뉴명*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_name" name="menu_name"
                                               value="${menu.menu_name}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_price" class="col-sm-2 col-form-label">메뉴가격*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_price" name="menu_price"
                                               value="${menu.menu_price}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_desc" class="col-sm-2 col-form-label">메뉴 소개*</label>
                                    <div class="col-sm-10">
                                        <textarea name="menu_desc" id="menu_desc"
                                                  class="form-control" readonly>${menu.menu_desc}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_category" class="col-sm-2 col-form-label">카테고리*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_category" name="menu_category"
                                               value="${menu.category_name}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">메뉴 이미지*</label>
                                    <div class="col-sm-10">
                                        <img src="/resources/upload/${menu.menu_saved_image}" id="menu_preview"
                                             alt="${menu.menu_original_image}" class="img-fluid">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_status" class="col-sm-2 col-form-label">메뉴 상태*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_status" name="menu_category"
                                               value="${menu.menu_status_value}" readonly>
                                    </div>
                                </div>

                                <div class="btn-group float-right">
                                    <button class="btn btn-info" id="updateBtn" type="button">수정</button>
                                    <button class="btn btn-secondary" id="listBtn" type="button">목록</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->

    <%-- footer --%>
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>