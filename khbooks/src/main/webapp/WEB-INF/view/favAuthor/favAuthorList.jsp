<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
border:1px solid black;
text-align: center; 

}
.pagination{
text-align: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
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
	$(document).on('click','#deletebtn',function(){
		var del=confirm("정말 삭제 하시겠습니까 ?");
		if(del){
			var bno= $(this).parent().prev().val();
			$(this).parent().prev().prev().attr("action","favAuthorDelte.kh");
			$(this).parent().prev().prev().submit(); 
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

        <div class="span8 contact"><!--Begin page content column-->
        <h2>관심 작가</h2>
  
                    <table>
                    	<thead>
							<tr>
								<th width="1%" ></th>
								<th width="10%">작품 이름</th>
								<th width="10%">작가 소개</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${aList}" >
							<tr>
									<form method="POST">
									<input type="hidden" value="${dto.auno }" name="num"/>
									<td><input type="button" id="deletebtn"/></td>
									<td>${dto.auname }</td>
									<td>${dto.auintro }</td>
									 </form>
								</tr>
							</c:forEach>
					 </tbody>
                    </table>
                   <!--  <button class="btn btn-inverse pull-left" id="deletebtn" type="button">삭제</button> -->
                <div class="pagination">
                	<ul>
                		<c:if test="${pv.startPage>1 }">
							<li class="active"><a href="favAuthorList.kh.kh?currentPage=${pv.startPage-pv.blockPage }">이전</a></li>
						</c:if>
               			<!-- 페이지 -->
						<c:forEach begin="${pv.startPage}" end="${pv.endPage }" var="i">
							
							<c:choose>
							<c:when test="${i==pv.currentPage }">
						<li class="active"><a href="favAuthorList.kh?currentPage=${i}" class="pagecolor">${i}</a></li>
		</c:when>
		<c:otherwise>
			<li class="active"><a href="favAuthorList.kh?currentPage=${i}">${i}</a></li>
		</c:otherwise>
		</c:choose>
		
		</c:forEach>
		<!-- 다음 -->
		<c:if test="${pv.endPage<pv.totalPage}">
			<li class="active"><a href="favAuthorList.kh?currentPage=${pv.startPage+pv.blockPage }">다음</a></li>
		</c:if>
                </ul>
        
            </div>
                    </div>
                    
           

        <!-- Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar"><!-- Begin sidebar column -->
             <h5 class="title-bg">Categories</h5>
            <ul class="post-category-list">
                <li><a href="http://localhost:8090/khbook/memberInfor.kh"><i class="icon-plus-sign"></i>회원정보</a></li>
                <li><a href="http://localhost:8090/khbook/favAuthorList.kh"><i class="icon-plus-sign"></i>관심작가</a></li>
                <li><a href="http://localhost:8090/khbook/favBookList.kh"><i class="icon-plus-sign"></i>관심작품</a></li>
            </ul>
        </div><!-- End sidebar column -->

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
