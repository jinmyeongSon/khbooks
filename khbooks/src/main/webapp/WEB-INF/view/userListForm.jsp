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
<link rel="stylesheet" href="css/adminList.css">
<script type="text/javascript">
	var searchKey='';
	var searchWord='';
	var currentPage='';
	$(document).ready(function() {
		searchKey='${adto.searchKey}';
		searchWord='${adto.searchWord}';
		currentPage='${adto.currentPage}';
	});
	$(document).on('click', '#update', function() {
		var id=$(this).parent().attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("userUpdateForm.kh?id="+id+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	});
	$(document).on('click', '#delete', function() {
		var id=$(this).parent().attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("userDelete.kh?id="+id+"&currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
	});
	$(document).on('click', '.userMovePage', function() {
		currentPage=$(this).attr('id');
		$('#managePlace').empty();
		$('#managePlace').load("userList.kh?currentPage="+currentPage+"&searchKey="+searchKey+"&searchWord="+searchWord);
		return false;
	});
</script>

</head>
<body>
	<table style="width: 1150px;">
		<tr>
			<th>id</th>
			<th>upass</th>
			<th>uname</th>
			<th>uemail</th>
			<th>uphone</th>
			<th>ubirth</th>
			<th>ugender</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${uList}" var="dto">
			<tr >
				<th>${dto.id}</th>
				<th>${dto.upass}</th>
				<th>${dto.uname}</th>
				<th>${dto.uemail}</th>
				<th>${dto.uphone}</th>
				<th>${dto.ubirth}</th>
				<th>${dto.ugender}</th>
				<th id="${dto.id}"><button id="update">수정</button></th>
				<th id="${dto.id}"><button id="delete">삭제</button></th>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">
    	<ul>
    		<c:choose>
    			<c:when test="${adto.currentPage==1}">
               		<li class="active"><a class="userMovePage" id="1">Prev</a></li>
               	</c:when>
				<c:when test="${adto.startPage==1}">
               		<li><a class="userMovePage" id="1">Prev</a></li>
               	</c:when>
               	<c:otherwise>
               		<li><a class="userMovePage" id="${adto.startPage-1}">Prev</a></li>
               	</c:otherwise>
               	</c:choose>
               	<c:forEach var="i" begin="${adto.startPage}" end="${adto.endPage}" step="1" >
               		<c:choose>
               			<c:when test="${i == adto.currentPage}">
               				<li class="active">
               			</c:when>
               			<c:otherwise>
               				<li>
               			</c:otherwise>
               		</c:choose>
               		<a class="userMovePage" id="${i}">${i}</a></li>
               	</c:forEach>
               	<c:choose>
               	<c:when test="${adto.currentPage==adto.endPage}">
               		<li class="active"><a class="userMovePage" id="${adto.endPage}">Next</a></li>
               	</c:when>
               	<c:when test="${adto.endPage==adto.totalPage}">
               		<li><a class="userMovePage" id="${adto.endPage}">Next</a></li>
               	</c:when>
               	<c:otherwise>
               		<li><a class="userMovePage" id="${adto.endPage+1}">Next</a></li>
               	</c:otherwise>
			</c:choose>
		</ul>
    </div>
</body>
</html>
