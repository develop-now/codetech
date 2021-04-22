let basket = {
	totalCount : 0,
	totalPrice : 0,
	totalCountA : 0,
	totalPriceA : 0,

	// 재계산
	reCalc : function() {
		this.totalCount = 0;
		this.totalPrice = 0;
		document
				.querySelectorAll(".p_num")
				.forEach(
						function(item) {
							var count = parseInt(item.getAttribute('value'));
							this.totalCount += count;
							var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
									.getAttribute('value');
							this.totalPrice += count * price;
						}, this); // forEach 2번째 파라메터로 객체를
		// 넘겨서 this 가 객체리터럴을
		// 가리키도록 함. - thisArg
	},

	// 화면 업데이트
	updateUI : function() {
		document.querySelector('#sum_p_num').textContent = '총 : ' 
			+ this.totalCount.formatNumber() + '개';
	document.querySelector('#sum_p_price').textContent	 = 
			this.totalPrice.formatNumber(); + '원';
		document.querySelector('#sum_p_numA').value = 
				+ this.totalCount.formatNumber();
		document.querySelector('#sum_p_priceA').value	 = 
				this.totalPrice.formatNumber();
	},
	// 개별 수량 변경 인기메뉴
	changePNum : function(pos) {
		var item = document.querySelector('input[id=p_num' + pos + ']');
		var p_num = parseInt(item.getAttribute('value'));
		var newval = event.target.classList.contains('up') ? p_num + 1
				: event.target.classList.contains('down') ? p_num - 1
						: event.target.value;


		if (parseInt(newval) < 0 || parseInt(newval) > 99) {
			return false;
		}
		
		item.setAttribute('value', newval);
		item.value = newval;

		var price = item.parentElement.parentElement.previousElementSibling.firstElementChild
				.getAttribute('value');

		// AJAX 업데이트 전송

		// 전송 처리 결과가 성공이면
		this.reCalc();
		this.updateUI();
	},
	// 개별 수량 변경 전체메뉴
	changePANum : function(pos) {
		
		var itemA = document.querySelector('input[id=p_numA' + pos + ']');
		var p_numA = parseInt(itemA.getAttribute('value'));
		var newvalA = event.target.classList.contains('up') ? p_numA + 1
				: event.target.classList.contains('down') ? p_numA - 1
						: event.target.value;

		if (parseInt(newvalA) < 0 || parseInt(newvalA) > 99) {
			return false;
		}
		
	
		
	
		itemA.setAttribute('value', newvalA);
		itemA.value = newvalA;

		var priceA = itemA.parentElement.parentElement.previousElementSibling.firstElementChild
				.getAttribute('value');
		itemA.parentElement.parentElement.nextElementSibling.textContentA = (newvalA * priceA)
				.formatNumber()
				+ "원";
		
		// AJAX 업데이트 전송

		// 전송 처리 결과가 성공이면
		this.reCalc();
		this.updateUI();
	},
	
	delItem : function() {
		event.target.parentElement.parentElement.parentElement.remove();
	}
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function() {
	if (this == 0)
		return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr))
		nstr = nstr.replace(regex, '$1' + ',' + '$2');
	return nstr;
};

	

  


$(function(){
	$("store_oreder_main_table").hide();
	var store_id = $("#store_id").val();
	console.log(store_id);
	console.log("function");
	var page = 1;
	count = $("#listCount").val();
	/*if(count != 0){
		console.log("count쪽")
		getStoreCommentList(page,store_id);
	}*/
	
	$(".storeReview-btn").on('click', function(){
		console.log("btn클릭");
		getStoreCommentList(page,store_id);
	});//$(".storeReview-btn").on('click' end
	
	
	
	$(".RVaddMessage").click(function(){
		getStoreCommentList(++page,store_id);
	});
});//$(function() end

function getStoreCommentList(currentPage,store_id){
	console.log("getStoreCommentList");
	$.ajax({
		type:"get",
		url:"../comment/user/storeAllReview",
		data:{"page":currentPage,"store_id":store_id},
		dataType:"json",
		success:function(data){
			if(data.listCount > 0){
				$(".store_oreder_main_table>table>tbody,.store_oreder_main, .payMentView").empty();
				$(".store_oreder_main_table").show();
				var output =""
					$(data.list).each(function(){
						console.log("each 실행")
						var lev = this.comment_lev;
						output = "" 
							console.log(lev)
							if(lev != 1){
								output += "<tr><td class='reivewline'>&nbsp;</td><td class='reivewline'></td></tr>"
										+"<tr><td>"+this.comment_writer_value+"</td>" 
										+"<td>" +this.comment_content +"</td></tr>"
								console.log(this.comment_writer_value);
							}else{
						output += "<tr><td><span><img src='../resources/image/user/review.png 'width=20px></span>"
								+this.comment_writer_value+"</td>" 
								+"<td>" +this.comment_content +"</td></tr>"
							}
						$(".store_oreder_main_table>table>tbody").append(output);
					});//each end
						
				if(data.listCount>data.list.length){
					$(".RVaddMessage").text("더보기")
				}else{
					$(".RVaddMessage").text("첫 댓글입니다.")
				}
			}
		},error:function(req, stataus, err){
	         console.log("storeReviewAjax ERROR", status,err)
	      }
		
	});//$.ajax end
};