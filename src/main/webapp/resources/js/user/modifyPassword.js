/*공백 확인*/
function checkSpace(str){
	if(str.search(/\s/)!= -1){
		return true;
	}else{
		return false;
	}
}

/*pwdModal*/
$(function(){
	console.log("Users Js loaded");
	var passpattern = false;
	var newpasspattern = false;
	var newpasscheckpattern = false;
	
	/*패턴 확인*/
	$("#user_newpassword").on("keyup", function(){
		$("#message-newpass").empty();
		var pass = $("#user_newpassword").val();
		var pattern =/[a-zA-Z0-9]{6,30}/g;
		var space = checkSpace(pass);
		if(space){
			$("#message-newpass").css("color",'#B63629').html("*공백을 제거해 주세요");
			passpattern=false;
		}else if(!pattern.test(pass)){
			$("#message-newpass").css("color",'#B63629').html("*영문,숫자를 이용하여 최소 6자 이상 입력해주세요.");
			newpasspattern=false;
		}else{
			newpasspattern=true;
		}
		if($('#user_newpassword').val()==('')){
			$("#message-newpass").empty();
		}
	}); //USER_PASSWORD keyup end
	$("#user_newpassword_check").on("keyup", function(){
		$("#message-newpasscheck").empty();
		var passcheck =$("#user_newpassword_check").val();
		var pass = $("#user_newpassword").val();
		var pattern =/[a-zA-Z0-9]{6,30}/g;
		var space = checkSpace(passcheck);
		if(space){
			$("#message-newpasscheck").css("color",'#B63629').html("*공백을 제거해 주세요");
			passcheckpattern=false;
		}else if(!pattern.test(passcheck)){
			$("#message-newpasscheck").css("color",'#B63629').html("*영문,숫자를 이용하여 6자 이상 입력해주세요.");
			passcheckpattern=false;
		}else if(pass!=passcheck){
			$("#message-newpasscheck").css("color",'#B63629').html("*새로운 비밀번호와 일치하지 않습니다.");
			passcheckpattern=false;
		}else {
			$("#message-newpasscheck").css("color",'#6b9068ba').html("*새로운 비밀번호와 일치합니다.");
			passcheckpattern=true;
		}
		if($('#user_newpassword_check').val()==('')){
			$("#message-newpasscheck").empty();
		}
	}); //USER_PASSWORD_CHECK keyup end
	
	
	/*유효성 검사*/
	$('#pwdModalForm').submit(function(){
		if(!passpattern){
			$("#user_password").focus();
			return false;
		}else if(!newpasspattern){
			$("#user_newpassword").focus();	
			return false;
		}else if(!newpasscheckpattern){
			$("#user_newpassword_check").focus();	
			return false;
		}
		/*빈칸 확인*/
		if($.trim($('#user_password').val())==''){
			$("#message-pass").css('color', '#B63629').html('*현재비밀번호를 입력하세요');
			$("#user_password").val('').focus();
			return false;
		};
		if($.trim($('#user_newpassword').val())==''){
			$("#message-pass").css('color', '#B63629').html('*새로운비밀번호를 입력하세요');
			$("#user_password").val('').focus();
			return false;
		};
		if($.trim($('#user_newpassword_check').val())==''){
			$("#message-passcheck").css('color', '#B63629').html('*비밀번호 재확인을 입력하세요');
			$("#user_password_check").val('').focus();
			return false;
		};
	});//$('#pwdModalForm').submit end
		
	/*modal close시 값 남기지 않기*/
	$('.pwdModal-header > button').click(function(){
		//input 값
		$("#user_password").val('')
		$("#user_newpassword").val('')
		$("#user_newpassword_check").val('')
		
		//message 
		$("#message-pass").html('')
		$("#message-newpass").html('')
		$("#message-passcheck").html('')
	});
	
});