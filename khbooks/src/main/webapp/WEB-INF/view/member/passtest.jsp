<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

</script>

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">
<style type="text/css">

#mem{
margin-left:450px;
margin-top:100px;
}

</style>
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]--> 

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#contact-form').on('submit',function(){
		var pass=$('#prependedInput').val();
		var rpass=$('#rpass').val();
		if(pass==rpass){
			$('#contact-form').attr("action","updateForm.kh");
		}else{
			alert('비밀번호가 잘못됐습니다.')
			return false;
		}
	});
});

</script>

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    <!-- header -->
    	<jsp:include page="../khbooks_header.jsp"></jsp:include>
    
     
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->

        <div class="span4 contact" id="mem"><!--Begin page content column-->

            <h2>비밀번호 확인</h2>
            <p>회원 정보를 수정하기 위해서는 비밀번호를 입력해야 합니다.</p>


            <form action="#" id="contact-form" method="GET">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-user"></i></span>
                    <input class="span4" id="prependedInput" size="16" type="password" placeholder="password" name="pass">
                </div>
                <input type="hidden" name="id" value="${dto.id }"/>
                <input type="hidden" id="rpass" value="${dto.upass }"/>
                <div class="row">
                    <div class="span2">
                        <input type="submit" class="btn btn-inverse" value="입력 완료" id="psubmit">
                    </div>
                </div>
            </form>

        </div> <!--End page content column-->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->

	<jsp:include page="../khbooks_footer.jsp"/>


    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>