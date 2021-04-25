$(function() {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
	
	
/*<!-- 불러온 좌표 --> */
	var rlat = $('#lat').val();
	var rlon = $('#lon').val();
	console.log(rlat);
	console.log(rlon);
	if(rlat == "" ) {
		rlat == 37.572799;
		rlon == 126.991945;
	}
/*<!-- 지도를 띄우는 코드 -->*/
	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션

			center : new kakao.maps.LatLng(rlat, rlon), //지도의 중심좌표.
			level : 4 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		map.relayout();
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// TEST 
		// 마커를 표시할 위치와 title 객체 배열입니다 
		// 마커가 많으면 성능 문제 이슈가 있음. n백개 수준으로 증가하게 되면 properties 파일에 마커정보를 담고 해당 js를 jsp로 이동해서 불러와야 함.
		var positions = [
		    {
		        content: '<div>이마트24 카페</div>', 
		        latlng: new kakao.maps.LatLng(37.572799, 126.991945)
		    },
		    {
		    	content: '<div>쥬씨 종로종묘점</div>', 
		        latlng: new kakao.maps.LatLng(37.572150, 126.991821)
		    },
		    {
		    	content: '<div>더해봄카페</div>', 
		        latlng: new kakao.maps.LatLng(37.572698, 126.993145)
		    },
		    {
		    	content: '<div>장꼬방</div>', 
		        latlng: new kakao.maps.LatLng(37.498329, 127.023793)
		    },
		    {
		    	content: '<div>커피한잔</div>', 
		        latlng: new kakao.maps.LatLng(37.540318, 127.122089)
		    },
		    {
		    	content: '<div>카페로니</div>', 
		        latlng: new kakao.maps.LatLng(37.625421, 127.027379)
		    },
		    {
		    	content: '<div>정감</div>', 
		        latlng: new kakao.maps.LatLng(37.541555, 126.837247)
		    },
		    {
		    	content: '<div>마티스커피</div>', 
		        latlng: new kakao.maps.LatLng(37.482824, 126.928956)
		    },
		    {
		    	content: '<div>자그마치</div>', 
		        latlng: new kakao.maps.LatLng(37.542681, 127.056724)
		    },
		    {
		    	content: '<div>하루의하루</div>', 
		        latlng: new kakao.maps.LatLng(37.493716, 126.887315)
		    },
		    {
		    	content: '<div>상록수다방</div>', 
		        latlng: new kakao.maps.LatLng(37.456619, 126.899447)
		    },
		    {
		    	content: '<div>시드누아</div>', 
		        latlng: new kakao.maps.LatLng(37.656306, 127.064295)
		    },
		    {
		    	content: '<div>와플대학</div>', 
		        latlng: new kakao.maps.LatLng(37.662475, 127.031212)
		    },
		    {
		    	content: '<div>청년다방</div>', 
		        latlng: new kakao.maps.LatLng(37.584439, 127.053107)
		    },
		    {
		    	content: '<div>고미제과</div>', 
		        latlng: new kakao.maps.LatLng(37.510827, 126.945661)
		    },
		    {
		    	content: '<div>댓커피</div>', 
		        latlng: new kakao.maps.LatLng(37.555419, 126.939913)
		    },
		    {
		    	content: '<div>미담헌</div>', 
		        latlng: new kakao.maps.LatLng(37.573648, 126.989794)
		    },
		    {
		    	content: '<div>에일당</div>', 
		        latlng: new kakao.maps.LatLng(37.573495, 126.990055)
		    },
		    {
		    	content: '<div>솜붕아</div>', 
		        latlng: new kakao.maps.LatLng(37.570598, 126.991583)
		    },
		    {
		    	content: '<div>카페컴온</div>', 
		        latlng: new kakao.maps.LatLng(37.567002, 126.979687)
		    },
		    {
		    	content: '<div>팡세</div>', 
		        latlng: new kakao.maps.LatLng(37.594249, 127.092949)
		    },
		    {
		    	content: '<div>R커피</div>', 
		        latlng: new kakao.maps.LatLng(37.565872, 126.964373)
		    },
		    {
		    	content: '<div>셀럽쿠키</div>', 
		        latlng: new kakao.maps.LatLng(37.599302, 126.913985)
		    },
		    {
		    	content: '<div>토프레소</div>', 
		        latlng: new kakao.maps.LatLng(37.533901, 126.991242)
		    },
		    {
		    	content: '<div>카페마마스</div>', 
		        latlng: new kakao.maps.LatLng(37.529643, 126.919154)
		    },
		    {
		    	content: '<div>테오</div>', 
		        latlng: new kakao.maps.LatLng(37.520640, 126.858995)
		    },
		    {
		    	content: '<div>피치그레이</div>', 
		        latlng: new kakao.maps.LatLng(37.503643, 127.110934)
		    },
		    {
		    	content: '<div>모퉁이카페효제눅</div>', 
		        latlng: new kakao.maps.LatLng(37.575022, 127.001415)
		    },
		    {
		    	content: '<div>우유커피</div>', 
		        latlng: new kakao.maps.LatLng(37.561658, 127.040666)
		    },
		    {
		    	content: '<div>주커피</div>', 
		        latlng: new kakao.maps.LatLng(37.491558, 127.010244)
		    },
		    {
		    	content: '<div>홍매 COFFEE</div>',
		        latlng: new kakao.maps.LatLng(37.573790, 126.991682)
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var markerList = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				image : markerImage// 마커 이미지
				//clickable : true
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정
			});

			var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는
										// x버튼이 표시됩니다

			// 마커에 표시할 인포윈도우를 생성합니다
			var infowindowList = new kakao.maps.InfoWindow({
				content : positions[i].content, // 인포윈도우에 표시할 내용
				removable : iwRemoveable
			});
			
		//마커 위 인포윈도우 표시
			//infowindowList.open(map, markerList);

			kakao.maps.event.addListener(markerList, 'click', makeClickListener(map, markerList, infowindowList));
			
			function makeClickListener(map, markerList, infowindowList) {
				return function() {
					infowindowList.open(map, markerList);
				};
			}
		} // for
	

});
		

