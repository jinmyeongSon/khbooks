var searchKey='';
var searchWord='';
var currentPage=0;
$(document).ready(function(){
	$('#userManage').on("click", userManage);
	$('#bookManage').on("click", bookManage);
	$('#bookInsert').on("click", bookInsert);
	$('#authorManage').on("click", authorManage);
	$('#authorInsert').on("click", authorInsert);
});

// user list 불러오기
function userManage() {
	$('#managePlace').empty();
	$('#managePlace').load("userList.kh");
	return false;
}

// book list 불러오기
function bookManage() {
	$('#managePlace').empty();
	$('#managePlace').load("bookList.kh");
	return false;
}

// book insert form 만들어주기
function bookInsert() {
	$('#managePlace').empty();
	$('#managePlace').load("bookInsertForm.kh");
	return false;
}

// author list 불러오기
function authorManage() {
	$('#managePlace').empty();
	$('#managePlace').load("authorList.kh");
	return false;
}

// author insert form 만들어주기
function authorInsert() {
	$('#managePlace').empty();
	$('#managePlace').load("authorInsertForm.kh");
	return false;
}

// 책 상세정보 페이지 이동
$(document).on('click', '#detail', function() {
	var bno=$(this).parent().attr('id');
	$('#managePlace').empty();
	$('#managePlace').load("bookDetailForm.kh?bno="+bno);
	return false;
});

//책 업데이트
$(document).on('click', '#bookUpdate', function() {
	var bname=$('#bname').val();
	var binfo=$('#binfo').val();
	if (confirm('수정하시겠습니까?')) {
		if (bname == '' || binfo == '') {
			alert('비어있는 값은 입력할 수 없습니다.');
			return false;
		}
		var file = document.getElementById("bthumb").files.length;
		var formData = new FormData();
		if (file != 0) {
			formData.append('file', $("input[id=bthumb]")[0].files[0]);
		}
		formData.append('bno', $("#bno").val());
		formData.append('bname', bname);
		formData.append('binfo', binfo);
		formData.append('gno', $("#genre").val());
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'bookUpdate.kh',
			data : formData,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(res) {
				alert('수정 완료');
				$('#managePlace').empty();
				$('#managePlace').html(res);
			}
		});
	}
});

// 책 삭제
$(document).on('click', '#bdelete', function() {
	if(confirm('삭제하시겠습니까?')){
		var bno=$(this).parent().attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("bookDelete.kh?bno="+bno+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	}
	return false;
});

// 작가 - 책 삭제
$(document).on('click', '#authorDel', function() {
	if(confirm('삭제하시겠습니까?')){
		var bno=$('#bno').val();
		var auno = $(this).prev().prev().val();
		$('#managePlace').empty();
		$('#managePlace').load("bookAuthorDelete.kh?bno="+bno+"&auno="+auno);
	}
	return false;
});

//작가 - 책 입력
$(document).on('click', '#authorAdd', function() {
	if(confirm('추가하시겠습니까?')){
		var bno=$('#bno').val();
		var auno = $(this).parent().attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("bookAuthorInsert.kh?bno="+bno+"&auno="+auno);
		$('body').removeClass('modal-open');
		$('div').removeClass('modal-backdrop');
		$('div').removeClass('fade');
		$('div').removeClass('in');
	}
	return false;
});

//책 리스트 페이지 이동
$(document).on('click', '#back', function() {
	$('#managePlace').empty();
	$('#managePlace').load("bookList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

// 책 리스트 페이지 이동
$(document).on('click', '.movePage', function() {
	if($(this).parent().attr('class') == 'active'){
		return false;
	}
	currentPage=$(this).attr('id');
	$('#managePlace').empty();
	$('#managePlace').load("bookList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

//유저 업데이트 form
$(document).on('click', '#update', function() {
	var id=$(this).parent().attr('id');
	$('#managePlace').empty();
	$('#managePlace').load("userUpdateForm.kh?id="+id+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

// 유저 삭제
$(document).on('click', '#delete', function() {
	if(confirm('삭제하시겠습니까?')){
		var id=$(this).parent().attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("userDelete.kh?id="+id+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	}
	return false;
});

//serial 삭제
$(document).on('click', '#sdelete', function() {
	if(confirm('삭제하시겠습니까?')){
		var upno=$(this).parent().attr('id');
		var bno=$('#bno').val();
		$('#managePlace').empty();
		$('#managePlace').load("serialDelete.kh?bno="+bno+"&upno="+upno);
	}
	return false;
});

//bookAuthor 폼
$(document).on('click', '#bookAuthor', function() {
   	$('#authorModal').modal();
   	return false;
});

//bookAuthor 검색
$(document).on('click', '#authSearch', function() {
	var bno = $('#bno').val();
	var searchWord = '';
	searchWord = $('#searchName').val();
	if(searchWord == ''){
		alert('검색어를 입력하세요.');
		return false;
	} else {
		$.ajax({
			type : 'GET',
			dataType : 'text',
			url : 'bookAuthorSearch.kh?bno='+bno+'&searchWord='+searchWord,
			success : function(res) {
				$('#searchRes').empty();
				$('#searchRes').html(res);
			}
			
		});
	}
	return false;
});

// user update
$(document).on('click', '#uupdate', function() {
	$('#managePlace').empty();
	var data = $(this).parent().serialize();
	$('#managePlace').load("userUpdate.kh?"+data);
	return false;
});

//user update cancel
$(document).on('click', '#ucancel', function() {
	$('#managePlace').empty();
	$('#managePlace').load("userList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

//serial insert 폼
$(document).on('click', '#newSerial', function() {
   	$('#newModal').modal();
   	return false;
});

//serial 업데이트 폼
$(document).on('click', '#supdate', function() {
   	var upno=$(this).parent().attr('id');
   	$('#updateNo').val(upno);
   	$('#myModal').modal();
   	return false;
});

//serial 업데이트
$(document).on('click', '#saveUpdate', function() {
	var title = $('#updateTitle').val();
	var file = document.getElementById("updateFile").files.length;
	var formData = new FormData();
	if(title == '' && file == 0){
		alert('바꿀 내용이 없습니다!');
	} else if(title != '' && file != 0) {
		formData.append('stitle', title);
		formData.append('filename', $("input[id=updateFile]")[0].files[0]);
	} else {
		if(title != ''){
			formData.append('stitle', title);
		}else{
			formData.append('filename', $("input[id=updateFile]")[0].files[0]);
		}
	}
	formData.append('bno', $("#bno").val());
	formData.append('upno', $('#updateNo').val());
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'serialUpdate.kh',
		data : formData,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(res) {
			$('#managePlace').empty();
			$('#managePlace').html(res);
		}
	});
});

//serial insert
$(document).on('click', '#serialIns', function() {
	var title = $('#serialTitle').val();
	var file = document.getElementById("serialFile").files.length;
	var price = 0;
	price = $('#price').val();
	var formData = new FormData();
	if(title == '' || file == 0){
		alert('가격을 제외한 모든 내용을 입력하세요');
		return false;
	} else {
		formData.append('stitle', title);
		formData.append('sprice', price);
		formData.append('filename', $("input[id=serialFile]")[0].files[0]);
	}
	formData.append('bno', $("#bno").val());
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'serialInsert.kh',
		data : formData,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(res) {
			$('#managePlace').empty();
			$('#managePlace').html(res);
		}
	});
});

// 모달 캔슬버튼 시 내용 삭제
$(document).on('click', '#modalCancel', function() {
	$('#searchName').val('');
	$('#serialFile').val('');
	$('#price').val('');
	$('#serialTitle').val('');
	$('#updateTitle').val('');
	$('#updateFile').val('');
	$('#updateNo').val('');
	$('#searchRes').empty();
});

// 유저 리스트 페이지 이동
$(document).on('click', '.userMovePage', function() {
	if($(this).parent().attr('class') == 'active'){
		return false;
	}
	currentPage=$(this).attr('id');
	$('#managePlace').empty();
	$('#managePlace').load("userList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

// 작가 업데이트 버튼
$(document).on('click', '#aupdate', function() {
	var auno=$(this).parent().attr('id');
	$('#managePlace').empty();
	$('#managePlace').load("authorUpdateForm.kh?auno="+auno+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

// 작가 삭제 버튼
$(document).on('click', '#adelete', function() {
	if(confirm('삭제하시겠습니까?')){
		var auno=$(this).parent().attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("authorDelete.kh?auno="+auno+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	}
	return false;
});

// 작가 리스트 페이지 이동
$(document).on('click', '.authorMovePage', function() {
	if($(this).parent().attr('class') == 'active'){
		return false;
	}
	currentPage=$(this).attr('id');
	$('#managePlace').empty();
	$('#managePlace').load("authorList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
});

//작가 insert
$(document).on('click', '#addAuthor', function() {
	var form = $(this).closest('form');
	var form_data = form.serialize();
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : form.attr('action'),
		data : form_data,
		success : function(res) {
			$('#managePlace').empty();
			$('#managePlace').html(res);
		}
	});
	return false;
});

// 작가 업데이트
$(document).on('click', '#aupdate', author_update_click);
function author_update_click() {
	$('#managePlace').empty();
	var data = $(this).parent().serialize();
	$('#managePlace').load("authorUpdate.kh?"+data);
	return false;
}

// 작가 업데이트 취소
$(document).on('click', '#acancel', author_cancel_click);
function author_cancel_click() {
	$('#managePlace').empty();
	$('#managePlace').load("authorList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
}

// book insert
$(document).on('click', '#addBook', function() {
	var form = $(this).closest('form');
	var form_data = new FormData(form[0]);
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : form.attr('action'),
		data : form_data,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(res) {
			$('#managePlace').empty();
			$('#managePlace').html(res);
		}
	});
	return false;
});

// user search
$(document).on('click', '#userSearch', function() {
	var searchKey = $('#searchKey').val();
	var searchWord = $('#searchWord').val();
	if(searchWord == ''){
		alert('검색어를 입력해야 합니다.');
		return false;
	} else {
		$('#managePlace').empty();
		$('#managePlace').load("userList.kh?searchKey="+searchKey+"&searchWord="+searchWord);
	}
	return false;
});

// book search
$(document).on('click', '#bookSearch', function() {
	var searchKey = $('#searchKey').val();
	var searchWord = $('#searchWord').val();
	if(searchWord == ''){
		alert('검색어를 입력해야 합니다.');
		return false;
	} else {
		$('#managePlace').empty();
		$('#managePlace').load("bookList.kh?searchKey="+searchKey+"&searchWord="+searchWord);
	}
	return false;
});

// author search
$(document).on('click', '#authorSearch', function() {
	var searchKey = $('#searchKey').val();
	var searchWord = $('#searchWord').val();
	if(searchWord == ''){
		alert('검색어를 입력해야 합니다.');
		return false;
	} else {
		$('#managePlace').empty();
		$('#managePlace').load("authorList.kh?searchKey="+searchKey+"&searchWord="+searchWord);
	}
	return false;
});





