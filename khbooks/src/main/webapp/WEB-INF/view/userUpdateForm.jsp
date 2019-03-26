<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>KH BOOKs</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
	var searchKey='';
	var searchWord='';
	var currentPage='';
	$(document).ready(function() {
		searchKey='${adto.searchKey}';
		searchWord='${adto.searchWord}';
		currentPage='${adto.currentPage}';
		$('#update').on('click', update_click);
		$('#cancel').on('click', cancel_click);
		function update_click() {
			$('#managePlace').empty();
			var data = $(this).parent().serialize();
			$('#managePlace').load("userUpdate.kh?"+data);
			return false;
		}
	});
	
	
	function cancel_click() {
		$('#managePlace').empty();
		$('#managePlace').load("userList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
		return false;
	}
</script>
<style type="text/css">
input{
	width:110px;
}
</style>
</head>
<body>
	<form action="userUpdate.kh" id="frm">
		<input type="text" id="id" name="id" value="${udto.id}" readonly="readonly"/>
		<input type="text" id="upass" name="upass" value="${udto.upass}"/>
		<input type="text" id="uname" name="uname" value="${udto.uname}"/>
		<input type="text" id="uemail" name="uemail" value="${udto.uemail}"/>
		<input type="text" id="uphone" name="uphone" value="${udto.uphone}"/>
		<input type="text" id="uaddr" name="uaddr" value="${udto.uaddr}"/>
		<input type="text" id="udate" name="udate" value="${udto.udate}"/>
		<input type="text" id="ugender" name="ugender" value="${udto.ugender}"/>
		<input type="button" id="update" value="수정하기"/>
		<input type="button" id="cancel" value="취소"/>
	</form>
</body>
</html>
