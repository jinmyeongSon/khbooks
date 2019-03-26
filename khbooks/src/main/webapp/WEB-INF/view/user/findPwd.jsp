<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- JS
================================================== -->
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>

</head>
<body>
<form action="sendMail/password.kh" method="post">
    <fieldset>
        <legend class="screen_out">비번 찾기 폼</legend>
 
 		<div class="box id">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" autofocus autocomplete="off" required />
        </div>
        <div class="box email">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" autofocus autocomplete="off" required />
        </div>
        
            <input type="submit" class="btn join">
                  ${resultMsg}

        
        <!-- // .box.btn -->
    </fieldset>
</form>
 

</body>
</html>