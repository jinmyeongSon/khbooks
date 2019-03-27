<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="css/prettyPhoto.css" />
<link rel="stylesheet" href="css/flexslider.css" />
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
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    $("#btn-blog-next").click(function () {
      $('#blogCarousel').carousel('next')
    });
     $("#btn-blog-prev").click(function () {
      $('#blogCarousel').carousel('prev')
    });

     $("#btn-client-next").click(function () {
      $('#clientCarousel').carousel('next')
    });
     $("#btn-client-prev").click(function () {
      $('#clientCarousel').carousel('prev')
    });
     
     $('#bookmove').on('click',function(){
    	 location.href='http://localhost:8090/khbook/bookMain.kh';
     });
     $('#noticemove').on('click',function(){
    	 location.href='http://localhost:8090/khbook/noticeList.kh';
     });
     $('#tweetmove').on('click',function(){
    	 location.href='https://twitter.com/khbooks1';
     });
    
});

 $(window).load(function(){

    $('.flexslider').flexslider({
        animation: "slide",
        slideshow: true,
        start: function(slider){
          $('body').removeClass('loading');
        }
    });  
});

</script>

</head>
  
<body class="home">
    <!-- Color Bars (above header)-->
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container">
    
    <jsp:include page="khbooks_header.jsp"></jsp:include> 
     
    <div class="row headline"><!-- Begin Headline -->
    
     	<!-- Slider Carousel
        ================================================== -->
        <div class="span8">
            <div class="flexslider">
              <ul class="slides">
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
                <li><a href="gallery-single.htm"><img src="img/gallery/slider-img-1.jpg" alt="slider" /></a></li>
              </ul>
            </div>
        </div>
        
        <!-- Headline Text
        ================================================== -->
       
    </div><!-- End Headline -->
    
    <div class="row gallery-row"><!-- Begin Gallery Row --> 
      
    	<div class="span12">
            <h5 class="title-bg">최신 업로드
                
                <button class="btn btn-mini btn-inverse hidden-phone" id="bookmove" type="button">페이지로 이동</button>
            </h5>
    	
        <!-- Gallery Thumbnails
        ================================================== -->

             <div class="row clearfix">
                <ul class="blog-post-grid">

					<c:forEach items="${bList}" var="list"  begin="0" end="7" step="1" >
                    <li class="span3 blog-post-item">
                        <div class="blog-post-hover hidden-phone hidden-tablet">
                            <p><a href="bookDetail.kh?bno=${list.bno}" class="clearfix">${list.bname}</a>
                            posted on 9/01/15<br /> 12 comments<br /> posted in photoshop</p>
                        </div>
                        <a href="blog-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Post Thumb"></a>
                    </li>
                    </c:forEach>

                </ul>
            </div>
            </div>
 
    </div><!-- End Gallery Row -->
    
    <div class="row"><!-- Begin Bottom Section -->
    
    
    	<!-- Blog Preview
        ================================================== -->
    	<div class="span6">

            <h5 class="title-bg">공지사항
                <small>Notice</small>
                <button class="btn btn-mini btn-inverse hidden-phone" id="noticemove" type="button">페이지로 이동</button>
            </h5>
             <div class="tab-pane" id="notice">
                    <ul>
                    	<c:forEach items="${noticeList }" var="ndto" begin="0" end="5" step="1">
                    	<li style="heigt=41px; width=100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><a id="noti"href="noticeView.kh?currentPage=${pdto.currentPage }&nnum=${ndto.nnum }"> ${ndto.bname }</a> ${ndto.ndate}</li>
                    	</c:forEach>
                    </ul>
                </div>
        
            
        </div>
        
        <!-- Client Area
        ================================================== -->
        <div class="span6">

            <h5 class="title-bg">트위터
            <button class="btn btn-mini btn-inverse hidden-phone" id="tweetmove" type="button">페이지로 이동</button>
            </h5>

            <!-- Client Testimonial Slider-->
             <div class="tab-pane" id="tweets">
                    <ul>
                    	<c:forEach items="${tweet}" var="tweet">
                    	<li style="heigt=41px; width=100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><a href="#">@${tweet.user.screenName}</a> ${tweet.text}</li>
                    	</c:forEach>
                    </ul>
                </div>

            <!-- Client Logo Thumbs-->
          

        </div>
        
    </div><!-- End Bottom Section -->
    
    </div> <!-- End Container -->

    
    <!-- Footer -->
    <jsp:include page="khbooks_footer.jsp"/>
    
    
    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>