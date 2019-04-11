<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH BOOKs</title>
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
      	<jsp:include page="khbooks_header.jsp" />
     
    <!-- Blog Content
    ================================================== --> 
    <div class="row">

        <!-- Blog Posts
        ================================================== --> 
        <div class="span8 blog" style="margin-left: 13%;margin-right: 20%;width: 77%; margin-top: -40px;" >
        	
        	<h3 class="title-bg" style="font-weight: bold; " ><a href="noticeList.kh" style="color: #333333; text-decoration: none;">공지 사항</a></h3>
        	<c:if test="${sessionScope.admin!=null}">
        	        <button class="btn" type="button" onclick="javascript:location.href='noticeWrite.kh'"><i>글쓰기</i></button>
        	</c:if>
      		
            <!-- Blog Post 1 -->
            <div id="noticeTitle" style="border-bottom: 2px solid #e5e5e5; height: 25px; margin-bottom: 8px;">
                <span id="titleNoticeNum" style="float:left; width: 35px; margin-left: 5px;">번호</span>
                <span id="titleNoticeName" style="float:left; width: 100px; margin-left: 22px; ">제목</span>
                <span id="titleNoticeCalendar" style="float:right; width: 65px; margin-left: 5px;">날자</span>
                <span id="titlenoticeAdmin"style="float:right; width: 96px; margin-left: 5px;">작성자</span>
            </div>
            <c:forEach items="${noticeList }" var="ndto">
            <div id="notice" style="clear: both;height: 20px;margin-bottom: 5px;border-bottom: 1px dashed #e5e5e5;margin-top: 5px;">
                <span id="noticeNum" style="float:left; width: 30px; margin-left: 10px;">${ndto.nnum}</span>
                <a href="noticeView.kh?currentPage=${pdto.currentPage }&nnum=${ndto.nnum }" style="float:left; width: 600px; color: black; margin-left: 20px; overflow: hidden;" >${ndto.bname }</a>

                <span id="noticeCalendar"  style="float:right; width: 90px; margin-left: 5px;">${ndto.ndate }</span>
                <span id="noticeAdmin" style="float:right; width: 60px;  margin-left: 5px;">${ndto.aid }</span>
            </div>
            </c:forEach>
           
         
            <!-- Pagination -->
            <div class="pagination" >
                <ul class="noticeListUl" style="margin-left: 426px; ">
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
                			<li>
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
            
        <section >
            <form id="searchForm" action="noticeList.kh" method="post">
                <div class="input-append" style="margin-left: 328px;">
                    <input name="bname" size="16" type="text" placeholder="검색">
                    <button class="btn" type="button" onClick="document.getElementById('searchForm').submit();"><i class="icon-search"></i></button>
                    <!-- <input type="submit" value="검색"><i class="icon-search"></i> -->
                </div>
            </form>    
        </section>
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