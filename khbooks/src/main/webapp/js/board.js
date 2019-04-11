var upbcno = ''; //수정 댓글 번호
var id = '';
$(document).ready(function(){
	//수정 모달 숨기기
	$('#modifyModal').addClass('modifyHide');
	
	//댓글 추가에 이벤트 연결
	$('#addComment').on('click', comment_list);
	
	//댓글 수정, 삭제 이벤트
	$(document).on('click', '.listUl button', comment_update_delete);
	
	//댓글  수정 이벤트
	$('#modifyModal #btnModify').on('click', comment_update_send);
	
	//댓글 닫기 이벤트
	$('#btnClose').on('click', function(){
		$('#modifyModal').removeClass('modifyShow');
		$('#modifyModal').addClass('modifyHide');
		$(document).on('click', '.listUl button', comment_update_delete);
	});
	
//////////게시글///////////////////////////////////////////////////////////////////////	
	
	//게시글 삭제,수정 이벤트
	$(document).on('click', '.post-data button', board_update_delete);
	
	
});// end ready


function board_list() {
	location.href = 'boardList.kh'
}

function board_update_delete(){
	
	if($(this).text() == "삭제") {
		var delbonum = $(this).prop("id");
		/*alert(delbonum);*/
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'boardDelete.kh?bonum='+delbonum,
			success : function(res){
				alert('삭제 성공');
				location.href = 'boardList.kh'
			}
		});
		
	} else if($(this).text() == "수정") {
		var upbonum = $(this).prop("id");
		/*alert("뷰페이지 수정 번호 : " + upbonum);*/
		location.href = 'boardUpdate.kh?bonum='+upbonum
		
	} else if($(this).text() == "등록") {
		$('#boardUp').val($('#boardUp').val().replace(/\n/gi, '<br/>'));
		$('#frm').attr('action', 'boardUpdatePro.kh').submit();

	} else if($(this).text() == "글쓰기") {
		$('#frm').attr('action', 'boardWritePro.kh').submit();
	}	
		
}//end board_update_delete()


function comment_list(){
	var text = $('#textarea').val();
	if(text==''){
		alert("내용을 입력해 주십시오.");
		return false;
	}
	var bonum = $(this).parent().prop("id");
	
	/*var form_data=new FormData();
	form_data.append('bonum', '${bdto.bonum}');
	form_data.append('id', $('#prependedInput').val());
	form_data.append('bctext', $('#textarea').val());*/

	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'commentInsert.kh?bonum='+bonum+'&id='+$('#prependedInput').val()+'&bctext='+text,
		success : comment_list_result 
	});
	
	$('.commentInput').val('');
	
}//end comment_list

function comment_update_delete(){
	
	if($(this).text() == '수정') {
		upbcno = $(this).prop("id");
		/*alert('수정 댓글 번호 : ' + upbcno);*/
		
		$('#modifyModal').css({
			 "position" : "absolute",
			  "bottom" : "15px",
			  "left" : "700px"
		});
		
		$('#modifyModal').removeClass('modifyHide').addClass('modifyShow');
		$(document).off('click', 'listUl button');
		
	} else if($(this).text() == "삭제") {
		var delbcno = $(this).prop("id");
		var bonum = $(this).prop("class"); //ReplyDTO의 bonum임
		/*alert('삭제 댓글 번호 ' + delbcno);
		alert('삭제 댓글의 게시글 번호' + bonum);*/
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'commentDelete.kh?bonum='+bonum+'&bcno='+delbcno,
			success : comment_list_result
		});
	}
}//end comment_update_delete

function comment_update_send() {
	
	var bonum = $('#btnModify').prop("class");
	/*alert(bonum);*/
	
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'commentUpdate.kh?bonum='+bonum+'&bcno='+upbcno+'&bctext='+$('#updateReplyText').val(),
		success : comment_list_result
	});
	
	$('#updateReplyText').val('');
	$('#modifyModal').removeClass('modifyShow').addClass('modifyHide');
}//end comment_update_send



function comment_list_result(res) {
		$('.listUl .commList').remove();
		$('#replycntSmall').text('댓글['+res.length+']');
		
		$.each(res, function(index, value){
			var source = '<li class="commList" id="{{bcno}}">'
				+'<span class="comment-name">{{id}}</span>'
				+'<span>&nbsp;&nbsp;</span>'
				+'<span class="comment-date">{{newDate bcdate}}</span>'
				+'<div style="font-size:15px;" class="comment-content">{{bctext}}</div>'
				+'<button id="{{bcno}}" class="{{bonum}}" style="margin-top:15px;">수정</button>'
				+'<button id="{{bcno}}" class="{{bonum}}" style="margin-top:15px;">삭제</button></li>';

			var template = Handlebars.compile(source);
			$('.listUl').append(template(value));
		});


}//end comment_list_result


Handlebars.registerHelper("newDate", function(timeValue){ //function 함수에서 처리해준 결과값을 newDate에서 받음
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	if(month < 10){
		month = "0" + month;
	}
	var date = dateObj.getDate();
	if(date < 10){
		date = "0" + date;
	}
	
	return year + "/" + month + "/" + date;
});



