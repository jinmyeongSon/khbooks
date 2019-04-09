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
<style type="text/css">

table{
width:550px;
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
                <li><img src="img/main/main1.png" alt="slider" /></li>
                <li><img src="img/main/main2.jpg" alt="slider" /></li>
                <li><img src="img/main/main3.jpg" alt="slider" /></li>
                <li><img src="img/main/main4.jpg" alt="slider" /></li>
                <li><img src="img/main/main5.png" alt="slider" /></li>
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
                    <div style="float: none;heigt=41px;width=100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;font-weight:bold;font-size:18px;padding-left: 5px;margin-bottom: 3px;">
								<a href="bookDetail.kh?bno=${list.bno }">${list.bname }</a></div>
                        <a href="bookDetail.kh?bno=${list.bno }">
                        <c:choose>
                   <c:when test="${list.bthumb==null }">
                   	<img src="img/gallery/gallery-img-1-full.jpg" style="width: 150px; height: 230px;" class="align-left thumbnail" alt="image">
                   </c:when>
                   <c:otherwise>
                   	<img src="img/bthumb/${list.bthumb }" style="width: 150px; height: 230px;" class="align-left thumbnail" alt="image"/>
                   </c:otherwise>
                   </c:choose>
						</a>
						<ul >
							<li style="float: none; margin-top:60px;">평점 : ${list.bgrade }</li>
							<li style="float: none;">최신 등록일 : ${list.bupdate }</li>
						</ul>
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
                    <table>
                    	<c:forEach items="${noticeList }" var="ndto" begin="0" end="5" step="1">
                    	<tr>
                    		<td id="af">
                    		<a style="heigt=41px; width=100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; text-align:right; color: #333333; font-weight: bold;" id="noti"href="noticeView.kh?currentPage=${pdto.currentPage }&nnum=${ndto.nnum }"> ${ndto.bname }</a></td>
                    		<td id="back"style="text-align:right"> ${ndto.ndate}</td>
                    		</tr>
                    	</c:forEach>
                    </table>
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
