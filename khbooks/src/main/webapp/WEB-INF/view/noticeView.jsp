<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>         
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
.file p {
	color : tomato;
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
        <jsp:include page="khbooks_header.jsp"/>
    <!-- Blog Content
    ================================================== --> 
    <div class="row"><!--Container row-->

        <!-- Blog Full Post
        ================================================== --> 
        <div class="span8 blog" style="margin-left: 15%;margin-right: 20%;width: 74%;margin-top: -20px;" >

            <!-- Blog Post 1 -->
            <article>
            <c:forEach items="${noticeView }" var="view">
                <h3 class="title-bg">${view.bname }</h3>
                <div class="post-content">
                    <div class="post-body">
                        <p>${view.btext }</p>
                    </div>

                    <div class="post-summary-footer">
                    	<ul>
                    		<div class="file">
            					<c:choose>
                    				<c:when test="${!empty view.uList }">
                        				<c:forEach items="${view.uList }" var="up">
                       			 		<c:set var="numload" value="${(fn:indexOf(up.upname,'_'))+1}" />
                        				<c:set var="strlength" value="${fn:length(up.upname)}"/>
                      				  	<li style="float: right; list-style: none;"><a href="noticeDownload.kh?upname=${up.upname }&path=c:/khNotice/" style="color:#333333;"><i class="icon-download-alt"></i>${fn:substring(up.upname,numload,strlength)}</a></li>
                        				<br/>
                        				</c:forEach>
                     			   </c:when>
           			            </c:choose>
                  			</div>
                    	</ul>
                        <ul class="post-data">
                            <li><i class="icon-calendar"></i><fmt:formatDate pattern="yy/MM/dd" dateStyle="short" value="${view.ndate }" /></li>
                            <li><i class="icon-user"></i>${view.aid }</li>
                            <c:if test="${sessionScope.admin!=null}">
	                            <li><button type="button" class="btn btn-outline-dark" id="${view.nnum }">수정</button></li>
	                            <li><button type="button" class="btn btn-outline-dark" id="${view.nnum }">삭제</button></li>
	                        </c:if>
                            <li><button type="button" class="btn btn-outline-dark" id="li"  onclick="location.href='noticeList.kh?currentPage=${currentPage}'">목록</button></li>
                        </ul>
                    </div>
            	</div>
            	

               </c:forEach>
            </article>

        </div><!--Close container row-->

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