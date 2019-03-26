<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>KH BOOKs Login</title>

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
	
	$("#login_btn").click(function(){
		var uid = $("#id").val();
		var upw = $("#upass").val();
		
		if(uid == ""){
			alert("아이디를 입력하세요");
			$("#id").focus();
			return;
		}
		if(upw == ""){
			alert("비밀번호를 입력하세요");
			$("#upass").focus();
			return;
		}
		if($("$fail")){
			alert("비밀번호가 틀렸습니다.")
			return;
		}

		document.form.submit();
	});
	
	
	//cookie
    var id = getCookie("id");
    $("input[id='id']").val(id); 
     
    if($("input[id='id']").val() != ""){ 
        $("#rememberId").attr("checked", true);
    }
     
    $("#rememberId").change(function(){ 
        if($("#rememberId").is(":checked")){
            var id = $("input[id='id']").val();
            setCookie("id", id, 7);
        }else{
            deleteCookie("id");
        }
    });


    $("input[id='id']").keyup(function(){
        if($("#rememberId").is(":checked")){
            var id = $("input[id='id']").val();
            setCookie("id", id, 7);
        }
    });
 
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null)?"":";expires="+exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }

});


</script>


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
	<form role="form" action="loginPost.kh" method="post">
		<div class="box-body">
			<div style="padding-bottom:20;">
				<div class="form-group">
					<input type="text" id="id"
						name="id" class="form-control" placeholder="User ID..." value="${sessionScope.id}"/>
				</div>
				<div class="form-group">
					<input type="password" name="upass" id="upass"
						class="form-control" placeholder="Password..."/>
				</div>
				
				<button type="submit" id="login_btn" class="btn btn-primary btn-lg btn-block">로그인</button>
				<div class="form-group">
			     <label for="useCookie">
			         <input type="checkbox" id="rememberId" name="rememberId" value="true" /><p style="font-size: 12px;display: inline-block;">아이디 기억</p>
			     </label>
		  			 <a href="http://localhost:8090/khbook/findId.kh">아이디</a>·<a href="http://localhost:8090/khbook/findPwd.kh">비밀번호 찾기</a>
					<c:if test="${msg == 'fail'}">
					<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
				</div>
				
				
			 	 
			</div>
		</div> <!-- end of box-body -->
	</form>
	<div class="text-center">
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
