$(function(){
	
//modal hide
//button클릭시 가게값 가져와서 get 으로 ajax넘겨주기
//review 더보기로 ajax실행하도록 처리하기
   var page = 1;
   var store_id = $("#store_id").val();
   console.log(store_id);
   count = $('#cmtCount').val();
   var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
   if(count!=0){
      modalOpen(1);
   }
   
  function modalOpen(currentPage){
		console.log("modalfunction");

   $.ajax({
      type:"get",
      url:"../comment/user/storeAllReview",
      data:{"store_id": store_id,"page": page},
      dataType:"json",
      beforeSend: function (xhr) {
          xhr.setRequestHeader(header, token);
      },
      success:function(data){
          if(data.listCount > 0){
             $("#storeReviewModal").modal("show");
             $(".storeReviewModal-body").empty();
             $(data.list).each(function(){
                console.log("each 실행");
                output="";
                output += "<table><tbody><tr><input type='hidden' id='cmtCount' value='"+listCount+"'"
                      +"<td>"+list.comment_writer+"</td><td>"+list.comment_content+"</td></tr>"
                if(list.comment_lev == 1){
                      +"<tr><td>사장"+list.comment_writer+"</td><td>"+list.comment_content+"</td></tr>"
                }
                output + "</tbody></table>"   
                $(".storeReviewModal").append(output);
             })
             if(data.listCount > data.list.length){
                $(".storeReviewModal__button").text("더보기")
             }else{
                $(".storeReviewModal__button").text("")
             }
          }else{
             //모달창안에 아직 달린 리뷰가 없다고 띄우기
             $(".storeReviewModal-body").text("현재 달린 리뷰가 없습니다.");
          }
       },

      error:function(req, stataus, err){
         console.log("storeReviewAjax ERROR", err)
      }
   })
};
$(".storeReviewModal__button").click(function(){
	modalOpen(++page);
});


});