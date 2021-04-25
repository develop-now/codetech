$(function(){
	$(".mypageReview-content").hide();
	var page = 1;
	count = $("#listCount").val();
	if(count != 0){
		getUserCommentList(page);
	}

//controller에서 꺼내온 리뷰갯수가 없다면 "noreview"를 보내와서 화면을 띄어준다.
//ajax를 사용하여jsp화면을 만들어준다.
//처음에 가져올 갯수를 설정하고 그 이상일 경우 더보기를 클릭하여 1-*()클린한 수 만큼 보여준다
function getUserCommentList(currentPage){
	console.log(currentPage);
	$.ajax({
		type:"get",
		url:"../comment/user/comment-list-by-user-ajax",
		data:{"page":currentPage},
		dataType:"json",
		success:function(data){
			console.log(data.listCount)
			console.log(data.list.length)
			if(data.listCount > 0){
				$(".mypageReview-content").show();
				$(".mypageReview-content").empty();
				//가지고온 data의 객체들을 하나씩 반복해서 보여준다.
				$(data.list).each(function(){
					console.log("each 실행")
					
					output="";
					output +="<div class='mypageReview__body d-inline-flex'>"
						+"<div class='mypageReview__content-left'>" 
						+	"<div><span>" 
						if(this.like_id==null){
				 output +=  "<img src='../resources/image/common/unlike.png' alt='storeUnlike' width='30px'>"
							
						}else{
				 output +=  "<img src='../resources/image/common/like.png' alt='storeLike' width='30px'>"
						}
				 output	+=		"</span><span>"+this.comment_store_value+"</span></div>"
	              		+		"<div class='text-center'>" 
	              		+	"<button id='goStore'>가게보기</button>"
	              		+	"<button id='deleteReview'>리뷰삭제<input type='hidden' name='${_csrf.parameterName}' value='${_crsf.token}'></button>"
	              		+"<input type='hidden' id='comment_id' name='comment_id' value='"+this.comment_id+"'>"
	              		+"<input type='hidden' id='store_id' name='store_id' value='"+this.comment_store+"'></div></div>"
	              		+ 	"<div class='mypageReview__content-right'>"
	              		+		"<div class='mypageReview__content-right--rivew'>" + this.comment_content
	              		+	"<br><span>("+this.created_at+")</span></div></div></div>" 
	              		
	              		$(".mypageReview-content").append(output);
				});
				if(data.listCount>data.list.length){
					$(".addMessage").text("더보기")
				}else{
					$(".addMessage").text("첫 댓글입니다.")
				}
			}
			else{
				$(".addMessage").hide()
			}
		},
		error:function(){
			console.log("comment-list-by-user-ajax ERROR")
		}
	})//ajax end
	$(".mypageReview-content").on("click","#goStore",function(){
		var order_id= $(this).next().next().next().val();
		var quary = "store_id="+order_id;
		location.href="../user/orderMain?"+quary;
		console.log(store_id);
	})
}

$(".addMessage").click(function(){
	getUserCommentList(++page);
});

//리뷰를 삭제했을 경우 status변경해주기
//deleteReview를 클릭하면 comfirm로 삭제 여부 묻기
//삭제여부에 따라 comment_id를 가져온뒤 넘겨준다.
$(".mypageReview-content").on("click","#deleteReview",function(){
	if(!confirm("해당 리뷰를 삭제하시겠습니까?")){
		return;
	}
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	var comment_id = $(this).next().val();
	console.log(comment_id);
	$.ajax({
		method:"post",
		url:"../comment/user/deleteUserComment",
		data:{"comment_id":comment_id},
		/*beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },*/
		dataType:"json",
		success:function(data){
			console.log('ajax success');
			if( data.result){
				getUserCommentList(page);
				$("#infoModal__msg").text("리뷰 삭제 성공하였습니다")
				$("#infoModal").modal("show");
			}
			else{
				$("#infoModal__msg").text("리뷰 삭제 실패하였습니다. 관리자에게 문의해주세요.");
				$("#infoModal").modal("show");
				console.log("deleteUserComment ERROR");
			}
		},
		error:function(req, status, err){
			console.log("DeleteComment ajax ERROR",err)
		}
	});//deleteComment ajax end
	
});

})//function end