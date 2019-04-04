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
<style type="text/css">
 .clearfix p {
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 300px;
  height: 20px;
}

#rc {
float : right;
}

.popular-posts > li > a {
color : #d8450b;
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
            <c:forEach items="${aList }" var="dto">
            <article class="clearfix">
               <a href=""><img src="img/thumbnail.png" alt="Post Thumb" class="align-center"></a>
                <h4 class="title-bg"><a href="boardView.kh?currentPage=${pdto.currentPage }&bonum=${dto.bonum }">${dto.bname }</a></h4>
                    <%-- <p>${dto.btext }</p> --%>
                    <a href="boardView.kh?currentPage=${pdto.currentPage }&bonum=${dto.bonum }"><button class="btn btn-mini btn-inverse" type="button">자세히</button></a>
                    <div class="post-summary-footer">
                        <ul class="post-data-3">
                            <li><i class="icon-calendar"></i><fmt:formatDate pattern="yy/MM/dd" dateStyle="short" value="${dto.bdate }" /></li>
                            <li><i class="icon-user"></i>${dto.id }</li>
                            <li><i class="icon-comment"></i>댓글&#91;${dto.replyCount}&#93;</li>
                            <li>조회수&nbsp;${dto.bcount}</li>
                        </ul>
                    </div>
            </article>
            </c:forEach>
         

            <!-- Pagination -->
            <div class="pagination">
                <ul>
                <!-- 이전 출력 -->
                <c:if test="${pdto.startPage > 1 }">
                <li class="active"><a href="boardList.kh?currentPage=${pdto.startPage-pdto.blockPage }">이전</a></li>
                </c:if>
                
                <!-- 페이지 출력 -->
                <c:forEach begin="${pdto.startPage }" end="${pdto.endPage }" var="i">
                	<c:choose>
                		<c:when test="${i == pdto.currentPage }">
                			<li class="active">
                				<a href="boardList.kh?currentPage=${i }">${i }</a>
               				 </li>
                		</c:when>
                		<c:otherwise>
                			<li class="active">
                				<a href="boardList.kh?currentPage=${i }">${i }</a>
               				 </li>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                
                <!-- 다음 출력 -->
                <c:if test="${pdto.endPage < pdto.totalPage }">
                	<li><a href="boardList.kh?currentPage=${pdto.startPage+pdto.blockPage }">다음</a></li>
                </c:if>	
                </ul>
            </div>
        </div>

        <!-- Blog Sidebar
        ================================================== --> 
        <div class="span4 sidebar">

            <!--Search-->
            <section>
                <div class="input-append">
                    <form id="searchForm" action="boardList.kh" method="post">
                        <input name="bname" size="16" type="text" placeholder="제목검색">
                        <button class="btn" type="button" onClick="document.getElementById('searchForm').submit();"><i class="icon-search"></i></button>
                    </form>
                </div>
            </section>
            
            <!-- 글쓰기 -->
           <c:choose>
            <c:when test="${sessionScope.id == null }">
              	<button class="btn" type="button" onclick="alert('로그인 먼저 해주세요')"><i>글쓰기</i></button>
            </c:when>
            <c:otherwise>
             	<button class="btn" type="button" onclick="javascript:location.href='boardWrite.kh'"><i>글쓰기</i></button>
			</c:otherwise>
			</c:choose>
			<!-- <button class="btn" type="button" onclick="javascript:location.href='boardWrite.kh'"><i>글쓰기</i></button> -->
            
            <!-- 카테고리 -->
            <h5 class="title-bg">게시판 카테고리</h5>
            <ul class="post-category-list">
                <li><a href="noticeList.kh"><i class="icon-plus-sign"></i>공지사항</a></li>
                <li><a href="boardList.kh"><i class="icon-plus-sign"></i>자유게시판</a></li>
            </ul>

            <!-- 인기 게시물 -->
            <h5 class="title-bg">인기 게시물</h5>
           <c:forEach items="${popular }" var="p">
            <ul class="popular-posts">
                <li>
                    <a href="boardView.kh?currentPage=${pdto.currentPage }&bonum=${p.bonum }">${p.bname }</a>
                    <span id="rc">조회수&#91;${p.bcount}&#93;</span>
                </li>
            </ul>
            </c:forEach>

            <!-- 최신 댓글 -->
            <h5 class="title-bg">최근 댓글</h5>
            
            <div class="tab-content">
                <div class="tab-pane active" id="comments">
                <c:forEach  items="${reply }" var="r">
                     <ul>
                        <li><i class="icon-comment"></i>${r.id } > <a href="boardView.kh?currentPage=${pdto.currentPage}&bonum=${r.bonum}">${r.bctext }</a></li>
                    </ul>
                </c:forEach>
                </div>

            
        </div>

    </div>
    
    </div>
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->
        
	<jsp:include page="khbooks_footer.jsp"/>

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>