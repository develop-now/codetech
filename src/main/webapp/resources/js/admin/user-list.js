	$(function() {
		// 검색 클릭 후 응답 화면에는 검색시 선택한 필드가 선택되도록 한다.	
		/* 선택된 필드 값 저장 */
		var selectedValue = '${search_field}'
		
		/* 선택된 필드 값이 있으면 select class="viewcount"를 가진
		   option value 값을 유지 */
		if (selectedValue != '-1')
			$(".viewcount").val(selectedValue);
		
		$("check_state").click(function() {
			checkedValue = $(this).val();
			$(this).checked(true);
		})
		
		// 선택한 옵션 값을 placeholder에 표시
		$(".viewcount").change(function() {
			selectedValue = $(this).val();
			
			$("input").val('');
			
			message=["이메일을", "이름을", "전화번호를"]
			$("input").attr("placeholder", message[selectedValue] + " 입력하세요.");
		})
		
		$(".UserSusp").click(function(event) {
			var answer = confirm("회원 정지를 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".UserReAc").click(function(event) {
			var answer = confirm("정지 해제를 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".UserBanned").click(function(event) {
			var answer = confirm("회원을 추방 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
		
		$(".UserInac").click(function(event) {
			var answer = confirm("회원 탈퇴를 취소 하시겠습니까?");
			
			if (!answer) {
				event.preventDefault();
			}
		});
	});
	
	var result = "${ result }";
	
	if (result == 'suspSuccess') {
		alert("선택한 아이디 회원을 정지 겅공.");	
	} else if (result == 'suspFail') {
		alert("선택한 아이디 회원 정지 실패.");
	}
	
	if (result == 'reacSuccess') {
		alert("선택한 아이디 정지 해제 완료");
	} else if (result == 'reacFail') {
		alert("선택한 아이디 정지 해제 실패");
	}
	
	if (result == 'bannedSuccess') {
		alert("선택한 아이디 강제 추방 완료");
	} else if (result == 'bannedFail') {
		alert("선택한 아이디 탈퇴 취소 완료");
	}
	
	if (result == 'inacSuccess') {
		alert ("선택한 아이디 탈퇴 취소 성공");
	} else if (result == 'inacFail') {
		alert ("선택한 아이디 탈퇴 취소 실패");
	}