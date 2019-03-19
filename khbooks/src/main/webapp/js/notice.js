var upnnum = '';
var fileList = [];

$(document).ready(function(){
	
	$('#write').on('click', notice_list);
	
	//첨부파일 시작//
	var userFile = '';
	$('#userpc').on('click', function(){
		userFile = $('<input type="file" id="userfile"/>');
		userFile.click();
		userFile.change(function(){
			alert($(userFile[0]).val()); // c:\\fakepath\\example.txt
			var partname=$(userFile[0]).val().substring($(userFile[0]).val().lastIndexOf("\\")+1);
			alert(partname);
			var str='<p><input type="checkbox"/>'+partname+'</p>'
			$('.fileDrop').append(str);
			fileList.push(userFile[0].files[0]);
		})
	});//첨부파일 끝//
	
	
	//첨부파일 드래그 시작//
	var obj = $('.fileDrop');
	obj.on('dragover', function(e){
		e.preventDefault();
		$(this).css('border','2px solid #0B85A1');
	});
	
	obj.on('drop', function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		for(i=0; i<files.length; i++) {
			obj.append('<p><input type="checkbox"/>'+files[i].name+'</p>');
			fileList.push(files[i]);
		}
	}); //첨부파일 드래그 끝//
	
	$(document).on('click', '.fileDrop input[type="checkbox"]', function(){
		//$(obj).empty();
		$(this).parent().remove();
		fileList='';
	});
	
	
	////////////////////////////게시글 수정 삭제//////////////////////////
	//게시글 삭제,수정 이벤트
	$(document).on('click', '.post-data button', notice_update_delete);
	
	
});//end ready


function notice_update_delete() {
	if($(this).text() == "삭제") {
		var delnum = $(this).prop("id");
		alert("삭제번호 : " + delnum);
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'noticeDelete.kh?nnum='+delnum,
			success : function(res){
				alert('삭제 성공');
				location.href = 'noticeList.kh';
			}
		});
		
	} else if($(this).text() == "수정") {
		var upnnum = $(this).prop("id");
		alert("수정 번호 : " + upnnum);
		location.href = 'noticeUpdate.kh?nnum='+upnnum
	}
}



function notice_list(){
	var text = $('#btext').val();
	if(text == '') {
		alert('내용을 입력해주세요.');
		return false;
	}
	
	var form_data = new FormData();
	form_data.append('aid', $('#aid').val());
	form_data.append('bname', $('#bname').val());
	form_data.append('btext', $('#btext').val());
	
	
	if(fileList) {
		for(var index in fileList) {
			form_data.append('filename', fileList[index]);
		}
	}
	
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : 'noticeWritePro.kh',
		data : form_data,
		contentType:false,
		enctype:'multipart/form-data',
		processData:false,
		success : notice_list_result
	});
	
	
	$('#btext').val();
	$('.fileDrop').empty();
	fileList = [];
	
}//end notice_list()



function notice_list_result(res) {
	alert('업로드 성공');

	location.href = 'noticeList.kh';
	
}//end notice_list_result()


Handlebars.registerHelper("newDate",function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	if(month < 10){
		month = "0" + month;
	}
	var date = dateObj.getDate();
	return year + "/" +  month + "/" +  date;
});

Handlebars.registerHelper("newUpload",function(uploadFile){
	var uplist = '';
	$.each(uploadFile, function(index, value){
		if(value.upname != null){
			uplist += "<p>" + value.upname.substring(value.upname.indexOf("_")+1) + "</p>";
		}
	});
	return uplist;
});
