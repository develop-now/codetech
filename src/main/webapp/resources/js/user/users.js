/*joinModal*/
$(function(){
	console.log("Users Js loaded");
	var idpattern = false;
	
	/*패턴 확인*/
	$("#USER_ID").on("keyup", function(){
		$("#message-id").empty();
		var pattern = /^\w{3,}@\w{2,}[.]\w{2,}$/;
		var id = $("#USER_ID").val();
		if(!pattern.test(id)){
			$("#message-id").css('color', '#B63629').html('*수신 가능한 이메일을 입력하세요.');
			idpattern=false;
		}else{
			idpattern=true;
		}
		if($('#USER_ID').val()==('')){
			$("#message-id").empty();
		}
	}); //USER_ID keyup end
	$("#USER_NAME").on("keyup", function(){
		
		
	}); //USER_NAME keyup end
	
	$("#USER_PASSWORD").on("keyup", function(){
		
	}); //USER_PASSWORD keyup end
	$("#USER_PASSWORD_CHECK").on("keyup", function(){
		
	}); //USER_PASSWORD_CHECK keyup end
	$("#USER_TEL").on("keyup", function(){
		
	}); //USER_TEL keyup end
	
	
	/*유효성 검사*/
	$('#joinModalForm').submit(function(){
		if(!idpattern){
			$("#USER_ID").focus();
			return false;
		}
		
		
		/*빈칸 확인*/
		if($.trim($('#USER_ID').val())==''){
			$("#message-id").css('color', '#B63629').html('*아이디를 입력하세요');
			$("#USER_ID").val('').focus();
			return false;
		};
		if($.trim($('#USER_NAME').val())==''){
			$("#message-nick").css('color', '#B63629').html('*닉네임을 입력하세요');
			$("#USER_NAME").val('').focus();
			return false;
		};
		if($.trim($('#USER_PASSWORD').val())==''){
			$("#message-pass").css('color', '#B63629').html('*비밀번호를 입력하세요');
			$("#USER_PASSWORD").val('').focus();
			return false;
		};
		if($.trim($('#USER_PASSWORD_CHECK').val())==''){
			$("#message-passcheck").css('color', '#B63629').html('*비밀번호 재확인을 입력하세요');
			$("#USER_PASSWORD_CHECK").val('').focus();
			return false;
		};
		if($.trim($('#USER_TEL').val())==''){
			$("#message-tel").css('color', '#B63629').html('*연락처를 입력하세요');
			$("#USER_TEL").val('').focus();
			return false;
		};
		if($.trim($('#USER_POSTCODE').val())==''){
			$("#message-id").css('color', '#B63629').html('*주소를 입력하세요');
			$("#USER_POSTCODE").val('').focus();
			return false;
		};
		
		
	});//$('#joinModalForm').submit end
		
	
});