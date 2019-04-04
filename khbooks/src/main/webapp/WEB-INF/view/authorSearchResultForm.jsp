<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:forEach items="${aList}" var="dto">
		<p id="${dto.auno}">${dto.auno} / <a id="authorAdd">${dto.auname}</a></p>
	</c:forEach>
</body>
</html>