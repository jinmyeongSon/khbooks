<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
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
<style type="text/css">
#rc {
float : right;
}

.popular-posts > li > a {
color : #d8450b;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script src="js/notice.js"></script>
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
    <div class="row">

        <!-- Blog Posts
        ================================================== --> 
        <div class="span8 blog">
      
            <!-- Blog Post 1 -->
            <c:forEach items="${noticeList }" var="ndto">
            <article id="article">
                <h3 class="title-bg"><a href="noticeView.kh?currentPage=${pdto.currentPage }&nnum=${ndto.nnum }">&nbsp; &nbsp; ${ndto.bname }</a>
                <span id="noticeCalendar">${ndto.ndate }</span>
                <span id="noticeAdmin">${ndto.aid }</span>
                </h3>
            </article>
            </c:forEach>
           
         
            <!-- Pagination -->
            <div class="pagination">
                <ul class="noticeListUl">
                <!-- 이전 출력 -->
                <c:if test="${pdto.startPage > 1 }">
                <li class="active"><a href="noticeList.kh?currentPage=${pdto.startPage-pdto.blockPage }">이전</a></li>
                </c:if>
                
                <!-- 페이지 출력 -->
                <c:forEach begin="${pdto.startPage }" end="${pdto.endPage }" var="i">
                	<c:choose>
                		<c:when test="${i == pdto.currentPage }">
                			<li class="active">
                				<a href="noticeList.kh?currentPage=${i }">${i }</a>
               				 </li>
                		</c:when>
                		<c:otherwise>
                			<li class="active">
                				<a href="noticeList.kh?currentPage=${i }">${i }</a>
               				 </li>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                
                <!-- 다음 출력 -->
                <c:if test="${pdto.endPage < pdto.totalPage }">
                	<li><a href="noticeList.kh?currentPage=${pdto.startPage+pdto.blockPage }">다음</a></li>
                </c:if>	
                </ul>
            </div>
        </div>

        <!-- Blog Sidebar
        ================================================== --> 
        <div class="span4 sidebar">

            <!--검색 -->
            <section>
            <form id="searchForm" action="noticeList.kh" method="post">
                <div class="input-append">
                    <input name="bname" size="16" type="text" placeholder="제목 검색">
                    <button class="btn" type="button" onClick="document.getElementById('searchForm').submit();"><i class="icon-search"></i></button>
                    <!-- <input type="submit" value="검색"><i class="icon-search"></i> -->
                </div>
            </form>    
            </section>
            
            
            <button class="btn" type="button" onclick="javascript:location.href='noticeWrite.kh'"><i>글쓰기</i></button>
			
            <!--Categories-->
            <h5 class="title-bg">카테고리</h5>
            <ul class="post-category-list">
                <li><a href="noticeList.kh"><i class="icon-plus-sign"></i>공지사항</a></li>
                <li><a href="boardList.kh"><i class="icon-plus-sign"></i>자유게시판</a></li>
            </ul>

            <!--Popular Posts-->
            <h5 class="title-bg">인기 게시물</h5>
            <c:forEach items="${popular }" var="p">
            <ul class="popular-posts">
                <li>
                    <a href="noticeView.kh?currentPage=${pdto.currentPage}&nnum=${p.nnum}">${p.bname }</a>
                    <span id="rc">조회수&#91;${p.ncount}&#93;</span>
                </li>
            </ul>
            </c:forEach>
        </div>

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