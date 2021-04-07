/*joinModal*/
$(function(){
	console.log("Users Js loaded");
	var idpattern = false;
	var nickpattern = false;
	var passpattern = false;
	var passcheckpattern = false;
	var telpattern = false;
	
	/*패턴 확인*/
	$("#USER_ID").on("keyup", function(){
		$("#message-id").empty();
		var pattern = /^[a-zA-Z0-9_-]{3,}@\w{2,}[.]\w{2,}$/;
		var id = $("#USER_ID").val();
		var space = checkSpace(id);
		if(space){
			$("#message-id").css("color",'#B63629').html("*공백을 제거해 주세요");
		}else if(!pattern.test(id)){
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
		$("#message-nick").empty();
		var nick = $("#USER_NAME").val();
		var pattern = /^[가-힣]{1,6}$/;
		var space = checkSpace(nick);
		if(space){
			$("#message-nick").css("color",'#B63629').html("*공백을 제거해 주세요");
			nickpattern=false;
		}else if(!pattern.test(nick)){
			$("#message-nick").css("color",'#B63629').html("*한글로 최대 6글자입력 가능합니다.");
			nickpattern=false;
		}else{
			nickpattern=true;
		}
		if($('#USER_NAME').val()==('')){
			$("#message-nick").empty();
		}
	}); //USER_NAME keyup end
	
	$("#USER_PASSWORD").on("keyup", function(){
		$("#message-pass").empty();
		var pass = $("#USER_PASSWORD").val();
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
		if($('#USER_PASSWORD').val()==('')){
			$("#message-pass").empty();
		}
	}); //USER_PASSWORD keyup end
	$("#USER_PASSWORD_CHECK").on("keyup", function(){
		$("#message-passcheck").empty();
		var passcheck =$("#USER_PASSWORD_CHECK").val();
		var pattern =/[a-zA-Z0-9]{6,30}/g;
		var space = checkSpace(passcheck);
		if(space){
			$("#message-passcheck").css("color",'#B63629').html("*공백을 제거해 주세요");
			passcheckpattern=false;
		}else if(!pattern.test(passcheck)){
			$("#message-passcheck").css("color",'#B63629').html("*영문,숫자를 이용하여 6자 이상 입력해주세요.");
			passcheckpattern=false;
		}else{
			passcheckpattern=true;
		}
		if($('#USER_PASSWORD_CHECK').val()==('')){
			$("#message-passcheck").empty();
		}
	}); //USER_PASSWORD_CHECK keyup end
	$("#USER_TEL").on("keyup", function(){
		$("#message-tel").empty();
		var tel =$("#USER_TEL").val();
		var pattern =/^[0-9]{9,11}$/g;
		var space = checkSpace(tel);
		if(space){
			$("#message-tel").css("color",'#B63629').html("*공백을 제거해 주세요");
			telpattern=false;
		}else if(!pattern.test(tel)){
			$("#message-tel").css("color",'#B63629').html("*숫자만 입력 가능하며 번호를 확인하세요.('-'사용X)");
			telpattern=false;
		}else{
			telpattern=true;
		}
		if($('#USER_TEL').val()==('')){
			$("#message-tel").empty();
		}
	}); //USER_TEL keyup end
	
	
	/*유효성 검사*/
	$('#joinModalForm').submit(function(){
		if(!idpattern){
			$("#USER_ID").focus();
			return false;
		}else if(!nickpattern){
			$("#USER_NAME").focus();	
			return false;
		}else if(!passpattern){
			$("#USER_PASSWORD").focus();	
			return false;
		}else if(!passcheckpattern){
			$("#USER_PASSWORD_CHECK").focus();	
			return false;
		}else if(!telpattern){
			$("#USER_TEL").focus();	
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
			$("#message-add").css('color', '#B63629').html('*주소를 입력하세요');
			$("#USER_POSTCODE").val('').focus();
			return false;
		};
		
		
	});//$('#joinModalForm').submit end
		
	//modal close시 값 남기지 않기
	$('.joinModal-header > button').click(function(){
		//input 값
		$("#USER_ID").val('')
		$("#USER_NAME").val('')
		$("#USER_PASSWORD").val('')
		$("#USER_PASSWORD_CHECK").val('')
		$("#USER_TEL").val('')
		$("#USER_POSTCODE").val('')
		$("#USER_ADDRESS").val('')
		
		//message 
		$("#message-id").html('')
		$("#message-nick").html('')
		$("#message-pass").html('')
		$("#message-passcheck").html('')
		$("#message-tel").html('')
		$("#message-add").html('')
	});
	//프로필 사진 변경 유효성
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
	//공백 확인
	function checkSpace(str){
		if(str.search(/\s/)!= -1){
			return true;
		}else{
			return false;
		}
	}
	//우편Daum.api
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
                $('#USER_POSTCODE').val(data.zonecode);
                $("#USER_ADDRESS").val(fullRoadAddr);
                
            }
        }).open();
    }