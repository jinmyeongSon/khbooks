<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<form action="bookInsert.kh" action="post">
			<div class="row">
				<div>
				<label>제목</label>
					<input type="text" id="title" name="title" placeholder="제목" required>
				</div>
				
				<div>
				<label>장르</label>
					<div id="styled-select">   
					    <select name="group" id="group">
					        <option val="">Please choose</option>
					        <option val="1">Option 1</option>
					        <option val="2">Option 2</option>
					        <option val="3">Option 3</option>
					        <option val="4">Option 4</option>
					    </select>   
					</div>  
					
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="ugender" value=1>
						<label class="form-check-label" for="inlineRadio1">남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="ugender" value=2>
						<label class="form-check-label" for="inlineRadio2">여</label>
					</div>
				</div>
				<label>소개글</label>
					<textarea rows="5" cols="80"></textarea>
				</div>
				<br/>
				<input type="submit" value="등록"> 
				
			
	</form>
</body>
</html>