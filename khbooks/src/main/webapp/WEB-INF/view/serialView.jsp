<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="ajaxsrc/jquery01.js"></script>

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">
<style type="text/css">
div::-webkit-scrollbar { 
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
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>

<script type="text/javascript">
var urno='';
var fileList='';
var bno='';
var rm='';
var totalCount='';
var id='';

$(document).ready(function(){
	bno=${bno};
	rm=${rm};
	totalCount=${totalCount};
	id='${sessionScope.id}';
	
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'bookInfo.kh?bno='+bno,
		success : info_success
	});
	
	$('#prev').on('click', function() {
		if(rm == 1){
			alert('첫화임 ㅅㄱ');
		} else{
			rm--;
			serial_move();
		}
	});
	
	$('#next').on('click', function() {
		if(rm == totalCount){
			alert('막화임 ㅅㄱ');
		} else{
			rm++;
			serial_move();
		}
	});
	
	$('#go').on('click', function() {
		rm = $('#sesel').val();
		serial_move();
	});
	
	$('#gradebtn').on('click', function() {
		if(id == ''){
			alert('로그인 후 이용 가능합니다.');
			href.location='loginForm.kh';
		}else {
			$.ajax({
				type : 'GET',
				dataType : 'text',
				url : 'gradeCheck.kh?bno='+bno+'&rm=' + rm,
				success : grade_check_complete
			});
		}
	})
	
	// 댓글추가
	$("#replyAddBtn").on("click", reply_insert);
	// 수정 삭제 이벤트 동적 추가
	$(document).on('click', '.timeline button', reply_delete);
});

function grade_check_complete(res) {
	var grade = $('#gradesel').val();
	if(res == 0){
		$.ajax({
			type : 'GET',
			dataType : 'text',
			url : 'gradeInsert.kh',
			data : 'bno=' + bno + '&rm=' + rm + '&grade=' + grade,
			success : function(res) {
				alert('입력 완료');
			}
		});
	} else{
		var check = confirm('수정하시겠습니까?');
		if(check){
			$.ajax({
				type : 'GET',
				dataType : 'text',
				url : 'gradeUpdate.kh',
				data : 'bno=' + bno + '&rm=' + rm + '&grade=' + grade,
				success : function(res) {
					alert('입력 완료');
				}
			});
		}else{
			return;
		}
	}
}

function info_success(res) {
		var source = '{{bname}}';
		var template = Handlebars.compile(source);
		$('#bookTitle').text(template(res));
		var auname='';
		$.each(res.aList, function(index, value) {
			// 작품정보에 작가이름 추가
			source = '<a href="authorDetail.kh?auno={{auno}}">'
					+'{{auname}}'
					+'</a>';
			template = Handlebars.compile(source);
			auname += template(value) + ' ';

			source = '{{auno}}';
			template = Handlebars.compile(source);
			// 작가의 다른 작품
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : 'authorBook.kh?auno=' + template(value),
				success : function(result) {
					var src = '<h5 class="title-bg">작가의 다른 작품</h5>'
		            	 +'<ul class="popular-posts">';
					$.each(result, function(idx, val) {
						source = '<li style="min-height: 0px;"><h6><a href="bookDetail.kh?bno={{bno}}">{{bname}}</a></h6></li>';
						template = Handlebars.compile(source);
						src += template(val);
					});
            		src += '</ul>';
            		$('#bookInfo').append(src);
				}
			});
		});
		$('#bookAuthor').append(auname);
}

function serial_move(){
	$.ajax({
		type:'GET',
		dataType:'json',
		url: 'serialMove.kh?bno='+bno+'&rm='+rm,
		success : change_serial
	});
}

function change_serial(res) {
	$('#secnt').text(rm + ' / ${totalCount}');
	$('#sesel').val(rm);
	$('#novel').html('');
	var source = '{{{scontent}}}';
	var template = Handlebars.compile(source);
	$('#novel').html(template(res));
	$('#stitle').html('');
	source = '{{stitle}}';
	template2 = Handlebars.compile(source);
	$('#stitle').html(template2(res));
	source = '{{upno}}';
	template3 = Handlebars.compile(source);
	var upno = template3(res);
	$.ajax({
		type:'GET',
		dataType:'json',
		url: 'getComment.kh?upno='+upno,
		success : change_comment
	});
}

function change_comment(res) {
	// 코멘트 바꾸기.
	$('.timeline .time_sub').remove();
	$('#comment').text('Comment (' + res.length + ')');
	
	$.each(res, function(index, value) {
		var source = '<li class="time_sub"  id="{{rno}}" style="list-style: none; clear:both; margin-top: 20px;">'
		 +'<div style="float:left; font-size:25px;"> <i class="icon-leaf"></i>{{id}}</div>'
		 +'<div style="float:right">{{newDate rdate}}</div>'
		 +'<div style="clear:both; font-size:18px; ">{{rtext}}'
		 +'<button style="float:right" class="btn btn-mini" type="button" id="{{rno}}">delete</button></div>'
	     +'</li>';
		var template = Handlebars.compile(source);
		$('.timeline').append(template(value));
	});
}

function reply_delete() {
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'deleteComment.kh',
			data : 'bno=${bno}&rno=' + this.getAttribute("id")+'&upno=${sdto.upno}',
			success : change_comment
		});
}

function reply_insert() {
	var replytext = $('#newReplyText').val();
	if(replytext == ''){
		alert('reply text를 작성하세요.');
		return false;
	}
	if(id==''){
		alert('로그인후 사용 가능한 기능입니다');
		return false;
	}
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : 'insertComment.kh',
		data:'bno=${bno}&upno=${sdto.upno}&rtext='+$('#newReplyText').val()+'&id=${sessionScope.id }',
		success : change_comment
	});
	$('#newReplyText').val('');
	
	
}

// http://handlebarsjs.com/
// config 패키지 안에 있는 test 파일
Handlebars.registerHelper("newDate",function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	if(month < 10){
		month = "0" + month;
	}
	var date = dateObj.getDate();
	return year + "/" +  month + "/" +  date;
});

Handlebars.registerHelper("newUpload",function(uploadFile){
	if(uploadFile!=null)
		return uploadFile.substring(uploadFile.indexOf("_")+1);
	else
		return uploadFile;
});
</script>

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    	<!-- header -->
    	<jsp:include page="khbooks_header.jsp"></jsp:include>
 
     
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->

        <!-- Page Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar" style="" id="serial-sidebar"><!-- Begin sidebar column -->

            <!--Latest News-->
            <h5 class="title-bg">현재 보고 있는 작품</h5>
            <ul class="popular-posts" id="bookInfo">
                <li>
                    <a href="#"><img src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post" id="bookImage"></a>
                    <h6><a href="#" id="bookTitle">제목</a></h6>
                    <h6 id="bookAuthor"></h6>
                </li>
            </ul>
            

            <!--Progress Bars-->
            <h5 class="title-bg">화수 작품 총 평점</h5> 
            <div class="progress progress-info progress-striped">
                <div class="bar" style="width: 20%"></div>
            </div>
           <!--  <div class="progress progress-success progress-striped">
                <div class="bar" style="width: 40%"></div>
            </div>
            <div class="progress progress-warning progress-striped">
                <div class="bar" style="width: 60%"></div>
            </div>
            <div class="progress progress-danger progress-striped">
                <div class="bar" style="width: 80%"></div>
            </div> -->

            <!--Testimonials-->
            <h5 class="title-bg">Testimonials</h5>
    
            <p class="quote-text side">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum."<cite>- Client Name, Big Company</cite></p>
        
            <p class="quote-text side">"Adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices."<cite>- Another Client Name, Big Company</cite></p>
                 

        </div><!-- End sidebar column -->
        
       	<div class="span2" id="blank" style="display:none;"></div>
        

        <!-- Page Content
        ================================================== --> 
        <div class="span8"><!--Begin page content column-->

            <h2 class="title-bg" id="stitle">${sdto.stitle}</h2>

			<div style="width: 100%;">
				<div style="width: 65%; height:650px; margin-left:15px; float: left; border: 2px solid #a9a9a9; background-color:#CEFBC9; overflow: scroll; word-wrap:break-word; font-size: 16px; user-select:none;" oncontextmenu="return false" id="novel">
					${sdto.scontent}
				</div>
				<div style="width: 25%; height: 300px; margin-left:30px; float: left; border: 2px solid black;">
            		<div align="center" id="secnt">${myCount} / ${totalCount}</div>
            		<div align="center">
            			<select style="width: 30%;" id="sesel">
            				<c:forEach begin="1" end="${totalCount}" var="i">
            					<c:choose>
            						<c:when test="${i == myCount}">
            							<option value="${i}" selected="selected">${i}</option>
            						</c:when>
            						<c:otherwise>
            							<option value="${i}">${i}</option>
            						</c:otherwise>
            					</c:choose>
            				</c:forEach>
            			</select>
            			<button class="btn btn-mini" style="margin-bottom: 8px;" id="go">GO</button>
            		</div>
            		<div align="center">
            			<select style="width: 30%;" id="gradesel">
            					<option selected="selected">5</option>
            					<option>4</option>
            					<option>3</option>
            					<option>2</option>
            					<option>1</option>
            			</select>
            			<button class="btn btn-mini" style="margin-bottom: 8px;" id="gradebtn">별점 주기</button>
            		</div>
            		<div align="center"><button class="btn btn-mini" id="prev">이전화</button><button class="btn btn-mini" id="next">다음화</button></div>
            		<div align="center"><button class="btn btn-mini" id="add">나의 서재에 추가</button></div>
            		<div align="center"><a href="favBookList.kh" id="myBook">나의 서재로 이동하기</a></div>
				</div>
			</div>
            
      		<!-- box box-success 시작 -->
	  <div class="box box-success" style="clear: both;">
	   <div class="box-header">
		 <h3 class="box-title" style="margin-left:3%; text-shadow: none;" id="comment">Comment (${fn:length(review)})</h3>
	   </div>
	   <div class="box-body">
	     <input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText" style="width: 78%; height: 100px; margin-left:3%; float:left;">
		<div class="box-footer" style="float:left; width: 17%;">
		 <button class="btn" type="button" id="replyAddBtn" style=" width:100%; height: 110px;">ADD REPLY</button>
		</div>		
	  </div>	
	  </div>
	  <!-- box box-success 끝 -->
            
            
	  <ul class="timeline" style="clear: both;">
	   <c:forEach items="${review}" var="rev">
		<li class="time_sub"  id="${rev.rno}" style="list-style: none; clear:both; padding-top: 20px;">
		 <div style="float:left; font-size:13px; width: 15%;"><div style=" font-size:20px;"><i class="icon-leaf"></i>${rev.id}</div>
		 <fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${rev.rdate}" />
		 <button class="btn btn-mini" type="button" id="${rev.rno}">delete</button></div>
		 <div style="float:right; font-size:16px; word-wrap:break-word; width: 85%;">${rev.rtext}</div>
	   </li>
	  </c:forEach>
	  </ul>
	  <div style="clear:both; margin-bottom: 20px"></div>

        </div> <!--End page content column--> 

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