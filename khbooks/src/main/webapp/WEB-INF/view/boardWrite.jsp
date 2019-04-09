<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>         
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
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src=https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.1/handlebars.js></script>
<script src="js/board.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
      <div class="row header"><!-- Begin Header -->
        <jsp:include page="khbooks_header.jsp"></jsp:include>
      </div><!-- End Header -->
      
    <!-- Blog Content
    ================================================== --> 
    <div class="row"><!--Container row-->

        <!-- Blog Full Post
        ================================================== --> 
        <div class="span8 blog"style="margin-left:15%; margin-right:20%; width:74%; margin-top:-20px;">
        <form id="frm">
        <input type="hidden" name="id" value="${sessionScope.id}">
            <!-- Blog Post 1 -->
            <article>
                <h3 class="title-bg">글 제목 :  <input type="text" name="bname" style="width:500px"></h3>
                <div class="post-content">
                    <!-- <img src="img/gallery/notice.jpg" alt="Post Thumb"> -->

                    <div class="post-body">
                        <p><textarea name="btext" style="width:700px; height:300px;"></textarea></p>
                    </div>

                    <div class="post-summary-footer">
                        <ul class="post-data">
                            <li><button type="button" class="btn btn-outline-dark" id="write">글쓰기</button></li>
                            <li><button type="button" class="btn btn-outline-dark" id="li"  onclick="javascript:history.go(-1)">목록</button></li>
                        </ul>
                    </div>
                </div>
            </article>
       </form>
     </div><!--Close container row-->

    </div>
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
	<jsp:include page="khbooks_footer.jsp"/>
	<!-- End Footer --> 

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    

</body>
</html>