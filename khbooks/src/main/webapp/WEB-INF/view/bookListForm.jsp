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
			<th>bname</th>
			<th>bupdate</th>
			<th>bgrade</th>
			<th>bview</th>
			<th>bthumb</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${bList}" var="dto">
			<tr >
				<th>${dto.bname}</th>
				<th>${dto.bupdate}</th>
				<th>${dto.bgrade}</th>
				<th>${dto.bview}</th>
				<th>${dto.bthumb}</th>
				<th id="${dto.bno}"><button id="detail">상세보기</button></th>
				<th id="${dto.bno}"><button id="bdelete">삭제</button></th>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">
    	<ul>
    		<c:choose>
    			<c:when test="${adto.currentPage==1}">
               		<li class="active"><a class="movePage" id="1">Prev</a></li>
               	</c:when>
				<c:when test="${adto.startPage==1}">
               		<li><a class="movePage" id="1">Prev</a></li>
               	</c:when>
               	<c:otherwise>
               		<li><a class="movePage" id="${adto.startPage-1}">Prev</a></li>
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
               		<a class="movePage" id="${i}">${i}</a></li>
               	</c:forEach>
               	<c:choose>
               	<c:when test="${adto.currentPage==adto.endPage}">
               		<li class="active"><a class="movePage" id="${adto.endPage}">Next</a></li>
               	</c:when>
               	<c:when test="${adto.endPage==adto.totalPage}">
               		<li><a class="movePage" id="${adto.endPage}">Next</a></li>
               	</c:when>
               	<c:otherwise>
               		<li><a class="movePage" id="${adto.endPage+1}">Next</a></li>
               	</c:otherwise>
			</c:choose>
		</ul>
    </div>
    <select style="margin-left: 350px; margin-bottom: 0px; width:100px;" id="searchKey" name="searchKey">
	    	<option value="bname">이름</option>
	    	<option value="binfo">소개글</option>
	</select>
	<input style="margin-bottom: 0px;" type="text" id="searchWord" name="searchWord" placeholder="검색어 입력" />
	<button id="bookSearch">검색</button>
</body>
</html>
