<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>         
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
.file p {
	color : tomato;
}
</style>
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
    <div class="row"><!--Container row-->

        <!-- Blog Full Post
        ================================================== --> 
        <div class="span8 blog">

            <!-- Blog Post 1 -->
            <article>
            <c:forEach items="${noticeView }" var="view">
                <h3 class="title-bg">${view.bname }</h3>
                <div class="post-content">
                    <div class="post-body">
                        <p>${view.btext }</p>
                    </div>

                    <div class="post-summary-footer">
                        <ul class="post-data">
                            <li><i class="icon-calendar"></i><fmt:formatDate pattern="yy/MM/dd" dateStyle="short" value="${view.ndate }" /></li>
                            <li><i class="icon-user"></i>${view.aid }</li>
                            <li><button type="button" class="btn btn-outline-dark" id="${view.nnum }">수정</button></li>
                            <li><button type="button" class="btn btn-outline-dark" id="${view.nnum }">삭제</button></li>
                            <li><button type="button" class="btn btn-outline-dark" id="li"  onclick="javascript:history.go(-1)">목록</button></li>
                        </ul>
                    </div>
            	</div>
            	
            	<form>
            	<div class="file">
            		<c:choose>
                    	<c:when test="${!empty view.uList }">
                        	<c:forEach items="${view.uList }" var="up">
                        		<c:set var="numload" value="${(fn:indexOf(up.upname,'_'))+1}" />
                        		<c:set var="strlength" value="${fn:length(up.upname)}"/>
                        	<p><a href="noticeDownload.kh?upname=${up.upname }&path=c:/khNotice/">● ${fn:substring(up.upname,numload,strlength)}</a></p>
                        	</c:forEach>
                        </c:when>
                        <c:otherwise>
                        	<p>첨부파일이 없습니다.</p>
                        </c:otherwise>	
                        </c:choose>
                    </div>
                </form>    
               </c:forEach>
            </article>

       


        </div><!--Close container row-->

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