<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>KH BOOKs</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]-->

<!-- Favicons
================================================== -->

<!-- JS
================================================== -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script type="text/javascript">	
	  //네아로--------------------------------------------------------------------------------------------------
	  var naver_id_login = new naver_id_login("Fl00fuSEpWs8hOdJ0F2n", "http://localhost:8090/khbook/index.kh");
	  // 접근 토큰 값 출력
	  //alert(naver_id_login.oauthParams.access_token);
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	  function naverSignInCallback() {
		var email = naver_id_login.getProfileData('email');
		var gender =naver_id_login.getProfileData('gender');
		var name =naver_id_login.getProfileData('name');
	    opener.location.href='http://localhost:8090/khbook/index-naver2.kh?email='+email+'&gender='+gender+'&name='+name;
	    alert(email);
	    alert(gender);
	    window.close();
	  	}
</script>

</head>
<body>

</body>
</html>
