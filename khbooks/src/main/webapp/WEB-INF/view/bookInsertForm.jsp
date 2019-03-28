<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.fileDrop{
	width: 500px;
	height: 30px;
	border: 1px solid #ccc;
	overflow: auto;
} 
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<div id="wrapper">
		<form action="bookInsert.kh" method="post" enctype="multipart/form-data" id="frm">
			<table>
				<tr>
					<th>제목  </th>
					<td><input type="text" id="title" name="bname" required></td>
				</tr>
				<tr>   
					<th>장르  </th>
					<td>
					    <select id="genre" name="gno">
						    <c:forEach items="${gList}" var="dto">
						    	<option value="${dto.gno}">${dto.gname}</option>
						    </c:forEach>
					    </select>   
					</td>
				</tr>
				<tr>
					<th>소개글  </th>
					<td><textarea rows="5" cols="100" name="binfo" required></textarea></td>
				</tr>
				<tr>
					<th width="20%" align="center">첨부파일</th>
					<td><input type="file" name="file" id="filepath"/>
				</tr>
				<tr>
					<td><input type="button" name="submit" id="addBook" value="등록"> </td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>