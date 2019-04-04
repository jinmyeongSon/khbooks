<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<a href="helpMain.do">보드</a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('50742c997666074c6366ef280ae6e6f2');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({ 
    	container: '#kakao-login-btn', 
    	success: function(authObj) { 
    		alert(JSON.stringify(authObj)); 
    	},
    	fail: function(err) { 
    		alert(JSON.stringify(err)); 
    	}
    })
	
    $(document).ready(function(){
    	$('#kakao-login-btn').on('click', function(){
    		Kakao.Auth.login({
    			success: function(authObj){
    				alert(authObj);
    				alert(JSON.stringify(authObj));
    				Kakao.API.request({
    					url:'/v2/user/me',
    					success: function(res){
    						alert(res.id);
    						alert(JSON.stringify(res));
    					}
    				});
    			}
    		});
    	});
    });
  //]]>
</script>



</body>
</html>