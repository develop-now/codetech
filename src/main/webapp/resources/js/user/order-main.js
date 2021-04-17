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
		document.querySelector('#sum_p_price').placeholder = 
				this.totalPrice.formatNumber();
	},
	// 개별 수량 변경 인기메뉴
	changePNum : function(pos) {

		var item = document.querySelector('input[name=p_num' + pos + ']');
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
		var itemA = document.querySelector('input[name=p_numA' + pos + ']');
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




