let basket = {
	totalCount : 0,
	totalPrice : 0,


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
						}, this); 
		
	},

	// 화면 업데이트
	updateUI : function() {
		document.querySelector('#sum_p_num').textContent = '총 : ' 
			+ this.totalCount.formatNumber() + '개';
	document.querySelector('#sum_p_price').textContent	 = '총  ' 
			+ this.totalPrice.formatNumber() + '원';
		document.querySelector('#sum_p_numA').value = 
				+ this.totalCount.formatNumber();
		document.querySelector('#sum_p_priceA').value	 = 
				this.totalPrice.formatNumber();
	},
	
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
	
	delItem : function() {
		event.target.parentElement.parentElement.parentElement.remove();
		var cart_id = event.target.previousElementSibling.getAttribute('value');
		var url = $('#ab').val() + "/user/cartDel"
		$.ajax({
			type : 'get',
			url : url, 
			data : 	data = {
					"cart_id" : cart_id
				},
			dataType : "json",
			success : function(rdata) {
				if(rdata == 1) {
				$("#cart_num"+$(".cart_id")).remove();
				}
				if(rdata == null){
				$(".buttonGroup").hide();
				}
			} // success;
		}) // ajax
		this.reCalc();
		this.updateUI();
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

