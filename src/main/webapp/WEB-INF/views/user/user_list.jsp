<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../etc/header.jsp"/>
<style>
table caption{caption-side:top; text-align:center }
h1{text-align:center}
li .current{
   background:#faf7f7; color:gray;
}

body > div > table > tbody > tr > td:last-child > a{color:red}

form{margin:0 auto; width:80%; text-align:center}

select {
   color: #495057;
   background-color: #fff;
   background-clip: padding-box;
   border: 1px solid #ced4da;
   border-radius: .25rem;
   transition: border-color .15s ease-in-out, box-shadow .15e ease-in-out;
   outline:none;
}
.container{width:60%}
td:nth-child(1){width:33%}
.input-group{margin-bottom:3em}

.gray{color:gray}
body>div>table>thead>tr:nth-child(2)>th:nth-child(1){width:8%}
body>div>table>thead>tr:nth-child(2)>th:nth-child(2){width:50%}
body>div>table>thead>tr:nth-child(2)>th:nth-child(3){width:14%}
body>div>table>thead>tr:nth-child(2)>th:nth-child(4){width:17%}
body>div>table>thead>tr:nth-child(2)>th:nth-child(5){width:11%}
</style>
<script>
   $(function() {
      // 검색 클릭 후 응답 화면에는 검색시 선택한 필드가 선택되도록 합니다.
      var selectedValue = '${search_field}'
      if (selectedValue != '')
         $("#viewcount").val(selectedValue);

      // 검색 버튼 클릭한 경우
      $("button").click(function() {
		 var word = $(".input-group input").val();
		 if (word == '') {
			 alert("검색어를 입력하세요.");
			 return false;
		 }
         
		 selectedValue = $("#viewcount").val();
         if (selectedValue =="A") {
            pattern = /^[0-9]{2}$/;
            if (!pattern.test(word)) {
               alert("나이는 형식에 맞게 입력하세요(두자리 숫자)");
               return false;
            }
         } else if (selectedValue == "G") {
            if (word != "남" && word != "여") {
               alert("남 또는 여를 입력하세요");
               $('intput').val('');
               return false;
            }
         }
      }); //button click end
      
      //검색어 입력창에 placeholder가 나타나도록 합니다.
      $("#viewcount").change(function() {
         var value = $("select option:selected").text();
         $("input").val('');
         $("input").attr("placeholder", value + " 입력하세요");
      }) //$("#viecount").change end

      //회원 목록의 삭제를 클릭한 경우
      $("tr > td:nth-child(3) > a").click(function(event) {
         var answer = confirm("정말 삭제하시겠습니까?");
         console.log(answer); //취소를 클릭한 경우 - false
         if (!answer) { //취소를 클릭한 경우
            event.preventDefault(); //이동하지 않습니다.
         }
      }) //삭제클릭 end
   })
</script>
 
<title>회원목록</title>
</head>
<body>
   <div class="container">
      <form action="userList">
         <div class="input-group">
            <select id="viewcount" name="search_field">
               <option value="0" selected>이메일</option>
               <option value="1">이름</option>
               <option value="2">전화번호</option>
            </select>   
            <input name="search_word" type="text" class="form-control" placeholder="아이디 입력하세요"
            	   value="${search_word}">
            	   
           	<label><input type="checkbox" name="check_state" value="0" checked>회원 활동</label>
			<label><input type="checkbox" name="check_state" value="1">회원 탈퇴</label>
			<label><input type="checkbox" name="check_state" value="2">활동 정지</label>
			<label><input type="checkbox" name="check_state" value="3">회원 추방</label>
            <button class="btn btn-primary" type="submit">검색</button>
         </div>
      </form>

      <%-- 회원이 있는 경우 --%>
      <c:if test="${listcount > 0}">
         <table class="table table-striped">
            <caption style="font-weight: bold">회원 목록</caption>
            <thead>
               <tr>
                  <th colspan="2">MVC 게시판 - 회원 정보 list</th>
                  <th><font size=3>회원 수 : ${listcount}</font></th>
               </tr>

               <tr>
                  <th><div>아이디</div></th>
                  <th><div>이름</div></th>
                  <th><div>삭제</div></th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="m" items="${memberlist}">
                  <tr>
                     <td><a href="Info?id=${m.id}">${m.id}</a></td>
                     <td>${m.name}</td>
                     <td><a href="Delete?id=${m.id}">삭제</a></td>
                  </tr>
               </c:forEach>

            </tbody>
         </table>

         <div>
            <ul class="pagination justify-content-center">
               <c:if test="${page <= 1}">
                  <li class="page-item"><a class="page-link current" href="#">이전&nbsp;</a>
                  </li>
               </c:if>

               <c:if test="${page > 1}">
                  <li class="page-item"><a
                     href="memberList?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
                     class="page-link">이전</a> &nbsp;</li>
               </c:if>


               <c:forEach var="a" begin="${startpage}" end="${endpage }">
                  <c:if test="${a == page }">
                     <li class="page-item"><a class="page-link current" href="#">${a}</a>
                     </li>
                  </c:if>

                  <c:if test="${a != page }">
                     <li class="page-item"><a
                        href="memberList?page=${a}&search_field=${search_field}&search_word=${search_word}"
                        class="page-link">${a}</a></li>
                  </c:if>
               </c:forEach>


               <c:if test="${page >= maxpage }">
                  <li class="page-item"><a class="page-link current" href="#">&nbsp;다음</a>
                  </li>
               </c:if>

               <c:if test="${page < maxpage }">
                  <li class="page-item"><a
                     href="memberList?page=${page+1}&search_field=${search_field}&search_word=${search_word}"
                     class="page-link">&nbsp;다음</a></li>
               </c:if>
            </ul>
         </div>
      </c:if>
      <%-- <c:if test="${listcount > 0}"> end --%>
   </div>

   <%-- 회원이 없는 경우 --%>
   <c:if test="${listcount == 0 && empty search_word}">
      <h1>회원이 없습니다.</h1>
   </c:if>
   
      <c:if test="${listcount == 0 && !empty search_word}">
      <h1>검색 결과가 없습니다..</h1>
   </c:if>
</body>
</html>