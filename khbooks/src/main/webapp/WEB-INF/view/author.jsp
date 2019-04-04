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
#ul{
margin-left:250px;
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
var auno = ${aList.auno};
var chk = 0;
var id = '';

$(document).ready(function () {
	var id = '${sessionScope.id}';
	if(id==''){
		alert('로그인을 해주세요.');
		location.href='http://localhost:8090/khbook/mainpage.kh';
	}
	$(document).on('click','#move',function(){
		var au=$(this).parent().prev().children().val();
		var ak=$(this).parent().prev().children().children("option:selected").text();
		location.href='http://localhost:8090/khbook/serialView.kh?bno='+au+'&rm='+ak;
	});
	$(document).on('click','#deletebtn',function(){
		var del=confirm("정말 삭제 하시겠습니까 ?");
		if(del){
			var bno= $(this).parent().prev().val();
			$(this).parent().prev().prev().attr("action","favDelete.kh");
			$(this).parent().prev().prev().submit(); 
		}else{
			return false;
		}
	});
	
	$(document).on('click','#favAuthor-btn',function(){
		chk = $(this).attr('value');
		auno=${aList.auno};
		id='${sessionScope.id}';
		if(id==''){
			alert('로그인후 사용할수 있는 기능입니다.');
			return;
		}
 		
 		if(chk>0){
 			$.ajax({
 				type : 'GET',
 				dataType : 'text',
 				url : 'favAuthorDelete2.kh?auno='+auno,
 				success : function(){
 					$('#favAuthor-btn').attr('class','btn btn-small');
 					$('#favAuthor-btn').attr('value',0);
 					$('#favAuthor-btn').text('관심 작품 담기');
 				}
 			})
 		}else{
			$.ajax({
 				type : 'GET',
 				dataType : 'text',
 				url : 'authorinsert.kh?auno='+auno,
 				success : function(){
 					$('#favAuthor-btn').attr('class','btn btn-small btn-inverse');
 					$('#favAuthor-btn').attr('value',1);
 					$('#favAuthor-btn').text('관심 작품 빼기');
 				}
 			})
 		}
 		
 	});
	
});

</script>

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    
      <jsp:include page="khbooks_header.jsp"></jsp:include>
     
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->
        <div class="span6 gallery-single">
        <h3 >${aList.auname }님의 작품 
        <c:choose>
            <c:when test="${fbchk==0 || sessionScope.id == ''}">
            	<button class="btn btn-small" id="favAuthor-btn"  value="${fbchk}">관심 작가 추가</button>
            </c:when>
            <c:otherwise>
              <button class="btn btn-small btn-inverse" id="favauthor-btn" value="${fbchk}">관심 작가 제거</button>
            </c:otherwise>
           	</c:choose></h3>
        <c:forEach var="dto" items="${bList}" >
                <div class="span8">
                <div style="width: 90%; ">
                   <div style="width: 95%; height: 200px;">
                   <c:choose>
                   <c:when test="${dto.bthumb==null }">
                   	<img src="img/gallery/gallery-img-1-full.jpg" style="width: 150px; height: 100%;" class="align-left thumbnail" alt="image">
                   </c:when>
                   <c:otherwise>
                   	<img src="img/bthumb/${dto.bthumb }" style="width: 150px; height: 100%;" class="align-left thumbnail" alt="image">
                   </c:otherwise>
                   </c:choose>
                    <h2>${dto.bname}</h2>
                    <!-- <div style="margin-left:170px;"> -->
                    <ul style="width:40%; float:left; " class="project-info">
                        <li style="padding:5px;"><h6>별점:</h6> ${dto.bgrade} / <h6>조회수:</h6> ${dto.bview}</li>
                        <li style="padding:5px;"><h6>최신 연재일:</h6> ${dto.bupdate}</li>
                        <li  style="padding:5px; margin-top: 10px; border-bottom: 0px solid;">
                           <a href="serialView.kh?bno=${dto.bno}&rm=1" id="serialFirst"><button class="btn btn-small">첫 화 보기</button></a>
                            <a href="http://localhost:8090/khbook/bookDetail.kh?bno=${dto.bno }">
                            <button class="btn btn-small btn-inverse" id="favBook-btn" >작품 페이지로 가기</button></a>
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
                </div>
                
            </c:forEach>
            </div>
        <!-- End gallery-single-->
                    
           

        <!-- Sidebar
        ================================================== --> 
        <div class="span3 sidebar page-sidebar" style="margin-left:300px; ">
                 <h3 style="text-align:center;">작가소개</h3>
          		<p style="border: 2px solid #a9a9a9; height:500px; border-radius: 6px; padding-bottom:15px; font-size:15px;">
          		<span style="margin:20px;" >${aList.auintro }</span></p>
        		</div><!-- End sidebar column -->
    </div>
    </div> <!-- End Container -->
    <!-- Footer Area
        ================================================== -->

	<jsp:include page="khbooks_footer.jsp"/>

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>