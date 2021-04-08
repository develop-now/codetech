$(function() {

		$('form').submit(function() {
			if ($('#search').val()=='') {
				alert("검색어를 입력하세요");
				$("#search").val('').focus();
				return false;
			}

		}); //submit
		
		

		
}); //function()