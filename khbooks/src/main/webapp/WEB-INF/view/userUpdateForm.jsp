<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>KH BOOKs</title>
<script type="text/javascript">
	$(document).ready(function() {
		searchKey='${adto.searchKey}';
		searchWord='${adto.searchWord}';
		currentPage='${adto.currentPage}';
<<<<<<< HEAD
=======
		$('#uupdate').on('click', update_click);
		$('#cancel').on('click', cancel_click);
		function update_click() {
			$('#managePlace').empty();
			var data = $(this).parent().serialize();
			alert(data);
			$('#managePlace').load("userUpdate.kh?"+data);
			return false;
		}
>>>>>>> branch 'book' of https://github.com/jinmyeongSon/khbooks.git
	});
	
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
		<input type="text" id="ubirth" name="ubirth" value="${udto.ubirth}"/>
		<input type="text" id="ugender" name="ugender" value="${udto.ugender}"/>
		<input type="button" id="uupdate" value="수정하기"/>
<<<<<<< HEAD
		<input type="button" id="ucancel" value="취소"/>
=======
		<input type="button" id="cancel" value="취소"/>
>>>>>>> branch 'book' of https://github.com/jinmyeongSon/khbooks.git
	</form>
</body>
</html>
