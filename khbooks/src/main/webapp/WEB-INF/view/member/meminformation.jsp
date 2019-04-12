<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<style type="text/css">
#ca{
margin-left:140px;
}
#mem{
margin-left:320px;
font-size:20px;
}
#nextbtn{
margin-left:140px;
}
</style>
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">

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
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.quicksand.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	var id = '${sessionScope.id}';
	if(id==''){
		alert('로그인을 해주세요.');
		location.href="loginForm.kh";
	}
	$('#nextbtn').on('click',function(){
		$('form').attr("action","passtest.kh");
		$('form').submit();
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

        <div class="span4 contact" id="mem" style="margin-left: 270px; margin-right: 50px; margin-bottom: 20px;"><!--Begin page content column-->
                   <form method="post">
                    <h2>회원정보</h2>
                   
                    <ul class="project-info">
                    <input type="hidden" value="${dto.id }" name="id" id="name"/>
                        <li><h5>아이디:</h5> ${dto.id }</li>
                        <li><h5>이름:</h5> ${dto.uname }</li>
                        <li><h5>이메일:</h5> ${dto.uemail }</li>
                        <li><h5>연락처:</h5> ${dto.uphone }</li>
                        <li><h5>생일:</h5> ${dto.ubirth }</li>
                        <li><h5>성별:</h5><c:choose>
                        <c:when test="${dto.ugender==1 }">
                        	남자
                        </c:when>
                        <c:otherwise>
                        	여자
                        </c:otherwise>
                        </c:choose></li>
                    </ul>
                   
                    <button class="btn btn-inverse pull-left" id="nextbtn" type="button">정보 수정</button>
                    </form>
                    </div>
                    
           

        <!-- Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar" id="ca"><!-- Begin sidebar column -->
             <h5 class="title-bg">Categories</h5>
            <ul class="post-category-list">
                <li><a href="memberInfor.kh"><i class="icon-plus-sign"></i>회원정보</a></li>
                <li><a href="favAuthorList.kh"><i class="icon-plus-sign"></i>관심작가</a></li>
                <li><a href="favBookList.kh"><i class="icon-plus-sign"></i>관심작품</a></li>
            </ul>
        </div><!-- End sidebar column -->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

	
	<jsp:include page="../khbooks_footer.jsp"/>
	

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>
