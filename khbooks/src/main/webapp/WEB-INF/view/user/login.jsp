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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	var id='${sessionScope.id}';
	if(id != ''){
		alert("잘못된 접근입니다.");
		history.go(-1);
	}
	
	var res='${resultMsg}'
	
	alert("${error}");
});
</script>


</head>

<body>
<!-- header -->
	<div class="container" style="margin-top: 20px; margin-left:30%; margin-right:30%; width: 40%;">
		<a href="index.htm" style="width: 300px; color: #333333; font-size: 25px; text-decoration: none;"><img src="img/khbooks_logo.png" alt="for every novel" style="padding-right: 0px;"/>
		For every Novel</a>
	</div>
	<hr/>

	<div class="container" style="width:300px; margin-top:100px; border: 2px solid #333333; padding-top:10px; padding-bottom:10px; ">
		<form role="form" action="loginPost.kh" method="post" >
			<div class="box-body" >
				<div style="padding-top:20px; padding-bottom:20;">
					<div class="form-group">
						<input type="text" id="id"
							name="id" class="form-control" placeholder="User ID..." value="${sessionScope.id}"/>
					</div>
					<div class="form-group">
						<input type="password" name="upass" id="upass"
							class="form-control" placeholder="Password..."/>
					</div>
					
					<div class="form-group">
				     <label for="useCookie">
				         <input type="checkbox" id="rememberId" name="rememberId" value="true" /> 로그인 유지
				     </label>
			  			 <a href="http://localhost:8090/khbook/findId.kh">아이디</a>·<a href="http://localhost:8090/khbook/findPwd.kh">비밀번호 찾기</a>
					</div>
				
			 	 <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
			</div>
		</div> <!-- end of box- body -->

	</form>
	 
	 	
	<div class="text-center" style="margin-top: 10px;" >
	  <div id="naver_id_login"></div>
	</div>
</div>

</body>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("Fl00fuSEpWs8hOdJ0F2n", "http://localhost:8090/khbook/index-naver.kh");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 2,40);
	naver_id_login.setDomain("http://localhost:8090");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	
</script>
</html>
