<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">

<style type="text/css">

#mem{
width:600px;
margin-left:150px;
font-size:20px;
}
#updatebtn{
margin-left:140px;
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
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.quicksand.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#updatebtn').on('click',function(){
		var pass = $('#upass').val();
		var pass2= $('#upass2').val();
		var email= $('#uemail').val();
		
		if(pass=='' || pass2==''){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		if(pass.length<9 || pass2.length<9){
			alert("비밀번호를 8자리 이상 입력해주세요.");
			return false;
		}    
		if(email.indexOf('@')==-1){
			alert('이메일 형식이 아닙니다.');
			return false;
		}
		
		if(pass==pass2){
			$('form').attr("action","update.kh");
			$('form').submit();
			alert('수정완료 ');
		}else{
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
	});
	$('#deletebtn').on('click',function(){
		var del=confirm("정말 탈퇴 하시겠습니까 ?");
		if(del){
			$('form').attr("action","delete.kh");
			$('form').submit();
		}else{
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

        <div class="span8 contact" id="mem"><!--Begin page content column-->
                    <form method="GET" >
                    <h2>회원정보수정</h2>
                   
                    <table id="table">
                    	<tr>
                    		<td>아이디</td>
                    		<td><input class="span4"  type="text" value="${dto.id}" name="id" readonly/></td>
                    	</tr>   
                    	<tr>
                    		<td>이름</td>
                    		<td><input class="span4"  type="text" value="${dto.uname}" name="uname"/></td>
                    	</tr>  
                    	<tr>
                    		<td>비밀번호</td>
                    		<td><input class="span4" id="upass" type="password" name="upass" /></td>
                    	</tr>  
                    	<tr>
                    		<td>비밀번호 확인</td>
                    		<td><input class="span4" id="upass2" type="password"/></td>
                    	</tr>  
                    	<tr>
                    		<td>이메일</td>
                    		<td><input class="span4" id="uemail" name="uemail" type="text" value="${dto.uemail}"  /></td>
                    	</tr>  
                    	<tr>
                    		<td>연락처</td>
                    		<td><input class="span4" name="uphone" type="text" value="${dto.uphone }"/></td>
                    	</tr>  
                    	<tr>
                    		<td>생년월일</td>
                    		<td><input class="span4" id="udate" name="udate" type="text" value="${dto.ubirth }" readonly/></td>
                    	</tr>  
                    	<tr>
                    		<td>성별</td>
                    		<td><input class="span4" id="ugender" name="ugender" type="text" value="<c:choose><c:when test="${dto.ugender==1 }">남자 </c:when><c:otherwise>여자</c:otherwise>
                        </c:choose>" readonly/></td>
                    	</tr>  
                    </table>
                   
                    <button class="btn btn-inverse pull-left" id="updatebtn" type="button">수정 완료</button>
                    <button class="btn btn-inverse pull-left" id="deletebtn" type="button" style="margin-left:20px;">회원 탈퇴</button>
                    </form>
                    </div>
                    
           

        <!-- Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar"id="ca"><!-- Begin sidebar column -->
             <h5 class="title-bg">Categories</h5>
            <ul class="post-category-list">
                <li><a href="http://localhost:8090/khbook/memberInfor.kh"><i class="icon-plus-sign"></i>회원정보</a></li>
                <li><a href="http://localhost:8090/khbook/favAuthorList.kh"><i class="icon-plus-sign"></i>관심작가</a></li>
                <li><a href="http://localhost:8090/khbook/favBookList.kh"><i class="icon-plus-sign"></i>관심작품</a></li>

            </ul>
        </div><!-- End sidebar column -->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

	
	<jsp:include page="../khbooks_footer.jsp"/>
	

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>
