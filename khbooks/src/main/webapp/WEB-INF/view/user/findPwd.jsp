<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH BOOKs FindPassWord</title>
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
<form id="sendPwdForm" action="sendMail/password.kh" method="post">
 
		<div id="" class="margin-center id-form">
	       	<div><p>비밀번호 찾기</p></div>
	       	<hr>
	       	<span class="align-center badge badge-info">입력하신 이메일로 임시 비밀번호가 전송됩니다.</span>
	        <div class="form-group">
			  <input type="text" class="form-control" id="id" name="id" autofocus placeholder="아이디" required>
			</div>
	        <div class="form-group">
			  <input type="email" id="email" name="email" class="form-control" aria-describedby="emailHelp" placeholder="이메일을 입력하세요" required>
			</div>
			  <button type="submit" id="sendPwd" class="btn btn-outline-secondary">보내기</button>
			  
		</div>
  
</form>

 

</body>
</html>