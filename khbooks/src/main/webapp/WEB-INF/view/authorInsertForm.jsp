<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

input[type=text], select {
  width: 30%;
  height: 30px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #1398c6;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #73c5e2;
}

#wrapper {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
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