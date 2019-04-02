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
#replyUpt, #replyDel {
	float : right;
}
.modifyShow {
	display : block;
	position: absolute;
	left: 200px;
	width: 400px;
	height: 150px;
	z-index: 1000;
	border: 1px solid black;
	background-color: yellow;
	text-align: center;
}
.modifyHide {
	visibility:hidden;
	width:0px; 
	height:0px;	
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
        <form id="frm">
        <input type="hidden" name="bonum" value="${dto.bonum}" />
        <input type="hidden" name="currentPage" value="${currentPage }" />
        <input type="hidden" name="bcount" value="${dto.bcount }" />
        <div class="span8 blog">

            <!-- Blog Post 1 -->
            <article>
                <h3 class="title-bg"><input type="text" name="bname" value="${dto.bname }"></h3>
                <div class="post-content">
                    <a href="#"><img src="img/gallery/notice.jpg" alt="Post Thumb"></a>

                    <div class="post-body">
                        <p><textarea id="boardUp" name="btext" style="width:556px; height:150px;">${dto.btext }</textarea></p>
                    </div>
                    
                    <div class="post-summary-footer">
                        <ul class="post-data">
                            <li name="bdate"><i class="icon-calendar"></i><fmt:formatDate pattern="yy/MM/dd" dateStyle="short" value="${dto.bdate }" /></li>
                            <li><i class="icon-user"></i> <a href="#" name="id">${dto.id }</a></li>
                            <li><button type="button" class="btn btn-outline-dark" id="upup">등록</button></li>
                            <li><button type="button" class="btn btn-outline-dark" id="li" onclick="board_list()">목록</button></li>
                        </ul>
                    </div>
                </div>
            </article>

        <!-- Post Comments
        ================================================== --> 
            <%-- <section class="comments">
                <h4 class="title-bg" id="replycntSmall"><a name="comments"></a>댓글&#91;${commentRecord}&#93;</h4>
               <!-- 댓글 리스트 --> 
               <ul class="listUl">
               	<c:forEach items="${ReplyDTO }" var="rdto">
               		<li class="commList" id="${rdto.bcno }">
               			<img src="img/user-avatar.jpg" alt="Image" />
               			<span class="comment-name">${rdto.id }</span>
               			<span>&nbsp;&nbsp;</span>
               			<span class="comment-date"><fmt:formatDate pattern="yy/MM/dd" dateStyle="short" value="${rdto.bcdate}"/></span>
               			<div class="comment-content">${rdto.bctext }</div>
               			<button id="${rdto.bcno }" class="${rdto.bonum }">수정</button>
               			<button id="${rdto.bcno }" class="${rdto.bonum }">삭제</button>
               		</li>	
               	</c:forEach>
               </ul> --%>
               <!-- 댓글 리스트 끝 -->
            
                <!-- Comment Form -->
                <%-- <div class="comment-form-container">
                    <h6>Leave a Comment</h6>
                    <form action="commentInsert.kh" method="post" id="comment-form">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span>
                            <c:forEach items="${ReplyDTO }" var="rdto">
                            	<input class="span4" id="prependedInput" size="16" type="text" value="hana" readonly>
                            </c:forEach>
                        </div>
                       <textarea class="span6" placeholder="댓글을 입력해주세요"></textarea>     
                        <div class="row">
                            <div class="span2" id="${bdto.bonum }">
                                <input type="button" class="btn btn-inverse" id="addComment" value="입력">
                            </div>
                        </div>
                    </form>
                </div> 
        </section> --%> <!-- Close comments section-->


		<!-- Modal -->
<%-- 		<div id="modifyModal">			
			<p>
				<label for="updateReplyText">Reply Text</label> 
				<input class="form-control" type="text" placeholder="REPLY TEXT" id="updateReplyText">
			</p>
			<p>			    
				<button id="btnModify" class="${bdto.bonum}">수정</button>
				<button id="btnClose">닫기</button>
			</p>
		</div> --%>

        </div><!--Close container row-->
        </form>

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
	<!-- End Footer --> 

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    

</body>
</html>