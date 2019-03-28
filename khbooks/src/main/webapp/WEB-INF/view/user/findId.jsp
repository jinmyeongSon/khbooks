<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH BOOKs FindId</title>
<style type="text/css">
	.id-form{
		border-radius: 5px;
		border-style: solid;
		border-color: #5d5d5d;
		padding:15px;
		width:400px;
		margin-bottom: 5px;
		
	}
	
	.align-center {text-align: center;}
	.align-justify {text-align: justify;}
	.margin-center {
		margin-left:auto;
		margin-right:auto;
	}
	
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

</head>
<body>
<form  id="sendIdForm" action="sendMail/id.kh" method="post">
 
        <div id="" class="margin-center id-form">
        	<div><p>아이디 찾기</p></div>
        	<hr>
        	<span class="align-center badge badge-info">입력하신 이메일로 아이디가 전송됩니다.</span>
			<div class="input-group mb-3">
			  <input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력하세요" autofocus required>
			  <div class="input-group-append">
			    <button type="submit" id="sendId" class="btn btn-outline-secondary">보내기</button>
			  </div>
			</div>
		</div>
        
</form>
 

</body>
</html>