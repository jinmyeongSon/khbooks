<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>KH BOOKs Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>

<body>
<!-- header -->
	<div class="container" style="margin-top: 20px;">
		<div style="text-align: center;">
		 	<a href="http://localhost:8090/khbook/index.kh"> <h2>KH BOOKs</h2> </a>
		</div>
	</div>
	
<hr />

<!-- https://to-dy.tistory.com/35 -->


<div class="container" style="width:300px; margin-top:300px; border: 2px solid #008CBA;">
	<form role="form" action="adminLoginCheck.kh" method="post">
		<div class="box-body">
			<div style="padding-bottom:20;">
				<div class="form-group">
					<input type="text" id="id"
						name="id" class="form-control" placeholder="Admin ID..."/>
				</div>
				<div class="form-group">
					<input type="password" name="pass" id="pass"
						class="form-control" placeholder="Password..."/>
				</div>
				
			 	 <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
			</div>
		</div> <!-- end of box-body -->
	</form>
	 <br/>
</div>

</body>
</html>
