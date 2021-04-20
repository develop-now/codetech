$(document).ready(function() {
	
	var url = $('#ab').val() + "/owner/searchUser"

	/*$.ajax({
		url:url,
		success:function(rdata){
			var te = rdata.split(',')
				$('.vd').append(te)
				
		},
		error:function(){
			console.log("emailcheck 에러");
		}
		
	}); */
	
	/* reportModal */

	/* modal close시 값 남기지 않기 */
	$(document).on("click", ".close", function() {
		// input 값
		$("#reported").val('')
		$("#rp_content").val('')

	});
	
	
	//정적 데이터
	var name = [
		"cafe1", "cafe2", "cafe3","cafe4", "cafe4",
		"cafe5", "cafe6", "cafe7", "cafe8", "cafe9",
		"cafe10", "cafe10", "cafe11", "cafe12", "cafe13",
		"user1", "user2", "user3", "user4", "user5",
		"user6", "user7"
	];
	
	$("#reported").autocomplete({
		source: name
	});

	// modal이 열릴 때 다시 영역 한정 (appendTo 옵션) 
	$("#reportModal").on("shown.bs.modal", function() { 
		$("#reported").autocomplete("option", "appendTo", "#reportModal") })
		
});
