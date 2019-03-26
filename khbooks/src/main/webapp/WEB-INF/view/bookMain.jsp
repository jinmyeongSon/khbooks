<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
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
<script src="js/button.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var bno = 0;
		var upno = 0;
		var rm = 0;
		var comment = "";
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'getAllComment.kh',
			success : function(res){
				$.each(res, function(index, value) {
					comment = "";
					var source = '<li><div style = "width=100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; font-size: 15px;"><a href="serialView.kh?bno={{bno}}&rm=';
					var template = Handlebars.compile(source);
					var comment = template(value);
					bno = value.bno;
					upno = value.upno;
					$.ajax({
						type : 'GET',
						dataType : 'json',
						url : 'serialNumGet.kh?bno='+bno+'&upno='+upno,
						success : function(res2){
							rm=parseInt(res2);
							comment += rm; 
							source = '">{{bname}}</a></div><div style = "width=100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">{{id}}:   {{rtext}}</div></li>'
								template= Handlebars.compile(source);
							    comment += template(value);
								$('#sidebar-comment').append(comment);
						}
					});

				});
				}
			})
		})
	

</script>


</head>
<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    <!-- Header -->
       <jsp:include page="khbooks_header.jsp"></jsp:include>
     
    <!-- Blog Content
    ================================================== --> 
    <div class="row">

        <!-- Blog Posts
        ================================================== --> 
        <div class="span9 blog">
			<div class ="check">
				<ul id="filterOptions" class="gallery-cats clearfix"> 
                	<li><a href="bookMain.kh?sortkey=1&sortgenre=${pdto.sortgenre}">날짜순 정렬</a></li>
                	<li><a href="bookMain.kh?sortkey=2&sortgenre=${pdto.sortgenre}">점수순 정렬</a></li>
                	<li><a href="bookMain.kh?sortkey=3&sortgenre=${pdto.sortgenre}">조회순 정렬</a></li>
            	</ul>
			</div>
            <div class="row clearfix">
                <ul class="blog-post-grid">
					<c:forEach items="${bList}" var="list" >
                    <li class="span3 blog-post-item">
                        <div class="blog-post-hover hidden-phone hidden-tablet">
                            <p style="font-style: normal;"><a href="bookDetail.kh?bno=${list.bno}" class="clearfix">${list.bname}</a>
                        	   최신 업로드 ${list.bupdate}<br /> 평점 ${list.bgrade}<br />총 조회수 ${list.bview}<br/>${list.binfo}</p>
                        </div>
                        <img src="img/gallery/gallery-img-1-4col.jpg" alt="Post Thumb">
                    </li>
                    </c:forEach>
                </ul>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <ul>
                <c:choose>
                	<c:when test="${pdto.currentPage==1}">
                		<li class="active"><a href="bookMain.kh?currentPage=1">Prev</a></li>
                	</c:when>
					<c:when test="${pdto.startPage==1}">
                		<li><a href="bookMain.kh?currentPage=1">Prev</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="bookMain.kh?currentPage=${pdto.startPage-1}">Prev</a></li>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}" step="1" >
                		<c:choose>
                			<c:when test="${i == pdto.currentPage}">
                				<li class="active">
                			</c:when>
                			<c:otherwise>
                				<li>
                			</c:otherwise>
                		</c:choose>
                		<a href="bookMain.kh?currentPage=${i}">${i}</a></li>
                </c:forEach>
                <c:choose>
                	<c:when test="${pdto.currentPage==pdto.endPage}">
                		<li class="active"><a href="bookMain.kh?currentPage=${pdto.endPage}">Next</a></li>
                	</c:when>
                	<c:when test="${pdto.endPage==pdto.totalPage}">
                		<li><a href="bookMain.kh?currentPage=${pdto.endPage}">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="bookMain.kh?currentPage=${pdto.endPage+1}">Next</a></li>
                	</c:otherwise>
                </c:choose>
                </ul>
            </div>
        </div>

        <!-- Blog Sidebar
        ================================================== --> 
        <div class="span3 sidebar">

            <!--Search-->
            <section>
                <div class="input-append">
                    <form action="bookSearch.kh">
                        <input id="appendedInputButton" size="16" type="text" name="searchWord" placeholder="Search"><button class="btn" type="submit"><i class="icon-search"></i></button>
                    </form>
                </div>
            </section>

            <!--Categories-->
            <h5 class="title-bg">장르별</h5>
            <%-- <ul class="post-category-list">
            	<c:forEach items="${gList}" var="genrelist">
            		<li><a href="#"><i class="icon-plus-sign"></i>${genrelist.gname}</a></li>
            	</c:forEach>
            </ul> --%>
            <div>
            	<c:forEach items="${gList}" var="glist">
            		<a href="bookMain.kh?sortkey=${pdto.sortkey}&sortgenre=${glist.gno}" style="display:inline-block; width:45%; margin-bottom: 5px;"><i class="icon-plus-sign"></i>${glist.gname}</a>
            	</c:forEach>
			</div>
            <!--Tabbed Content-->
            <section class="visible-desktop">
            <h5 class="title-bg">More Info</h5>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#comments" data-toggle="tab">최신 코멘트</a></li>
                <li><a href="#tweets" data-toggle="tab">트위터</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="comments">
                    <ul id="sidebar-comment">
                    </ul>
                </div>
                <div class="tab-pane" id="tweets">
                    <ul>
                    	<c:forEach items="${tweet}" var="tweet">
                    	<li><a href="#">@${tweet.user.screenName}</a> ${tweet.text}</li>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            </section>

        </div>

    </div>
    
    </div> <!-- End Container -->
    <!-- Footer -->
    	<jsp:include page="khbooks_footer.jsp"></jsp:include>
    


    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>