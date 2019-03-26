<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/prettyPhoto.css" />
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
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.quicksand.js"></script>
<script src="js/jquery.custom.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    <!-- header -->
    	<jsp:include page="khbooks_header.jsp"></jsp:include>
      
     
    <!-- Page Content
    ================================================== --> 
    <div class="row">

        <!-- Gallery Items
        ================================================== --> 
        <div class="span12 gallery-single">
            <div class="row">
                <div class="span6">
                <div style="width: 420px; margin-left: 100px">
                	<div style="width: 100%; height: 200px;">
                    <img src="img/gallery/gallery-img-1-full.jpg" style="width: 150px; height: 100%;" class="align-left thumbnail" alt="image">
                    <h2>${book.bname}</h2>
                    <p style="word-break: break-word" class="lead">${book.binfo}</p>
                    </div>
                    <ul style="width:100%; clear: both;" class="project-info">
                        <li><h6>장르:</h6> ${genre}</li>
                        <li><h6>작가:</h6> <c:forEach items="${book.aList}" var="author">${author.auname} </c:forEach></li>
                        <li><h6>최신 연재일:</h6> ${book.bupdate}</li>
                        <li><h6>별점:</h6> ${book.bgrade}</li>
                        <li><h6>조회수:</h6> ${book.bview}</li>
                    </ul>
                </div>
                </div>
                <div class="span6" style="height: 550px;" >
                	<ul style="height:100%; border: 2px solid #a9a9a9; border-radius: 6px; padding-bottom:15px; "  >
                	<c:set var="count" value="${fn:length(serial)}"/>
               		<c:forEach items="${serial}" var="serial" varStatus="index">
						<li style="list-style:none; line-height:35px;  width: 96%; margin-left: 2%;  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; border-bottom: 1px dashed #a9a9a9;  padding-top: 4px;">
							<a href="serialView.kh?bno=${book.bno}&rm=${count-index.index}" style="font-size:15px; color:#333333;  ">&nbsp; <c:out value="${count-index.index}"/>. ${serial.stitle}</a></li>
					</c:forEach>
					</ul>
                </div>
            </div>

        </div><!-- End gallery-single-->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->
    
    <!-- Footer -->
    <jsp:include page="khbooks_footer.jsp"/>
    


    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>