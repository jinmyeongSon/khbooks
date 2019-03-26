<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet" href="css/_button-group.css">
<link rel="stylesheet" href="css/_buttons.css">


<!-- JS
================================================== -->
<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.quicksand.js"></script>
<script src="js/jquery.custom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'noticeGet.kh',
		success : function(res){
			$.each(res, function(index, value) {
				var source = '<li><a href="noticeView.kh?currentPage=1&nnum={{nnum}}">{{bname}}</a></li>';
				var template = Handlebars.compile(source);
				$('#notice-list').append(template(value));
			});
		}
	});
	
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'twitterGet.kh',
		success : function(res){
			$.each(res, function(index, value) {
				var source = '<li><a href="javascript:void(window.open('+"'" +'https://twitter.com/khBooks1/'+"'"+","+"'"+'_blank'+"'"+'))"><div style="heigt=41px; width=100%; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">{{text}}</div></a></li>';
				var template = Handlebars.compile(source);
				$('#tweet-list').append(template(value));
			});
		}
	});
	
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'bookGet.kh',
		success : function(res){
			$.each(res, function(index, value) {
				var source = '<li><a href="bookDetail.kh?bno={{bno}}"><div style="height:60px; width:60px; overflow:hidden;" ><img src="img/gallery/flickr-img-1.jpg" rel="popover" title="{{bname}}" data-content="{{binfo}}" data-animation="true"></div></a></li>';
				var template = Handlebars.compile(source);
				$('#latest-novel').append(template(value));
			});
		}
	});
	
});


</script>


</head>
<body>
    <!-- Footer Area
        ================================================== -->
	<div class="footer-container"><!-- Begin Footer -->
    	<div class="container">
        	<div class="row footer-row">
                <div class="span3 footer-col">
                    <h5>About Us</h5>
                   <img src="img/khbooks_logo_dark.png" alt="KhBooks" /><br /><br />
                    <address>
                        <strong>Dev Team</strong><br />
                      	서울시 강남구 <br />
                      	테헤란로 14길 6<br />
                    </address>
                </div>
                <div class="span3 footer-col">
                    <h5>Latest Tweets</h5>
                    <ul class="post-list" id="tweet-list">
                    </ul>

                </div>
                <div class="span3 footer-col">
                    <h5>Notice</h5>
                     <ul class="post-list" id="notice-list">
                    </ul>
                </div>
                <div class="span3 footer-col">
                    <h5>New Novel</h5>
                    <ul class="img-feed" id="latest-novel">
                    </ul>
                </div>
            </div>

            <div class="row"><!-- Begin Sub Footer -->
                <div class="span12 footer-col footer-sub">
                    <div class="row no-margin">
                        <div class="span6"><span class="left">Copyright 2019 KH Books. All rights reserved.</span></div>
                        <div class="span6">
                            <span class="right">
                            <a href="mainpage.kh">메인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="bookMain.kh">작품</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="memberInfor.kh">회원 정보</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="noticeList.kh">게시판</a>
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