
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Insert Page</title>
        <%@include file="../partial/head.jsp" %>
    
    <script>
        $(document).ready(function() {
        	
            $("#backBtn").on("click", function() {
                history.back();
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
                    <%@include file="owner-nav.jsp"%>
        
            <div class="col-12 col-sm-10">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-2">
                            <button class="btn btn-sm btn-secondary" id="backBtn">뒤로</button>
                        </div>

                        <div class="ml-auto mr-2">
                            <h3 class="text-right">관리자 추가하기</h3>
                        </div>
                        <div class="w-100">
                            <hr>
                        </div>

                        <div class="col-12">
                            <form action="<c:url value="/owner/searchAction"/>" method="post"
                                  id="searchStaffForm">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                             
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
                                <div class="btn-group float-right">
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
                                            <th scope="col">이름</th>
                                            <th scope="col">이메일</th>
                                            <th scope="col">가입일</th>
                                            <th scope="col">등록</th>
                                        </tr>
                                        <tr id="staff_template_tr" class="d-none">

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
    <%@include file="../partial/footer.jsp" %>
</div>
</body>
</html>
