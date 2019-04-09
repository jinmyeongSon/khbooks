<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet" href="css/_button-group.css">
<link rel="stylesheet" href="css/_buttons.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/admin.js"></script>

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


<style type="text/css">
	.changeCursor{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
      	<jsp:include page="khbooks_header.jsp"/>
    <!-- Blog Content
    ================================================== --> 
    <div class="row">
		<div class ="check">
			<ul id="filterOptions" class="gallery-cats clearfix" style="margin-bottom: 10px;"> 
               	<li><div class="changeCursor" id="userManage">유저 관리</div></li>
               	<li><div class="changeCursor" id="bookManage">작품 관리</div></li>
               	<li><div class="changeCursor" id="authorManage">작가 관리</div></li>
               	<li><div class="changeCursor" id="bookInsert">작품 등록</div></li>
               	<li><div class="changeCursor" id="authorInsert">작가 등록</div></li>
           	</ul>
		</div>
    	<div style="float:left; width: 99%; height: 700px; background-color: #d8450b; margin: 0px 0px 20px 10px;" id="managePlace">
    		
    	</div>
    </div>
    </div>

    <!-- Footer Area
        ================================================== -->
	<jsp:include page="khbooks_footer.jsp"/>
	<!-- End Footer -->

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>