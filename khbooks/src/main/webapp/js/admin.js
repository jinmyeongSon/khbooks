var searchKey='';
var searchWord='';
var currentPage='';
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
	$('#managePlace').load("bookDetailForm.kh?bno="+bno+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	return false;
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

// 유저 업데이트
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