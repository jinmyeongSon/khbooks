var upbcno = ''; //수정 댓글 번호

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

function board_update_delete(){
	
	if($(this).text() == "삭제") {
		var delbonum = $(this).prop("id");
		alert(delbonum);
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
		alert(upbonum);
		location.href = 'boardUpdate.kh?bonum='+upbonum

	}
}//end board_update_delete()

function board_update_result(res) {
	alert('수정 창이 뜰것이다ㅏㅏㅏ');
	/*$('.span8 blog article').remove();
	
	$.each(res, function(index, value){
		var source = '<article>'
			+'<h3 class="title-bg">{{bname}}</h3>'
			+'<div class="post-content">'
			+'<a href="#"><img src="img/gallery/notice.jpg" alt="Post Thumb" readonly></a>'
			+'<div class="post-body"><p>{{btext}}</p></div>'
			+'<div class="post-summary-footer">'
			+'<ul class="post-data">'
			+'<li><i class="icon-calendar"></i>{{newDate bdate}}</li>'
			+'<li><i class="icon-user"></i> <a href="#">{{id}}</a></li>'
			+'<li><button type="button" class="btn btn-outline-dark" id="{{bonum}}">수정</button></li>'
			+'<li><button type="button" class="btn btn-outline-dark" id="li"  onclick="javascript:history.go(-1)">목록</button></li>'
			+'</ul></div></div></article>';
		
		var template = Handlebars.compile(source);
		$('.span8 blog').append(template(value));
	});*/
}//end board_update_result


function comment_list(){
	var bonum = $(this).parent().prop("id");
	alert(bonum);
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : 'commentInsert.kh',
		data : 'bonum='+bonum+'&id=hana&bctext='+$('.span6').val(),
		success : comment_list_result 
	});
	
	$('.span6').val('');
	
}//end comment_list

function comment_update_delete(){
	
	if($(this).text() == '수정') {
		upbcno = $(this).prop("id");
		alert('수정 댓글 번호 : ' + upbcno);
		
		var stop = $(window).scrollTop();
		$('#modifyModal').css('top', 50+stop);
		$('#modifyModal').removeClass('modifyHide').addClass('modifyShow');
		$(document).off('click', 'listUl button');
		
	} else if($(this).text() == "삭제") {
		var delbcno = $(this).prop("id");
		var bonum = $(this).prop("class"); //ReplyDTO의 bonum임
		alert('삭제 댓글 번호 ' + delbcno);
		alert('삭제 댓글의 게시글 번호' + bonum);
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'commentDelete.kh?bonum='+bonum+'&bcno='+delbcno,
			success : comment_list_result
		});
	}
}//end comment_update_delete

function comment_update_send() {
	//$('.commList:nth-child(6)')
	var bonum = $('#btnModify').prop("class");
	alert(bonum);
	
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
		
		$.each(res, function(index, value){
			var source = '<li class="commList" id="{{bcno}}">'
				+'<img src="img/user-avatar.jpg" alt="Image" />'
				+'<span class="comment-name">{{id}}</span>'
				+'<span>&nbsp;&nbsp;</span>'
				+'<span class="comment-date">{{newDate bcdate}}</span>'
				+'<div class="comment-content">{{bctext}}</div>'
				+'<button id="{{bcno}}">수정</button>'
				+'<button id="{{bcno}}">삭제</button></li>';
				
			var template = Handlebars.compile(source);
			$('.listUl').append(template(value));

		});
}//end comment_list_result


Handlebars.registerHelper("newDate",function(timeValue){ //function 함수에서 처리해준 결과값을 newDate에서 받음
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	
	return year + "/" + month + "/" + date;
});
