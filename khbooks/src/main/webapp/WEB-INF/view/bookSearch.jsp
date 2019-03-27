<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="span12 gallery">

            <ul id="filterOptions" class="gallery-cats clearfix"> 
                	<li><a href="bookSearch.kh?sortkey=1&sortgenre=${pdto.sortgenre}&searchWord=${pdto.searchWord}">날짜순 정렬</a></li>
                	<li><a href="bookSearch.kh?sortkey=2&sortgenre=${pdto.sortgenre}&searchWord=${pdto.searchWord}">점수순 정렬</a></li>
                	<li><a href="bookSearch.kh?sortkey=3&sortgenre=${pdto.sortgenre}&searchWord=${pdto.searchWord}">조회순 정렬</a></li>
            </ul>
            
            <c:choose>
            <c:when test="${pdto.endRow==0}">
            <div class="row clearfix">
            	<div style="margin-left: 3%; font: 20px bold;" >검색 결과가 없습니다</div>
            </div>
            </c:when>
            <c:otherwise>
            <div class="row clearfix">
                <ul class="gallery-post-grid holder">

                    <!-- Gallery Item -->
                    <c:forEach items="${bList}" var="list">
                    	<li class="span3 gallery-item" data-id="id-1" data-type="illustration">
                        	<span class="gallery-hover-4col hidden-phone hidden-tablet">
                            	<span class="gallery-icons">
                                	<a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
                                	<a href="gallery-single.htm" class="item-details-link"></a>
                            	</span>
                        	</span>
                        	<a href="gallery-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Gallery"></a>
                        	<span class="project-details"><a href="gallery-single.htm">${list.bname}</a>For an international ad campaign.</span>
                    	</li>
                    </c:forEach>
                </ul>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <ul>
                <c:choose>
                	<c:when test="${pdto.currentPage==1}">
                		<li class="active"><a href="bookSearch.kh?searchWord=${pdto.searchWord}&sortgenre=${pdto.sortgenre}&sortkey=${pdto.sortkey}&currentPage=1">Prev</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="bookSearch.kh?searchWord=${pdto.searchWord}&sortgenre=${pdto.sortgenre}&sortkey=${pdto.sortkey}&currentPage=${pdto.currentPage-1}">Prev</a></li>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="i" begin="${-blockPage/2}" end="${pdto.blockPage/2}" step="1" >
                	<c:if test="${(pdto.currentPage+i-1)>0 && ((pdto.currentPage+i-2)<(pdto.endPage))}">
                		<c:choose>
                			<c:when test="${(i+pdto.currentPage-1) == pdto.currentPage}">
                				<li class="active">
                			</c:when>
                			<c:otherwise>
                				<li>
                			</c:otherwise>
                		</c:choose>
                		<a href="bookSearch.kh?searchWord=${pdto.searchWord}&sortgenre=${pdto.sortgenre}&sortkey=${pdto.sortkey}&currentPage=${pdto.currentPage + (i - 1)}">${pdto.currentPage + (i-1)}</a></li>
                	</c:if>
                </c:forEach>
             
                <c:choose>
                	<c:when test="${pdto.currentPage==pdto.endPage}">
                		<li class="active"><a href="bookSearch.kh?searchWord=${pdto.searchWord}&sortgenre=${pdto.sortgenre}&sortkey=${pdto.sortkey}&currentPage=${pdto.endPage}">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="bookSearch.kh?searchWord=${pdto.searchWord}&sortgenre=${pdto.sortgenre}&sortkey=${pdto.sortkey}&currentPage=${pdto.currentPage+1}">Next</a></li>
                	</c:otherwise>
                </c:choose>
                </ul>
            </div>

        </c:otherwise>
        </c:choose>
     </div><!-- End gallery list-->
        
            
    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
	<div class="footer-container"><!-- Begin Footer -->
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
                    <ul>
                        <li><a href="#">@room122</a> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                        <li><a href="#">@room122</a> In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices.</li>
                        <li><a href="#">@room122</a> Vivamus nec lectus sed orci molestie molestie. Etiam mattis neque eu orci rutrum aliquam.</li>
                    </ul>
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