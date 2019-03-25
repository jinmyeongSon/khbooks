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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!--<link rel="stylesheet" href="css/custom-styles.css">-->


<!-- Favicons -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>



</head>

<body>
	<form role="form" action="loginPost.kh" method="post">
		<div class="box-body">
			<div class="form-group">
				<input type="text" id="id"
					name="id" class="form-control" placeholder="User ID..."/>
			</div>

			<div class="form-group">
				<input type="password" name="upwd" id="upwd"
					class="form-control" placeholder="Password..."/>
			</div>
			
			<div class="form-group">
			     <label for="useCookie">
			         <input type="checkbox" id="rememberId" name="rememberId" value="true" /> Rememeber Me
			     </label>
			</div>
		
		</div> <!-- end of box-body -->
		
		<div class="box-footer">
		  <button type="submit" class="btn btn-primary">Sign In</button>
		</div>
		<div class="box-footer">
		   <a href="findIdForm.kh">아이디/비밀번호 찾기</a>
		</div>

	</form>
	 <a href="${naver_url}"></a>
	 
	 
	 
	<div class="text-center">
	  <div id="naver_id_login"></div>
	  
	</div>


</body>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("Fl00fuSEpWs8hOdJ0F2n", "http://xn--24-he3kz3o.com/callback.php");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 2,40);
	naver_id_login.setDomain("http://localhost:8090");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	
</script>
</html>
