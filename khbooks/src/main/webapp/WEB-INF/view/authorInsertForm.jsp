<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="wrapper">
		<form action="authorInsert.kh" method="post" id="frm">
			<table>
				<tr>
					<th>이름  </th>
					<td><input type="text" id="title" name="auname" required></td>
				</tr>
				<tr>
					<th>소개글  </th>
					<td><textarea rows="5" cols="100" name="auintro" required></textarea></td>
				</tr>
				<tr>
					<td><input type="button" name="submit" id="addAuthor" value="등록"> </td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>