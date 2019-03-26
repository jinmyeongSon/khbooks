<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet" href="css/_button-group.css">
<link rel="stylesheet" href="css/_buttons.css">




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
<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script src="js/bootstrap.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#userManage').on("click", userManage);
		$('#bookManage').on("click", bookManage);
		$('#bookInsert').on("click", bookInsert);
		$('#authorManage').on("click", authorManage);
		$('#authorInsert').on("click", authorInsert);
	});
	
	// user list 불러오기
	function userManage() {
		$('#managePlace').empty();
		$('#managePlace').load("userList.kh");
		return false;
	}
	
	// book list 불러오기
	function bookManage() {
		$('#managePlace').empty();
		$('#managePlace').load("bookList.kh");
		return false;
	}
	
	// book insert form 만들어주기
	function bookInsert() {
		$('#managePlace').empty();
		$('#managePlace').load("bookInsertForm.kh");
		return false;
	}

	// author list 불러오기
	function authorManage() {
		$('#managePlace').empty();
		$('#managePlace').load("authorList.kh");
		return false;
	}
	
	// author insert form 만들어주기
	function authorInsert() {
		$('#managePlace').empty();
		$('#managePlace').load("authorInsertForm.kh");
		return false;
	}

</script>

</head>
<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
      <div class="row header"><!-- Begin Header -->
      
        <!-- Logo
        ================================================== -->
        <div class="span6 logo">
        	<a href="index.htm" style="width: 300px;"><img src="img/khbooks_logo.png" alt="for every novel" style="padding-right: 0px;"/></a>
            <h5 style="color: #333333; font-size: 25px;">For every Novel </h5>
        </div>
        
        <!-- Main Navigation
        ================================================== -->
        <div class="span6 navigation">
        	<div class="login area" style="float: right; height: 30px; margin-bottom: 15px;">
        		<c:choose>
        			<c:when test="${sessionScope.id==null}">
        				<a href="loginForm.kh" style="text-decoration: none;">
        				<button class="btn" type="button" style="padding: 4px 6px; margin-right: 5px;" id="loginBtn">로그 인</button>
        				</a>
        				<a href="signUp.kh" style="text-decoration: none;">
        				<button class="btn" type="button" style="padding: 4px 6px; margin-right: 4px;" id="regiBtn">회원 가입</button>
        				</a>
        			</c:when>
        			<c:otherwise>
        				<button class="btn" type="button">회원 정보</button>
        			</c:otherwise>
        		</c:choose>
        	</div>
        	
            <div class="navbar hidden-phone" style="clear: both;">
            <ul class="nav">
            <li><a href="index.htm" style=" font-weight: bold; font-size: 15px;">메인</a></li>
           	<li class="active"><a href="features.htm" style=" font-weight: bold; font-size: 15px;">작품</a></li>
            <li class="dropdown"><a href="page-full-width.htm" style=" font-weight: bold; font-size: 15px;">게시판 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="noticeList.kh" style=" font-weight: bold; font-size: 13px;">공지 사항</a></li>
                    <li><a href="boardList.kh" style=" font-weight: bold; font-size: 13px;">자유 게시판</a></li>
                </ul>
             </li>
          	<li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="blog-style1.htm" style=" font-weight: bold; font-size: 15px;">문의하기 
                <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="blog-style1.htm" style=" font-weight: bold; font-size: 13px;">자주 묻는 질문</a></li>
                    <li><a href="blog-style2.htm" style=" font-weight: bold; font-size: 13px;">FAQ</a></li>
                </ul>
             </li>
             <c:choose>
             	<c:when test="${sessionScope.id==''}">
             		<li><a href="loginForm.kh" style=" font-weight: bold; font-size: 15px;">로그인</a></li>
             	</c:when>
             	<c:otherwise>
             		<li class="dropdown">
	                <a class="dropdown-toggle" data-toggle="dropdown" href="memberInfor.kh" style=" font-weight: bold; font-size: 15px;">회원 정보 
	                <b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                    <li><a href="favBookList.kh" style=" font-weight: bold; font-size: 13px; width: 80px;">나의 관심 작품</a></li>
	                    <li><a href="blog-style2.htm" style=" font-weight: bold; font-size: 13px;">나의 관심 작가</a></li>
	                </ul>
            	 </li>
             	
             	</c:otherwise>
             
             </c:choose>

            </ul>
   
            
            
           
            </div>
        </div>

      </div><!-- End Header -->
     
    <!-- Blog Content
    ================================================== --> 
    <div class="row">
		<div class ="check">
			<ul id="filterOptions" class="gallery-cats clearfix" style="margin-bottom: 10px;"> 
               	<li><a href="#" id="userManage">유저 관리</a></li>
               	<li><a href="#" id="bookManage">작품 관리</a></li>
               	<li><a href="#" id="authorManage">작가 관리</a></li>
               	<li><a href="#" id="bookInsert">작품 등록</a></li>
               	<li><a href="#" id="authorInsert">작가 등록</a></li>
           	</ul>
		</div>
    	<div style="float:left; width: 99%; height: 700px; background-color: #d8450b; margin: 0px 0px 20px 10px;" id="managePlace">
    		
    	</div>
    </div>
    </div>

    <!-- Footer Area
        ================================================== -->
	<div class="footer-container" style="clear: both;"><!-- Begin Footer -->
    	<div class="container">
        	<div class="row footer-row">
                <div class="span3 footer-col">
                    <h5>About Us</h5>
                   <img src="img/piccolo-footer-logo.png" alt="Piccolo" /><br /><br />
                    <address>
                        <strong>Design Team</strong><br />
                        123 Main St, Suite 500<br />
                        New York, NY 12345<br />
                    </address>
                    <ul class="social-icons">
                        <li><a href="#" class="social-icon facebook"></a></li>
                        <li><a href="#" class="social-icon twitter"></a></li>
                        <li><a href="#" class="social-icon dribble"></a></li>
                        <li><a href="#" class="social-icon rss"></a></li>
                        <li><a href="#" class="social-icon forrst"></a></li>
                    </ul>
                </div>
                <div class="span3 footer-col">
                    <h5>Latest Tweets</h5>

                </div>
                <div class="span3 footer-col">
                    <h5>Latest Posts</h5>
                     <ul class="post-list">
                        <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                        <li><a href="#">Consectetur adipiscing elit est lacus gravida</a></li>
                        <li><a href="#">Lectus sed orci molestie molestie etiam</a></li>
                        <li><a href="#">Mattis consectetur adipiscing elit est lacus</a></li>
                        <li><a href="#">Cras rutrum, massa non blandit convallis est</a></li>
                    </ul>
                </div>
                <div class="span3 footer-col">
                    <h5>Flickr Photos</h5>
                    <ul class="img-feed">
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                        <li><a href="#"><img src="img/gallery/flickr-img-1.jpg" alt="Image Feed"></a></li>
                    </ul>
                </div>
            </div>

            <div class="row"><!-- Begin Sub Footer -->
                <div class="span12 footer-col footer-sub">
                    <div class="row no-margin">
                        <div class="span6"><span class="left">Copyright 2012 Piccolo Theme. All rights reserved.</span></div>
                        <div class="span6">
                            <span class="right">
                            <a href="#">Home</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Gallery</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Blog</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">Contact</a>
                            </span>
                        </div>
                    </div>
                </div>
            </div><!-- End Sub Footer -->

        </div>
    </div><!-- End Footer -->

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>