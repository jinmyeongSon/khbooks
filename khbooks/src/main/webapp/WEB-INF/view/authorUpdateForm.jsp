<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>KH BOOKs</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		<input type="text" id="auno" name="auno" value="${dto.auno}" readonly="readonly"/>
		<input type="text" id="auname" name="auname" value="${dto.auname}"/>
		<textarea rows="5" cols="100" name="auintro" required>${dto.auintro}</textarea>
		<input type="button" id="aupdate" value="수정하기"/>
		<input type="button" id="acancel" value="취소"/>
	</form>
</body>
</html>
