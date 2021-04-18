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
			$('#user_postcode_m').val(data.zonecode);
			$("#user_address_m").val(fullRoadAddr);
			
		}
	}).open();
}
/*modifyModal*/
$(function(){
	var nickpattern = true;
	var telpattern = true;
	var check=0;
	/*패턴 확인*/
	$("#user_name_m").on("keyup", function(){
		console.log("modifyModal uploaded");
		$("#message-nick_m").empty();
		var nick = $("#user_name_m").val();
		var pattern = /^[가-힣]{1,6}$/;
		var space = checkSpace(nick);
		if(space){
			$("#message-nick_m").css("color",'#B63629').html("*공백을 제거해 주세요");
			nickpattern=false;
		}else if(!pattern.test(nick)){
			$("#message-nick_m").css("color",'#B63629').html("*한글로 최대 6글자입력 가능합니다.");
			nickpattern=false;
		}else{
			//user_name 중복체크
			$.ajax({
				url:"../user/nickcheck",
				data:{"user_name_m":nick},
				success:function(isName){
					if(isName  == -1){
						$("#message-nick_m").css("color","#BE9F7B").html("*사용가능한 닉네임입니다.");
						nickpattern = true;
					}else{
						$("#message-nick_m").css("color","#B63629").html("*사용중인  닉네임입니다.다른 닉네임을 입력하세요.");
						nickpattern = false;
						
					}
				},
				error:function(){
					console.log("emailcheck 에러");
				}
				
			}); //user_name ajax end
			
			nickpattern=true;
		}
		if($('#user_name_m').val()==('')){
			$("#message-nick_m").empty();
		}
	}); //USER_NAME keyup end
	
	$("#user_tel_m").on("keyup", function(){
		$("#message-tel_m").empty();
		var tel =$("#user_tel_m").val();
		var pattern =/^[0-9]{9,11}$/g;
		var space = checkSpace(tel);
		if(space){
			$("#message-tel_m").css("color",'#B63629').html("*공백을 제거해 주세요");
			telpattern=false;
		}else if(!pattern.test(tel)){
			$("#message-tel_m").css("color",'#B63629').html("*숫자만 입력 가능하며 번호를 확인하세요.('-'사용X)");
			telpattern=false;
		}else {
			telpattern=true;
		}
		if($('#user_tel_m').val()==('')){
			$("#message-tel_m").empty();
		}
	}); //USER_TEL keyup end
	
	
	/*유효성 검사*/
	$('#modifyModalForm').submit(function(){
		var result = true;
		if(!nickpattern){
			$("#user_name_m").focus();	
			result=false;
		}else if(!telpattern){
			$("#user_tel_m").focus();	
			result=false;
		}
		
		/*빈칸 확인*/
		if($.trim($('#user_name_m').val())==''){
			$("#message-nick_m").css('color', '#B63629').html('*닉네임을 입력하세요');
			$("#user_name_m").val('').focus();
			result=false;
		};
		if($.trim($('#user_tel_m').val())==''){
			$("#message-tel_m").css('color', '#B63629').html('*연락처를 입력하세요');
			$("#user_tel_m").val('').focus();
			result=false;
		};
		if(check==0){
			value=$('#filevalue').text();
			html = "<input type='hidden' value='" + value +"' name='check'>";
			$(this).append(html);
		}
		
		return result;
	});//$('#modifyModalForm').submit end
		
	/*modal close시 값 남기지 않기 추가 수정 필요*/
	$('.modifyModal-header > button').click(function(){
		//input 값 
		/*$("#user_name_m").val("${userPlusInfo.user_name}")
		$("#user_tel_m").val("${userPlusInfo.user_tel}")
		$("#user_postcode_m").val('')
		$("#user_address_m").val('${userPlusInfo.user_address}')
		$(".modifyModal__img-profile").attr("src","/www/resources/upload${userPlusInfo.original_file}")
		*/
		location.href="../user/infoMain";
		$("#message-nick_m").html('')
		$("#message-tel_m").html('')
		$("#message-add_m").html('')
	});
	/*프로필 사진 변경 유효성*/
	$('.modifyModal__img-profile').change(function(event){
		var inputfile = $(this).val().split('\\');
		var filename = inputfile[inputfile.length - 1];
		var pattern = /(gif|jpg|jpeg|png)$/i;
		if(pattern.test(filename)){
			$(".message-profile_m").empty();
			var reader = new FileReader();
			reader.readAsDataURL(event.target.files[0]);
			//변경시 미리보기
			reader.onload = function(event){
				$(".modifyModal__img-profile").attr("src", event.target.result);
			
			}
		}else{
			$(".message-profile_m").css("color","#B63629").html("확장자는 gif, jpg, jpeg, png가 가능합니다.");
			$(this).val('');
		};
	});//$('.modifyModal__img-profile').change end
	
	$("#upfile").change(function(){
		check++;
		
		var inputfile = $(this).val().split('\\');
		console.log("upfile function inputfile"+inputfile);
		$('#filevalue').text(inputfile[inputfile.length-1]);
		console.log("upfile function check"+check);
	});
	
});