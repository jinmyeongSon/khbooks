<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<style  type="text/css">
ul::-webkit-scrollbar { 
    display: none;
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
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.quicksand.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
var bno = ${book.bno};
var chk = 0;
var id = '';


 	$(document).on('click','#favBook-btn',function(){
		chk = $(this).attr('value');
		bno=${book.bno};
		id='${sessionScope.id}';
		if(id==''){
			alert('로그인후 사용할수 있는 기능입니다.');
			return;
		}
 		
 		if(chk>0){
 			$.ajax({
 				type : 'GET',
 				dataType : 'text',
 				url : 'favBookDelete.kh?bno='+bno,
 				success : function(){
 					$('#favBook-btn').attr('class','btn btn-small');
 					$('#favBook-btn').attr('value',0);
 					$('#favBook-btn').text('관심 작품 담기');
 				}
 			})
 		}else{
			$.ajax({
 				type : 'GET',
 				dataType : 'text',
 				url : 'favinsert.kh?bno='+bno,
 				success : function(){
 					$('#favBook-btn').attr('class','btn btn-small btn-inverse');
 					$('#favBook-btn').attr('value',1);
 					$('#favBook-btn').text('관심 작품 빼기');
 				}
 			})
 		}
 		
 	});

</script>

<title>KH BOOKs</title>
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
        <div class="span12 gallery-single">
            <div class="row">
            	<div class="span2"></div>
                <div class="span8">
                <div style="width: 90%;  margin-left: 50px;">
                	<div style="width: 100%; height: 200px;">
                    <c:choose>
                   <c:when test="${book.bthumb==null }">
                   	<img src="img/gallery/gallery-img-1-full.jpg" style="width: 150px; height: 100%;" class="align-left thumbnail" alt="image">
                   </c:when>
                   <c:otherwise>
                   	<img src="img/bthumb/${book.bthumb }" style="width: 150px; height: 100%;" class="align-left thumbnail" alt="image">
                   </c:otherwise>
                   </c:choose>
                    <h2>${book.bname}</h2>
                    <!-- <div style="margin-left:170px;"> -->
                    <ul style="width:40%; float:left; " class="project-info">
                        <li style="padding:5px;"><h6>장르:</h6> ${genre} / <h6>별점:</h6> ${book.bgrade} / <h6>조회수:</h6> ${book.bview}</li>
                        <li style="padding:5px;"><h6>작가:</h6> <c:forEach items="${book.aList}" var="author"><a href="http://localhost:8090/khbook/author.kh?auno=${author.auno }">${author.auname}</a> </c:forEach></li>
                        <li style="padding:5px;"><h6>최신 연재일:</h6> ${book.bupdate}</li>
                        <li  style="padding:5px; margin-top: 30px; border-bottom: 0px solid;">
                        	<a href="serialView.kh?bno=${book.bno}&rm=1" id="serialFirst"><button class="btn btn-small">첫 화 보기</button></a>
                        	<c:choose>
                        		<c:when test="${fbchk==0 || sessionScope.id == ''}">
                        			<button class="btn btn-small" id="favBook-btn"  value="${fbchk}">관심 작품 담기</button>
                        		</c:when>
                        		<c:otherwise>
                        			<button class="btn btn-small btn-inverse" id="favBook-btn" value="${fbchk}">관심 작품 빼기</button>
                        		</c:otherwise>
                        	
                        	</c:choose>
                        </li>
                    </ul>
                    <!-- <div style="float:left; width:58%; height: 160px; position:relative;">
                    <button style="position:absolute; bottom:60px; right: 20px;"> aa </button>
                    <button style="position:absolute; bottom:30px; right: 20px;"> aa </button>
                    <button style="position:absolute; bottom:0px; right: 20px;"> aa </button>

                    </div>
                    </div> -->
                    </div>
                    <p style="word-break: break-word;  clear: both;" class="lead">${book.binfo}</p>
                    
                </div>
                <div style="height: 550px;"  >
                	<ul style="height:100%; border: 2px solid #a9a9a9; border-radius: 6px; padding-bottom:15px; overflow: scroll; user-select:none;"  >
                	<c:set var="count" value="${fn:length(serial)}"/>
               		<c:forEach items="${serial}" var="serial" varStatus="index">
						<li style="list-style:none; line-height:35px;  width: 96%; margin-left: 2%;  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; border-bottom: 1px dashed #a9a9a9;  padding-top: 4px;">
							<a href="serialView.kh?bno=${book.bno}&rm=${count-index.index}" style="font-size:15px; color:#333333;  ">&nbsp; <c:out value="${count-index.index}"/>. ${serial.stitle}</a></li>
					</c:forEach>
					</ul>
                </div>
                </div>
            </div>

        </div><!-- End gallery-single-->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->
    
    <!-- Footer -->
    <jsp:include page="khbooks_footer.jsp"/>
    


    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>