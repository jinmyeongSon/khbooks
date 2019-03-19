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

$(document).ready(function(){
	bno=${bno};
	rm=${rm};
	totalCount=${totalCount};
	
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
	
	
	// 수정 모달 숨기기
	$('#modifyModal').addClass('modifyHide');
	// 댓글추가
	$("#replyAddBtn").on("click", reply_insert);
	$('#btnModify').on("click", function() {
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'replyUpdate.do',
			data : 'bno=${boardDTO.bno}&rno=' + urno + '&replytext=' + $('#updateReplyText').val(),
			success : reply_list_result
		});
		$('#updateReplyText').val('');
		$('#modifyModal').removeClass();
		$('#modifyModal').addClass('modifyHide');
	});
	$('#btnClose').on("click", function() {
		$('#updateReplyText').val('');
		$('#modifyModal').removeClass();
		$('#modifyModal').addClass('modifyHide');
	});
	// 수정 삭제 이벤트 동적 추가
	$(document).on('click', '.timeline button', reply_update_delete);
	
	//모달창에 수정버튼
	$('#btnModify').on('click',reply_update_send);
	

	
	
});
// 수정 , 삭제 버튼 이벤트
function reply_update_send(){
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'replyUpdate.do?bno=${boardDTO.bno}&rno='+urno+"&replytext="+$('#updateReplyText').val(),
		success : reply_list_result
	});
	$('#updateReplyText').val('');
/* 	$('#modifyModal').removeClass('modifyShow');
	$('#modifyModal').addClass('modifyHide'); */
	$('#modifyModal').removeClass('modifyShow').addClass('modifyHide');
	$(document).on('click','.timeline button',reply_update_delete);
	urno='';
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
		var source = '<li class="time_sub"  id="{{rno}}" style="list-style: none;">'
		 +'<div style="float:left; font-size:25px;"> <i class="icon-leaf"></i>{{id}}</div>'
		 +'<div style="float:right">{{newDate rdate}}</div>'
		 +'<div style="clear:both; font-size:18px; ">{{rtext}}</div>'
		 +'<p>'
		 +'<button class="btn btn-mini" type="button" id="{{rno}}">delete</button>'
		 +'<button class="btn btn-mini" type="button" id="{rno}}">update</button></p>'
	     +'</li>';
		var template = Handlebars.compile(source);
		$('.timeline').append(template(value));
	});
}

function reply_update_delete() {
	alert($(this).text());
	if($(this).text() == 'delete'){
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'deleteComment.kh',
			data : 'bno=${bno}&rno=' + this.getAttribute("id")+'&upno=${sdto.upno}',
			success : change_comment
		});
	}else if($(this).text() == 'update'){
		$('#modifyModal').removeClass();
		$('#modifyModal').addClass('modifyShow');
		$('#updateReplyText').focus();
		rno = this.getAttribute("id");
	}
}

function reply_insert() {
	var replytext = $('#newReplyText').val();
	if(replytext == ''){
		alert('reply text를 작성하세요.');
		return false;
	}
	
	
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url : 'insertComment.kh',
		data:'bno=${bno}&upno=${sdto.upno}&rtext='+$('#newReplyText').val()+'&id=a',
		success : change_comment
	});
	alert('입력까지옴')
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
    
      <div class="row header"><!-- Begin Header -->
      
        <!-- Logo
        ================================================== -->
        <div class="span5 logo">
        	<a href="index.htm"><img src="img/piccolo-logo.png" alt="" /></a>
            <h5>Big Things... Small Packages</h5>
        </div>
        
        <!-- Main Navigation
        ================================================== -->
        <div class="span7 navigation">
            <div class="navbar hidden-phone">
            
           <ul class="nav">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="index.htm">Home <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="index.htm">Full Page</a></li>
                    <li><a href="index-gallery.htm">Gallery Only</a></li>
                    <li><a href="index-slider.htm">Slider Only</a></li>
                </ul>
            </li>
           <li><a href="features.htm">Features</a></li>
            <li class="dropdown active">
                <a class="dropdown-toggle" data-toggle="dropdown" href="page-full-width.htm">Pages <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="page-full-width.htm">Full Width</a></li>
                    <li><a href="page-right-sidebar.htm">Right Sidebar</a></li>
                    <li><a href="page-left-sidebar.htm">Left Sidebar</a></li>
                    <li><a href="page-double-sidebar.htm">Double Sidebar</a></li>
                </ul>
            </li>
             <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="gallery-4col.htm">Gallery <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="gallery-3col.htm">Gallery 3 Column</a></li>
                    <li><a href="gallery-4col.htm">Gallery 4 Column</a></li>
                    <li><a href="gallery-6col.htm">Gallery 6 Column</a></li>
                    <li><a href="gallery-4col-circle.htm">Gallery 4 Round</a></li>
                    <li><a href="gallery-single.htm">Gallery Single</a></li>
                </ul>
             </li>
             <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="blog-style1.htm">Blog <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="blog-style1.htm">Blog Style 1</a></li>
                    <li><a href="blog-style2.htm">Blog Style 2</a></li>
                    <li><a href="blog-style3.htm">Blog Style 3</a></li>
                    <li><a href="blog-style4.htm">Blog Style 4</a></li>
                    <li><a href="blog-single.htm">Blog Single</a></li>
                </ul>
             </li>
             <li><a href="page-contact.htm">Contact</a></li>
            </ul>
           
            </div>

            <!-- Mobile Nav
            ================================================== -->
            <form action="#" id="mobile-nav" class="visible-phone">
                <div class="mobile-nav-select">
                <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
                    <option value="">Navigate...</option>
                    <option value="index.htm">Home</option>
                        <option value="index.htm">- Full Page</option>
                        <option value="index-gallery.htm">- Gallery Only</option>
                        <option value="index-slider.htm">- Slider Only</option>
                    <option value="features.htm">Features</option>
                    <option value="page-full-width.htm">Pages</option>
                        <option value="page-full-width.htm">- Full Width</option>
                        <option value="page-right-sidebar.htm">- Right Sidebar</option>
                        <option value="page-left-sidebar.htm">- Left Sidebar</option>
                        <option value="page-double-sidebar.htm">- Double Sidebar</option>
                    <option value="gallery-4col.htm">Gallery</option>
                        <option value="gallery-3col.htm">- 3 Column</option>
                        <option value="gallery-4col.htm">- 4 Column</option>
                        <option value="gallery-6col.htm">- 6 Column</option>
                        <option value="gallery-4col-circle.htm">- Gallery 4 Col Round</option>
                        <option value="gallery-single.htm">- Gallery Single</option>
                    <option value="blog-style1.htm">Blog</option>
                        <option value="blog-style1.htm">- Blog Style 1</option>
                        <option value="blog-style2.htm">- Blog Style 2</option>
                        <option value="blog-style3.htm">- Blog Style 3</option>
                        <option value="blog-style4.htm">- Blog Style 4</option>
                        <option value="blog-single.htm">- Blog Single</option>
                    <option value="page-contact.htm">Contact</option>
                </select>
                </div>
                </form>
            
        </div>
        
      </div><!-- End Header -->
     
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->

        <!-- Page Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar"><!-- Begin sidebar column -->

            <!--Latest News-->
            <h5 class="title-bg">Latest News</h5>
            <ul class="popular-posts">
                <li>
                    <a href="#"><img src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post"></a>
                    <h6><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elit</a></h6>
                    <em>Posted on 09/01/15</em>
                </li>
                <li>
                    <a href="#"><img src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post"></a>
                    <h6><a href="#">Nulla iaculis mattis lorem, quis gravida nunc iaculis</a></h6>
                    <em>Posted on 09/01/15</em>
                <li>
                    <a href="#"><img src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post"></a>
                    <h6><a href="#">Vivamus tincidunt sem eu magna varius elementum maecenas felis</a></h6>
                    <em>Posted on 09/01/15</em>
                </li>
            </ul>

            <!--Progress Bars-->
            <h5 class="title-bg">Progress Bars</h5> 
            <div class="progress progress-info progress-striped">
                <div class="bar" style="width: 20%"></div>
            </div>
            <div class="progress progress-success progress-striped">
                <div class="bar" style="width: 40%"></div>
            </div>
            <div class="progress progress-warning progress-striped">
                <div class="bar" style="width: 60%"></div>
            </div>
            <div class="progress progress-danger progress-striped">
                <div class="bar" style="width: 80%"></div>
            </div>

            <!--Testimonials-->
            <h5 class="title-bg">Testimonials</h5>
    
            <p class="quote-text side">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum."<cite>- Client Name, Big Company</cite></p>
        
            <p class="quote-text side">"Adipiscing elit. In interdum felis fermentum ipsum molestie sed porttitor ligula rutrum. Morbi blandit ultricies ultrices."<cite>- Another Client Name, Big Company</cite></p>
                

        </div><!-- End sidebar column -->

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
            			<select style="width: 30%;">
            					<option selected="selected">5</option>
            					<option>4</option>
            					<option>3</option>
            					<option>2</option>
            					<option>1</option>
            			</select>
            			<button class="btn btn-mini" style="margin-bottom: 8px;">별점 주기</button>
            		</div>
            		<div align="center"><button class="btn btn-mini" id="prev">이전화</button><button class="btn btn-mini" id="next">다음화</button></div>
            		<div align="center"><button class="btn btn-mini" id="add">나의 서재에 추가</button></div>
            		<div align="center"><a href="" id="myBook">나의 서재로 이동하기</a></div>
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
	  <!-- box box-success 끝 -->
            
            
	  <ul class="timeline" style="clear: both;">
	   <c:forEach items="${review}" var="rev">
		<li class="time_sub"  id="${rev.rno}" style="list-style: none;">
		 <div style="float:left; font-size:25px;"> <i class="icon-leaf"></i>${rev.id}</div>
		 <div style="float:right"><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${rev.rdate}" /></div>
		 <div style="clear:both; font-size:18px; ">${rev.rtext}</div>
		 <p>
		   <button class="btn btn-mini" type="button" id="${rev.rno}">delete</button>
		   <button class="btn btn-mini" type="button" id="${rev.rno}">update</button></p>
	   </li>
	  </c:forEach> 
	  </ul>

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