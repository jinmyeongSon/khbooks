<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<style type="text/css">
#wrap::-webkit-scrollbar { 
    display: none; 
}
#wrap{
	overflow: scroll;
	height: 400px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div style="height: 270px;">
		<div style="width: 17%; height: 100%; float:left; padding-top: 10px; padding-left: 10px;">
			<img src="test/book.png" style="width: 110px; height: 150px;" alt="책 표지" />
		</div>
		<div style="width:50%;height: 100%;float:left; padding-top: 10px;">
			<input type="hidden" value="${book.bno}" name="bno" id="bno" />
			<label style="display: inline;" for="bname">제목&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${book.bname}" name="bname" id="bname" /></label>
			<label style="display: inline;" for="bdate">연재일&nbsp;<input type="date" value="${book.bupdate}" readonly="readonly" id="bdate" /></label>
			<br/><label style="display: inline;" for="binfo">소개글&nbsp;<input type="text" value="${book.binfo}" name="binfo" id="binfo" /></label>
			<label style="display: inline;" for="bthumb">표지&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" id="bthumb"></label>
			<br/>장르&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="genre" name="gno">
				<c:forEach items="${gList}" var="dto">
					<c:choose>
						<c:when test="${dto.gno == book.gno}">
							<option value="${dto.gno}" selected="selected">${dto.gname}</option>
						</c:when>
						<c:otherwise>
							<option value="${dto.gno}">${dto.gname}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select><br/>
			<button id="bookUpdate">수정하기</button><button id="newSerial">새 화 추가</button>
		</div>
		<div id="wrap" style="width:30%;height: 100%;float:left; padding-top: 10px;">
			작가<br/>
			<c:forEach items="${book.aList}" var="adto">
				<input style="width: 10%; margin-bottom: 0px;" type="text" value="${adto.auno}" readonly="readonly" />
				<input style="width: 30%; margin-bottom: 0px;" type="text" value="${adto.auname}" readonly="readonly" />
				<button id="authorDel">삭제하기</button><br/>
			</c:forEach>
			<br/><button id="bookAuthor">작가 추가</button>
		</div>
	</div>
	<div id="wrap" style="clear: both;">
		<c:set var="count" value="${fn:length(sList)}"/>
		<c:forEach items="${sList}" var="serial" varStatus="index">
			<li id="${serial.upno}" style="list-style:none; line-height:35px;  width: 96%; margin-left: 2%;  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; border-bottom: 1px dashed #a9a9a9;  padding-top: 4px;clear: both;">
				<c:out value="${count-index.index}"/>. ${serial.stitle} 파일명:${serial.scontent}
				<button id="sdelete" style="float: right;">삭제</button><button id="supdate" style="float: right;">수정</button>
			</li>
		</c:forEach>
	</div>

    <div class="modal hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
        	<input type="hidden" id="updateNo">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="modalCancel">×</button>
            <h5 id="myModalLabel">수정하기</h5>
        </div>
        <div class="modal-body">
            <label for="updateTitle">제목 입력</label><input type="text" id="updateTitle"><br/>
            <label for="updateFile">파일 첨부</label><input type="file" id="updateFile">
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true" id="modalCancel">취소</button>
            <button class="btn btn-inverse" id="saveUpdate" data-dismiss="modal" aria-hidden="true">수정사항 저장</button>
        </div>
    </div>
    
    <div class="modal hide fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="modalCancel">×</button>
            <h5 id="myModalLabel">추가하기</h5>
        </div>
        <div class="modal-body">
            <label for="serialTitle">제목 입력</label><input type="text" id="serialTitle"><br/>
            <label for="price">가격 입력</label><input type="text" id="price"><br/>
            <label for="serialFile">파일 첨부</label><input type="file" id="serialFile">
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true" id="modalCancel">취소</button>
            <button class="btn btn-inverse" id="serialIns" data-dismiss="modal" aria-hidden="true">추가</button>
        </div>
    </div>
    
    <div class="modal hide fade" id="authorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="modalCancel">×</button>
            <h5 id="myModalLabel">작가 추가</h5>
        </div>
        <div class="modal-body">
            <input style="margin-bottom: 0px;" type="text" id="searchWord" name="searchWord" placeholder="작가 이름 입력" /><button id="authSearch">검색</button>
            <div id="searchRes"></div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true" id="modalCancel">취소</button>
        </div>
    </div>
</body>
</html>