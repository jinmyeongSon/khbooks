<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="ajaxsrc/jquery01.js"></script>
</head>
<body>
<div class="comment-form-container">
                    <h6>Leave a Comment</h6>
                    <form action="commentInsert.kh" method="post" id="comment-form">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span>
                            <c:choose>
                            	<c:when test="${empty bdto.id }">
                           		 	<input class="span4" id="prependedInput" size="16" type="text" placeholder="로그인 후 이용해주세요" disabled>
                            	</c:when>
                            	<c:otherwise>
                            	    <input class="span4" id="prependedInput" size="16" type="text" value="${bdto.id }" readonly>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                       <textarea class="span6" placeholder="댓글을 입력해주세요"></textarea>     
                        <div class="row">
                            <div class="span2">
                                <input type="submit" class="btn btn-inverse" id="addComment" value="입력">
                            </div>
                        </div>
                    </form>
                </div>
</body>
</html>