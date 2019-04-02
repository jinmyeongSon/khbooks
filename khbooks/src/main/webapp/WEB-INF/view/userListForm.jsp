<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>KH BOOKs</title>
<link rel="stylesheet" href="css/adminList.css">
<script type="text/javascript">
	$(document).ready(function() {
		searchKey='${adto.searchKey}';
		searchWord='${adto.searchWord}';
		currentPage='${adto.currentPage}';
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
    <select style="margin-left: 350px; margin-bottom: 0px; width:100px;" id="searchKey" name="searchKey">
	    	<option value="id">아이디</option>
	    	<option value="uname">이름</option>
	    	<option value="uemail">이메일</option>
	</select>
	<input style="margin-bottom: 0px;" type="text" id="searchWord" name="searchWord" placeholder="검색어 입력" />
	<button id="userSearch">검색</button>
</body>
</html>
