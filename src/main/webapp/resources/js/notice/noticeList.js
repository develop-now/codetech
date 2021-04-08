$(function() {
	go(1); // 보여줄 페이지를 1 페이지로 설정합니다.
})

function go(page) {
	var limit = 15; // 리미트 값 고정
	var data = "limit=" + limit + "&page=" + page;
	ajax(data);
}