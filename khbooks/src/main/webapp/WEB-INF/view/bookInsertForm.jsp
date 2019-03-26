<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
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

div {
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
	
		//내pc 첨부파일 시작
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
		}); //첨부파일 삭제 끝
		
	});//end ready
	
	function formCheck() {
		var target = document.getElementById("genre");
		 alert(target.options[target.selectedIndex].value);
	}
</script>

</head>
<body>
	<form action="bookInsert.kh" action="post" onsubmit="return formCheck()">
			<div>
				<tr>
				<th>제목  </th>
					<td><input type="text" id="title" name="bname" required></td>
				</tr>
				
				<tr>   
				<th>장르  </th>
				<td>
				    <select id="genre" name="gno">
				        <option value="1">SF</option>
				        <option value="2">판타지</option>
				        <option value="3">무협</option>
				        <option value="4">로맨스</option>
				        <option value="5">스포츠</option>	
				        <option value="6">퓨전</option>
				        <option value="7">게임</option>
				        <option value="8">밀리터리</option>
				        <option value="9">기타</option>
				    </select>   
				</td>
				</tr>
				<th>소개글  </th><br />
					<td><textarea rows="5" cols="100" name="binfo" required></textarea></td>
				
				<br/>
				<span id="userpc" style="cursor:pointer">내PC</span>
				<div class='fileDrop' name="bthumb"></div>
		  		
	  
				<br/>
				
				<input type="submit" name="submit" value="등록"> 
				
			</div>
	</form>
</body>
</html>