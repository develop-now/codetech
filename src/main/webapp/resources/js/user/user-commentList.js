//controller에서 꺼내온 리뷰갯수가 없다면 "noreview"를 보내와서 화면을 띄어준다.
//ajax를 사용하여jsp화면을 만들어준다.
//처음에 가져올 갯수를 설정하고 그 이상일 경우 더보기를 클릭하여 1-*()클린한 수 만큼 보여준다
function getUserCommentLsit(currentPage){
	$.ajax({
		type:"get",
		url:"../comment/comment-list-by-user-ajax",
		data:{"page":currentPage},
		dataType:"json",
		success:function(data){
			if(data.listcount > 0){
				$(".mypageReview__body").empty();
				//가지고온 data의 객체들을 하나씩 반복해서 보여준다.
				$(data.list).each(function(){
					output="";
					output +="<div class='mypageReview__content-left'>" 
						+	"<div><span><img src='${pageContext.request.contextPath}/resources/image/common/unlike.png' alt='likecheck' width='30px'></span>"
	              		+		"<span>"+this.storeName+"</span></div>"
	              		+		"<div class='text-center'>" 
	              		+	"<button>주문상세</button>"
	              		+	"<button>리뷰삭제</button></div></div>"
	              		+ 	"<div class='mypageReview__content-right'>"
	              		+		"<div class='mypageReview__content-right--rivew'>" + this.comment_content
	              		+	"<span>("+this.created_at+")</span></div></div>" 
	              		
	              		$(".mypageReview__body").append(output);
				});
				if(data.listcount>data.list.length){
					$(".addMessage").text("더보기")
				}else{
					$(".addMessage").text("")
				}
			}
			else{
				$(".addmessage").test("등록된 댓글이 없습니다.")
			}
		},
		error:function(){
			console.log("comment-list-by-user-ajax ERROR")
		}
	})
}

$(".addmessage").click(function(){
	getUserCommentLsit(++page);
})