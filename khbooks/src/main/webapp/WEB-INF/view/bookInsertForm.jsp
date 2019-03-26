<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
	$(document).ready(function(){
		/* //내pc 첨부파일 시작
		var userfile='';
		$('#userpc').on('click', function(){
			userfile=$('<input type="file" id="userfile" />');
			userfile.click();
			userfile.change(function(){
				console.log($(userfile[0]).val());
				var partname=$(userfile[0]).val().substring($(userfile[0]).val().lastIndexOf("\\")+1);
				console.log("partname",partname);
				var str='<p><input type="checkbox"/>'+partname+'</p>';
				$('.fileDrop').empty(); //초기화
				$('.fileDrop').append(str);
				fileList=userfile[0].files[0];
			});
		}); //내pc 첨부파일 끝
		
		//첨부파일 드래그 시작
		var obj=$('.fileDrop');
		
		obj.on('dragover', function(e){
			e.preventDefault();
			$(this).css('border', '2px solid #0B85A1');
		});
		
		obj.on('drop', function(e){
			e.preventDefault();
			$(obj).empty();
			var files=e.originalEvent.dataTransfer.files;
			obj.append('<p><input type="checkbox" />'+files[0].name+'</p>');
			fileList=files[0];
		}); //첨부파일 드래그 끝
		
		//첨부파일 삭제 시작
		$(document).on('click', '.fileDrop input', function(){
			$(this).parent().remove();
			fileList='';
		}); //첨부파일 삭제 끝 */
		$('#addBook').on('click', function() {
			var form = $(this).closest('form');
			var form_data = new FormData(form[0]);
			$.ajax({
				type : 'POST',
				dataType : 'text',
				url : form.attr('action'),
				data : form_data,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(res) {
					$('#managePlace').empty();
					$('#managePlace').html(res);
				}
			});
			return false;
		});
	});//end ready
</script>

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