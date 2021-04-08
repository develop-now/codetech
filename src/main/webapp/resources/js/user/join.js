/*공백 확인*/
function checkSpace(str){
	if(str.search(/\s/)!= -1){
		return true;
	}else{
		return false;
	}
}
/*우편Daum.api*/
function DaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			
			var fullRoadAddr = data.roadAddress; 
			var extraRoadAddr = '';
			
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			$('#user_postcode').val(data.zonecode);
			$("#user_address").val(fullRoadAddr);
			
		}
	}).open();
}
/*joinModal*/
$(function(){
	console.log("Users Js loaded");
	var idpattern = false;
	var nickpattern = false;
	var passpattern = false;
	var passcheckpattern = false;
	var telpattern = false;
	
	/*패턴 확인*/
	$("#user_email").on("keyup", function(){
		$("#message-id").empty();
		var pattern = /^[a-zA-Z0-9_-]{3,}@\w{2,}[.]\w{2,}$/;
		var id = $("#user_email").val();
		var space = checkSpace(id);
		idpattern = true; //질문 왜 true로 해줘야 하지?
		if(space){
			$("#message-id").css("color",'#B63629').html("*공백을 제거해 주세요");
		}else if(!pattern.test(id)){
			$("#message-id").css('color', '#B63629').html('*수신 가능한 이메일을 입력하세요.');
			idpattern=false;
		}else{
			//user_email 중복체크
			$.ajax({
				url:"user/emailcheck",
				data:{"user_email":id},
				success:function(isEmail){
					if(isEmail  == -1){
						$("#message-id").css("color","#BE9F7B").html("*사용가능한 이메일입니다.");
						idpattern = true;
					}else{
						$("#message-id").css("color","#B63629").html("*사용중인  이메일입니다.다른 이메일을 입력하세요.");
						idpattern = false;
						
					}
				},
				error:function(){
					console.log("emailcheck 에러");
				}
				
			}); //user_email ajax end
			idpattern=true;
		}
		if($('#user_email').val()==('')){
			$("#message-id").empty();
		}
		
	}); //USER_ID keyup end
	$("#user_name").on("keyup", function(){
		$("#message-nick").empty();
		var nick = $("#user_name").val();
		var pattern = /^[가-힣]{1,6}$/;
		var space = checkSpace(nick);
		if(space){
			$("#message-nick").css("color",'#B63629').html("*공백을 제거해 주세요");
			nickpattern=false;
		}else if(!pattern.test(nick)){
			$("#message-nick").css("color",'#B63629').html("*한글로 최대 6글자입력 가능합니다.");
			nickpattern=false;
		}else{
			//user_name 중복체크
			$.ajax({
				url:"user/nickcheck",
				data:{"user_name":nick},
				success:function(isName){
					if(isName  == -1){
						$("#message-nick").css("color","#BE9F7B").html("*사용가능한 닉네임입니다.");
						nickpattern = true;
					}else{
						$("#message-nick").css("color","#B63629").html("*사용중인  닉네임입니다.다른 닉네임을 입력하세요.");
						nickpattern = false;
						
					}
				},
				error:function(){
					console.log("emailcheck 에러");
				}
				
			}); //user_name ajax end
			
			nickpattern=true;
		}
		if($('#user_name').val()==('')){
			$("#message-nick").empty();
		}
	}); //USER_NAME keyup end
	
	$("#user_password").on("keyup", function(){
		$("#message-pass").empty();
		var pass = $("#user_password").val();
		var pattern =/[a-zA-Z0-9]{6,30}/g;
		var space = checkSpace(pass);
		if(space){
			$("#message-pass").css("color",'#B63629').html("*공백을 제거해 주세요");
			passpattern=false;
		}else if(!pattern.test(pass)){
			$("#message-pass").css("color",'#B63629').html("*영문,숫자를 이용하여 최소 6자 이상 입력해주세요.");
			passpattern=false;
		}else{
			passpattern=true;
		}
		if($('#user_password').val()==('')){
			$("#message-pass").empty();
		}
	}); //USER_PASSWORD keyup end
	$("#user_password_check").on("keyup", function(){
		$("#message-passcheck").empty();
		var passcheck =$("#user_password_check").val();
		var pass = $("#user_password").val();
		var pattern =/[a-zA-Z0-9]{6,30}/g;
		var space = checkSpace(passcheck);
		if(space){
			$("#message-passcheck").css("color",'#B63629').html("*공백을 제거해 주세요");
			passcheckpattern=false;
		}else if(!pattern.test(passcheck)){
			$("#message-passcheck").css("color",'#B63629').html("*영문,숫자를 이용하여 6자 이상 입력해주세요.");
			passcheckpattern=false;
		}else if(pass!=passcheck){
			$("#message-passcheck").css("color",'#B63629').html("*위의 비밀번호와 일치하지 않습니다.");
			passcheckpattern=false;
		}else {
			$("#message-passcheck").css("color",'#BE9F7B').html("*위의 비밀번호와 일치합니다.");
			passcheckpattern=true;
		}
		if($('#user_password_check').val()==('')){
			$("#message-passcheck").empty();
		}
	}); //USER_PASSWORD_CHECK keyup end
	$("#user_tel").on("keyup", function(){
		$("#message-tel").empty();
		var tel =$("#user_tel").val();
		var pattern =/^[0-9]{9,11}$/g;
		var space = checkSpace(tel);
		if(space){
			$("#message-tel").css("color",'#B63629').html("*공백을 제거해 주세요");
			telpattern=false;
		}else if(!pattern.test(tel)){
			$("#message-tel").css("color",'#B63629').html("*숫자만 입력 가능하며 번호를 확인하세요.('-'사용X)");
			telpattern=false;
		}else {
			telpattern=true;
		}
		if($('#user_tel').val()==('')){
			$("#message-tel").empty();
		}
	}); //USER_TEL keyup end
	
	
	/*유효성 검사*/
	$('#joinModalForm').submit(function(){
		if(!idpattern){
			$("#user_email").focus();
			return false;
		}else if(!nickpattern){
			$("#user_name").focus();	
			return false;
		}else if(!passpattern){
			$("#user_password").focus();	
			return false;
		}else if(!passcheckpattern){
			$("#user_password_check").focus();	
			return false;
		}else if(!telpattern){
			$("#user_tel").focus();	
			return false;
		}
		
		/*빈칸 확인*/
		if($.trim($('#user_email').val())==''){
			$("#message-id").css('color', '#B63629').html('*아이디를 입력하세요');
			$("#user_email").val('').focus();
			return false;
		};
		if($.trim($('#user_name').val())==''){
			$("#message-nick").css('color', '#B63629').html('*닉네임을 입력하세요');
			$("#user_name").val('').focus();
			return false;
		};
		if($.trim($('#user_password').val())==''){
			$("#message-pass").css('color', '#B63629').html('*비밀번호를 입력하세요');
			$("#user_password").val('').focus();
			return false;
		};
		if($.trim($('#user_password_check').val())==''){
			$("#message-passcheck").css('color', '#B63629').html('*비밀번호 재확인을 입력하세요');
			$("#user_password_check").val('').focus();
			return false;
		};
		if($.trim($('#user_tel').val())==''){
			$("#message-tel").css('color', '#B63629').html('*연락처를 입력하세요');
			$("#user_tel").val('').focus();
			return false;
		};
		if($.trim($('#user_postcode').val())==''){
			$("#message-add").css('color', '#B63629').html('*주소를 입력하세요');
			$("#user_postcode").val('').focus();
			return false;
		};
		
		
	});//$('#joinModalForm').submit end
		
	/*modal close시 값 남기지 않기*/
	$('.joinModal-header > button').click(function(){
		//input 값
		$("#user_email").val('')
		$("#user_name").val('')
		$("#user_password").val('')
		$("#user_password_check").val('')
		$("#user_tel").val('')
		$("#user_postcode").val('')
		$("#user_address").val('')
		$(".loginModal__img-profile").attr("src","/www/resources/image/default.png")
		
		//message 
		$("#message-id").html('')
		$("#message-nick").html('')
		$("#message-pass").html('')
		$("#message-passcheck").html('')
		$("#message-tel").html('')
		$("#message-add").html('')
	});
	/*프로필 사진 변경 유효성*/
	$('.loginModal__img-profile').change(function(event){
		var inputfile = $(this).val().split('\\');
		var filename = inputfile[inputfile.length - 1];
		var pattern = /(gif|jpg|jpeg|png)$/i;
		if(pattern.test(filename)){
			$(".message-profile").empty();
			var reader = new FileReader();
			reader.readAsDataURL(event.target.files[0]);
			//변경시 미리보기
			reader.onload = function(event){
				$(".loginModal__img-profile").attr("src", event.target.result);
			
			}
		}else{
			$(".message-profile").css("color","#B63629").html("확장자는 gif, jpg, jpeg, png가 가능합니다.");
			$(this).val('');
		};
	});//$('.loginModal__img-profile').change end
			
	
});