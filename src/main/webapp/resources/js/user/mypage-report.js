$(function(){
	console.log("report ajax")
	var page =1
	go(page)
})
function go(page){
	var data = "page=" + page;
	ajax(data);
}

function setPaging(href, digit){
	output += "<li class=page-item>";
	gray="";
	if(href=="") {
		gray=" gray";// 한칸 띄기 조심
	}
	anchor = "<a class='page-link" + gray + "'" + href + ">" + digit + "</a></li>";
	output += anchor;
}

function ajax(sdata) {
	console.log(sdata)
	output = "";
	$.ajax({
		type : "get",
		url : "../user/reportList?"+sdata,
		cache : false,
		success : function(data){
			if (data.reportCount > 0) { // 총갯수가 0보다 큰경우
				console.log("성공")
				$(".report__table tbody").remove();
				console.log("repr"+data.reportCount)
				var num = data.reportCount - (data.page -1) * data.limit;
				output = "<tbody>";
				$(data.list).each(
					function(index, item){
						console.log(num);
						output += '<tr><td>' + (num--) + '</td>'
						output += "<td><div>" 
					if(item.store_report_id != 0){
						output += ' <a href="../user/reportDetail?store_report_id='+ item.store_report_id + '">'
					}else if(item.user_report_id != 0){
						output += ' <a href="../user/reportDetail?user_report_id='+ item.user_report_id + '">'
					}
						output += item.report_subject.replace(/</g,'&lt;').replace(/>/g,'&gt;') + '</a></div></td>'
							+ "<td>"+ item.created_at + "</td>"
					if(item.report_status == 1){
						output += '<td><span>등록완료</span></td>'
					}else if(item.report_status == 2){
						output += '<td><span>처리중</span></td>'
					}else{
						output += '<td><span>처리완료</span></td>'
					}
					output += '</tr>'
				})
				output += "</tbody>"
				$('table').append(output)//table완성
				
				$(".reportPagination").empty(); //페이징 처리 영역 내용 제거
	            output = "";
	            
	            digit = '이전&nbsp;';
	             href="";
	            if(data.page>1){
	               href = 'href=javascript:go('+(data.page -1)+')';
	            }
	            setPaging(href, digit);
	            
	            for(var i = data.startpage; i <= data.endpage; i++ ){
	            	digit = i;
	            	href="";
	            	if(i != data.page){
	            		href = 'href=javascript:go(' + i +')';
	            	}
	            	setPaging( href, digit);
	            }
	            	digit = '&nbsp;다음&nbsp;';
		             href="";
		            if(data.page < data.maxpage) {
		               href = 'href=javascript:go(' + (data.page + 1) + ')';
		            }
		            setPaging(href, digit);	
		            
		            $('.reportPagination').append(output)
			}//if(data.list) end
			
		},//success end
		error : function(){
			console.log('에러')
		}
	})//ajax end
}//function end

/*$(function(){
	$("#viewcount").change(function(){
		go(1);//보여줄 페이지 1페이지로 설정한다.
	});//change end

})*/