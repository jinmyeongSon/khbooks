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
		<input type="button" id="ucancel" value="취소"/>
	</form>
</body>
</html>
