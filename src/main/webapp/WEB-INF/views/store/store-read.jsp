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
    <title>Store Read Page</title>
    <%@include file="../partial/head.jsp" %>

    <script>
        $(() => {
            const holidayVal = "${store.holiday}"
            let holidayArr = holidayVal.split(",");

            $("input:checkbox[name='holiday']").each((idx, el) => {
                let elVal = $(el).val();

                if (holidayArr.includes(elVal)) {
                    $(el).prop("checked", true)
                }

                $(el).attr("disabled", true)
            })

            $("#backBtn").on("click", () => {
                history.back();
            })

            $("#listBtn").on("click", () => {
                location.href = "/store/store-list"
            })

            $("#updateBtn").on("click", () => {
                location.href = "/store/store-update?store_id=" + "${store.store_id}";
            })
        })
    </script>
</head>
<body>
<div class="container-fluid" id="bodyWrapper">
    <%-- main nav --%>
    <%@include file="../partial/nav.jsp" %>

    <%-- info Modal --%>
    <%@include file="../partial/infoModal.jsp" %>

    <%-- alert Modal --%>
    <%@include file="../partial/alertModal.jsp" %>


    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <%@include file="store-nav.jsp" %>
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-2">
                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>
                        </div>
                        <div class="ml-auto mr-2">
                            <h3 class="text-right">가게 상세정보</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>
                        <div class="col-12">
                            <form>
                                <div class="form-group row">
                                    <label for="store_name" class="col-sm-2 col-form-label">상호명*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="store_name"
                                               value="${store.store_name}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="store_tel" class="col-sm-2 col-form-label">전화번호*</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="store_tel"
                                               value="${store.store_tel}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">가게 주소*</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-4">
                                                <label class="sr-only" for="store_address_si">시</label>
                                                <input type="text" class="form-control" id="store_address_si"
                                                       value="${store.store_address_si}" readonly>
                                            </div>
                                            <div class="col-4">
                                                <label class="sr-only" for="store_address_gu">구</label>
                                                <input type="text" class="form-control" id="store_address_gu"
                                                       value="${store.store_address_gu}" readonly>
                                            </div>
                                            <div class="col-4">
                                                <label class="sr-only" for="store_address_dong">동</label>
                                                <input type="text" class="form-control" id="store_address_dong"
                                                       value="${store.store_address_dong}" readonly>
                                            </div>
                                            <div class="col-12 mt-2">
                                                <label class="sr-only" for="store_address_etc">기타주소</label>
                                                <input type="text" class="form-control" id="store_address_etc"
                                                       value="${store.store_address_etc}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="store_desc" class="col-sm-2 col-form-label">가게 소개*</label>
                                    <div class="col-sm-10">
                                        <textarea id="store_desc" class="form-control"
                                                  readonly>${store.store_desc}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="store_rnum" class="col-sm-2 col-form-label">가게 사업자번호*</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="store_rnum" class="form-control"
                                               value="${store.store_rnum}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">가게 이미지*</label>
                                    <div class="col-sm-10">
                                        <img src="/resources/upload${store.store_saved_image}" id="store_preview"
                                             alt="${store.store_original_image}" class="img-fluid">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">쉬는날*</label>
                                    <input type="hidden" id="holiday" value="${store.holiday}">
                                    <div class="col-sm-10">
                                        <div class="custom-control custom-checkbox custom-control-inline">
                                            <input type="checkbox" id="noneHoliday" name="holiday"
                                                   class="custom-control-input" value="none">
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
                                                       value="${store.opening_h_w_open}" readonly>
                                            </div>

                                            <div class="col-6">
                                                <label class="sr-only" for="opening_h_w_close">영업종료</label>
                                                <input type="text" class="form-control" id="opening_h_w_close"
                                                       value="${store.opening_h_w_close}" readonly>
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
                                                       value="${store.opening_h_h_open}" readonly>
                                            </div>
                                            <div class="col-6">
                                                <label class="sr-only" for="opening_h_h_close">영업종료</label>
                                                <input type="text" class="form-control" id="opening_h_h_close"
                                                       value="${store.opening_h_h_close}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group float-right">
                                    <c:if test="${store.store_status_value eq 'active'}">
                                        <button class="btn btn-info" id="updateBtn" type="button">수정</button>
                                    </c:if>
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