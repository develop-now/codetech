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
    <title>Store Create Page</title>
    <%@include file="../../partial/head.jsp" %>
    <%@include file="../../partial/dateTimePicker.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/store/store-create.js"></script>

    <script>
        $(() => {
            $('#backBtn').on('click', () => {
                history.back();
            })
        })
    </script>
</head>
<c:set var="idValue" value="${user_id}" scope="session"/>
<body>
<div class="container-fluid" id="bodyWrapper">
    <%-- main nav --%>
    <%@include file="../../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <%@include file="../store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-2">
                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>
                        </div>
                        <div class="ml-auto mr-2">
                            <h3 class="text-right">가게 만들기</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>
                        <div class="col-12">
                            <h4 class="mb-3">가게 기본 정보</h4>
                            <form action="<c:url value="/store/createAction"/>" method="post"
                                  enctype="multipart/form-data" id="createStoreForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <input type="hidden" name="owner_id" value="${idValue}">

                                <div class="form-group row">
                                    <label for="store_name" class="col-sm-2 col-form-label">상호명*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="store_name" name="store_name"
                                               placeholder="상호명을 입력하세요" data-valid="required">
                                        <div class="invalid-feedback">
                                            상호명을 입력하세요
                                        </div>
                                        <div class="valid-feedback">
                                            상호명을 사용할 수 있습니다.
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="store_tel" class="col-sm-2 col-form-label">전화번호*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="store_tel" name="store_tel"
                                               placeholder="전화번호를 입력하세요" data-valid="required">
                                        <div class="invalid-feedback">
                                            전화번호를 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">가게 주소*</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-4">
                                                <label class="sr-only" for="store_address_si">시</label>
                                                <input type="text" class="form-control" id="store_address_si"
                                                       name="store_address_si"
                                                       placeholder="시*" data-valid="required">
                                                <div class="invalid-feedback">
                                                    주소명 '시' 를 입력하세요
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <label class="sr-only" for="store_address_gu">구</label>
                                                <input type="text" class="form-control" id="store_address_gu"
                                                       name="store_address_gu"
                                                       placeholder="구">
                                            </div>
                                            <div class="col-4">
                                                <label class="sr-only" for="store_address_dong">동</label>
                                                <input type="text" class="form-control" id="store_address_dong"
                                                       name="store_address_dong"
                                                       placeholder="동*" data-valid="required">
                                                <div class="invalid-feedback">
                                                    주소명 '동' 를 입력하세요
                                                </div>
                                            </div>
                                            <div class="col-12 mt-2">
                                                <label class="sr-only" for="store_address_etc">기타주소</label>
                                                <input type="text" class="form-control" id="store_address_etc"
                                                       name="store_address_etc"
                                                       placeholder="기타주소를 입력하세요">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="store_desc" class="col-sm-2 col-form-label">가게 소개*</label>
                                    <div class="col-sm-10">
                                        <textarea name="store_desc" id="store_desc" class="form-control"
                                                  placeholder="가게소개를 입력하세요" data-valid="required"></textarea>
                                        <div class="invalid-feedback">
                                            가게소개를 입력하세요
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="store_rnum" class="col-sm-2 col-form-label">가게 사업자번호*</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="store_rnum" id="store_rnum" class="form-control"
                                               placeholder="사업자번호를 입력하세요" data-valid="required">
                                        <div class="invalid-feedback">
                                            사업자번호를 입력하세요
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="store_image" class="col-sm-2 col-form-label">가게 이미지*</label>
                                    <div class="col-sm-10">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="store_image"
                                                   name="store_image"
                                                   data-valid="required" accept=".jpg, .jpeg, .png">
                                            <label class="custom-file-label" id="store_image_name" for="store_image">가게
                                                대표 이미지를 등록하세요</label>
                                            <div class="invalid-feedback">
                                                가게 대표 이미지를 등록하세요
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <img src="#" id="store_preview" alt="" class="img-fluid float-right">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">쉬는날*</label>
                                    <div class="col-sm-10">
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="noneHoliday" name="holiday"
                                                   class="custom-control-input" value="none" checked>
                                            <label class="custom-control-label" for="noneHoliday">없음</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="monday" name="holiday"
                                                   class="custom-control-input" value="monday">
                                            <label class="custom-control-label" for="monday">월요일</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="tuesday" name="holiday"
                                                   class="custom-control-input" value="tuesday">
                                            <label class="custom-control-label" for="tuesday">화요일</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="wednesday" name="holiday"
                                                   class="custom-control-input" value="wednesday">
                                            <label class="custom-control-label" for="wednesday">수요일</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="thursday" name="holiday"
                                                   class="custom-control-input" value="thursday">
                                            <label class="custom-control-label" for="thursday">목요일</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="friday" name="holiday"
                                                   class="custom-control-input" value="friday">
                                            <label class="custom-control-label" for="friday">금요일</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="saturday" name="holiday"
                                                   class="custom-control-input" value="saturday">
                                            <label class="custom-control-label" for="saturday">토요일</label>
                                        </div>
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="sunday" name="holiday"
                                                   class="custom-control-input" value="sunday">
                                            <label class="custom-control-label" for="sunday">일요일</label>
                                        </div>
                                        <div class="invalid-feedback" id="holidayCheckFeedback">
                                            쉬는날을 선택하세요
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">평일 영업시간*</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-6">
                                                <label class="sr-only" for="opening_h_w_open">영업시작</label>
                                                <input type="text" class="form-control" id="opening_h_w_open"
                                                       placeholder="평일 영업 시작 시간" data-valid="required">
                                                <input type="hidden" name="opening_h_w_open">
                                                <div class="invalid-feedback">
                                                    평일 영업 시작 시간을 입력하세요
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <label class="sr-only" for="opening_h_w_close">영업종료</label>
                                                <input type="text" class="form-control" id="opening_h_w_close"
                                                       placeholder="평일 영업 종료 시간" data-valid="required">
                                                <input type="hidden" name="opening_h_w_close">
                                                <div class="invalid-feedback">
                                                    평일 영업 종료 시간을 입력하세요
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row" id="holiday_open_time_selector">
                                    <label class="col-sm-2 col-form-label">주말 영업시간*</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-6">
                                                <label class="sr-only" for="opening_h_h_open">영업시작</label>
                                                <input type="text" class="form-control" id="opening_h_h_open"
                                                       placeholder="휴일 영업 시작 시간" data-valid="required">
                                                <input type="hidden" name="opening_h_h_open">
                                                <div class="invalid-feedback">
                                                    주말 영업 시작 시간을 입력하세요
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <label class="sr-only" for="opening_h_h_close">영업종료</label>
                                                <input type="text" class="form-control" id="opening_h_h_close"
                                                       placeholder="휴일 영업 종료 시간" data-valid="required">
                                                <input type="hidden" name="opening_h_h_close">
                                                <div class="invalid-feedback">
                                                    주말 영업 종료 시간을 입력하세요
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <h4 class="mb-3">대표메뉴</h4>
                                <div class="form-group row">
                                    <label for="menu_name" class="col-sm-2 col-form-label">메뉴명*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_name" name="menu_name"
                                               placeholder="메뉴 이름을 입력하세요" data-valid="required">
                                        <div class="invalid-feedback">
                                            메뉴 이름을 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_price" class="col-sm-2 col-form-label">메뉴가격*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="menu_price" name="menu_price"
                                               placeholder="메뉴 가격을 입력하세요" data-valid="required">
                                        <div class="invalid-feedback">
                                            메뉴 가격을 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="menu_desc" class="col-sm-2 col-form-label">메뉴 소개*</label>
                                    <div class="col-sm-10">
                                        <textarea name="menu_desc" id="menu_desc" class="form-control"
                                                  placeholder="메뉴 소개를 입력하세요" data-valid="required"></textarea>
                                        <div class="invalid-feedback">
                                            메뉴 소개를 입력하세요
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
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
                                            <input type="file" class="custom-file-input" id="menu_image"
                                                   name="menu_image"
                                                   data-valid="required" accept=".jpg, .jpeg, .png">
                                            <label class="custom-file-label" id="menu_image_name" for="menu_image">메뉴
                                                이미지를 등록하세요</label>
                                            <div class="invalid-feedback">
                                                메뉴 이미지를 등록하세요
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <img src="#" id="menu_preview" alt="" class="img-fluid float-right">
                                        </div>
                                    </div>
                                </div>
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