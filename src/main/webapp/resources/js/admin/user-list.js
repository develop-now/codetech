	$('#storeIf_btn').click(function() {
		$.ajax({
			method : "get",
			url : "${pageContext.request.contextPath}/admin/PartnerPend",
			data : { "store_id" : $('#store_id').val() },
			dataType : "json",
			cache : false,
			success : function(jsonData) {
				console.log("보내기 성공")
			},
			error : function() {
	            console.log("admin modal err");
	        }
		})
	});