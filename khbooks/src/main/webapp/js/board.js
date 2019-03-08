$(document).ready(function(){
	
	//댓글 추가에 이벤트 연결
	$('#addComment').on('click', comment_list);
	
});// end ready

function comment_list(){
	alert('');
	
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : 'commentInsert.kh',
		data : 'bonum=22&id=hana&bctext='+$('.span6').val(),
		success : function(data) {
			
			$.each(data, function(index, value){
				var source = '<li id="commList" id="{{bcno}}">'
					+ '<img src="img/user-avatar.jpg" alt="Image" />'
					+ '<span class="comment-name">{{id}}</span>'
					+ '<span>&nbsp;&nbsp;</span>'
					+ '<span class="comment-date">{{newDate bcdate}}</span>'
					+ '<div class="comment-content">{{bctex}}</div>'
					+ '<button id="{{bcno}}">수정</button>'
					+ '<button id="{{bcno}}">수정</button></li>'
					
				var template = Handlebars.compile(source);
				$('.listUl').append(template(value));
			});
		}
		
	});
}//end comment_list


Handlebars.registerHelper("newDate",function(timeValue){ //function 함수에서 처리해준 결과값을 newDate에서 받음
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	
	return year + "/" + month + "/" + date;
});
