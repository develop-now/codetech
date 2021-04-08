$(document).ready(function() {
	// submit 버튼 클릭할 때 이벤트 부분
	$("form").submit(function() {
		if ($.trim($("input").eq(0).val()) == "") {
			alert("공지사항 제목을 입력하세요.")
			$("input:eq(0)").focus();
			return false;
		}
		
		if ($.trim($("textarea").val()) == "") {
			alert("공지사항 내용을 입력하세요.");
			$("textarea").focus();
			return false;
		}
	}); // submit end
});// ready() end