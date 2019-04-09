<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- CSS
================================================== -->
<!-- JS
================================================== -->
<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/jquery.custom.js"></script>
<script type="text/javascript">
var id ='';

$(document).ready(function(){
	var url = window.location.pathname;
	var split_start = url.lastIndexOf("/");
	var split_end = url.lastIndexOf(".");
	var split_url = url.substring(split_start, split_end);
	id='${sessionScope.id}';
/* 	alert(url);
	alert(split_start);
	alert(split_end);
	alert(split_url); */
	if(split_url=='/mainpage'){
		$(".book-list").attr('class','book-list');
		$(".board-list").attr('class','book-list dropdown');
		$(".profile").attr('class','profile dropdown');
		$(".mainpage").attr('class','mainpage active');
		$(".payment").attr('class','payment');
	}else if(split_url=='/bookMain'||split_url=='/bookSearch'||split_url=='/bookDetail'||split_url=='/serialView'){
		$(".mainpage").attr('class','mainpage');
		$(".board-list").attr('class','board-list dropdown');
		$(".profile").attr('class','profile dropdown');
 		$(".book-list").attr('class','book-list active');
		$(".payment").attr('class','payment');
	}else if(split_url=='/noticeList'||split_url=='/noticeWrite'||split_url=='/noticeView'||split_url=='/boardList'||split_url=='/boardWrite'){
		$(".mainpage").attr('class','mainpage');
		$(".book-list").attr('class','book-list');
		$(".profile").attr('class','profile dropdown');
		$(".board-list").attr('class','book-list dropdown active');
		$(".payment").attr('class','payment');
	}else if(split_url=='/memberInfor'||split_url=='/favAuthorList'||split_url=='/favBookList'){
		$(".mainpage").attr('class','mainpage');
		$(".book-list").attr('class','book-list');
		$(".board-list").attr('class','book-list dropdown');
		$(".profile").attr('class','profile dropdown active');
		$(".payment").attr('class','payment');

	}else if(split_url=='/payment'){
		$(".mainpage").attr('class','mainpage');
		$(".book-list").attr('class','book-list');
		$(".board-list").attr('class','book-list dropdown');
		$(".profile").attr('class','profile dropdown');
		$(".payment").attr('class','payment active');
	}
	
	if(id!=''){
		var point = '';
		point = '${sessionScope.point}';
		$("#userPoint").html('현재 포인트<br/>&nbsp;' +point+' 포인트');
	}
	
	
	
	});
		
	function list_reset(){
		$(".mainpage").attr('class','mainpage');
		$(".book-list").attr('class','book-list');
		$(".board-list").attr('class','board-list dropdown');
		$(".profile").attr('class','profile dropdown');
		$(".payment").attr('class','payment');

	}
</script>

</head>
<body>
      <div class="row header"><!-- Begin Header -->
        <!-- Logo
        ================================================== -->
        <div class="span6 logo">
        	<a href="mainpage.kh" style="width: 300px;"><img src="img/khbooks_logo.png" alt="for every novel" style="padding-right: 0px;"/></a>
            <h5 style="color: #333333; font-size: 25px;">For every Novel </h5>
        </div>
        
        <!-- Main Navigation
        ================================================== -->
        <div class="span6 navigation">
        	<div class="empty area" style="float: right; height: 30px; margin-bottom: 15px;">

        	</div>
        	
            <div class="navbar hidden-phone" style="clear: both;">
            <ul class="nav">
            <li class="mainpage"><a href="mainpage.kh" style=" font-weight: bold; font-size: 15px;">메인</a></li>
           	<li class="book-list"><a href="bookMain.kh" style=" font-weight: bold; font-size: 15px;">작품</a></li>
            <li class="board-list dropdown"><a href="noticeList.kh" style=" font-weight: bold; font-size: 15px;">게시판 <b class="caret"></b></a>
                <ul class="dropdown-menu" style="min-width: 80px;">
                    <li style="width: 100%;"><a href="noticeList.kh" style=" font-weight: bold; font-size: 13px;">공지 사항</a></li>
                    <li style="width: 100%;"><a href="boardList.kh" style=" font-weight: bold; font-size: 13px;">자유 게시판</a></li>
                </ul>
            </li>
           <li class="payment"><a href="payment.kh" style=" font-weight: bold; font-size: 15px;">포인트 샵</a></li>

           <c:choose>
             	<c:when test="${sessionScope.admin!=null}">
             		<li><a href="adminMain.kh" style=" font-weight: bold; font-size: 15px;">관리 페이지</a></li>
             		<li><a href="adminLogout.kh" style=" font-weight: bold; font-size: 15px;">로그아웃</a></li>
             	</c:when>
             	<c:when test="${sessionScope.id==null}">
             		<li><a href="loginForm.kh" style=" font-weight: bold; font-size: 15px;">로그인</a></li>
             		<li><a href="signUp.kh" style=" font-weight: bold; font-size: 15px;">회원가입</a></li>
             	</c:when>
             	<c:otherwise>
             		<li class="profile dropdown"><a href="memberInfor.kh" style=" font-weight: bold; font-size: 15px;">회원 정보 
	                <b class="caret"></b></a>
	                <ul class="dropdown-menu"  style="min-width: 80px;">
	                	<li ><a id="userPoint" style=" font-weight: bold; font-size: 13px;"></a></li>
	                    <li><a href="favBookList.kh" style=" font-weight: bold; font-size: 13px; width: 80px;">나의 관심 작품</a></li>
	                    <li><a href="favAuthorList.kh" style=" font-weight: bold; font-size: 13px;">나의 관심 작가</a></li>
	                </ul>
	                <li id="login-btn"><a href="logout.kh" style=" font-weight: bold; font-size: 15px;">로그 아웃</a></li>
             	</c:otherwise>
             </c:choose>
            </ul>
            </div>
        </div>
      </div><!-- End Header -->
     
    
</body>
</html>
