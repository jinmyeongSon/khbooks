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
			<th>auno</th>
			<th>auname</th>
			<th>auintro</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${aList}" var="dto">
			<tr >
				<th>${dto.auno}</th>
				<th>${dto.auname}</th>
				<th>${dto.auintro}</th>
				<th id="${dto.auno}"><button id="aupdate">수정</button></th>
				<th id="${dto.auno}"><button id="adelete">삭제</button></th>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">
    	<ul>
    		<c:choose>
    			<c:when test="${adto.currentPage==1}">
               		<li class="active"><a class="authorMovePage" id="1">Prev</a></li>
               	</c:when>
				<c:when test="${adto.startPage==1}">
               		<li><a class="authorMovePage" id="1">Prev</a></li>
               	</c:when>
               	<c:otherwise>
               		<li><a class="authorMovePage" id="${adto.startPage-1}">Prev</a></li>
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
               		<a class="authorMovePage" id="${i}">${i}</a></li>
               	</c:forEach>
               	<c:choose>
               	<c:when test="${adto.currentPage==adto.endPage}">
               		<li class="active"><a class="authorMovePage" id="${adto.endPage}">Next</a></li>
               	</c:when>
               	<c:when test="${adto.endPage==adto.totalPage}">
               		<li><a class="authorMovePage" id="${adto.endPage}">Next</a></li>
               	</c:when>
               	<c:otherwise>
               		<li><a class="authorMovePage" id="${adto.endPage+1}">Next</a></li>
               	</c:otherwise>
			</c:choose>
		</ul>
    </div>
</body>
</html>
