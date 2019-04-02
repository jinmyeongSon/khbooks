<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

#novel {
	width: 65%;
	height: 650px;
	margin-left: 22px;
	padding: 10px;
	float: left;
	border: 2px solid #a9a9a9;
	background-color: #CEFBC9;
	overflow: scroll;
	word-wrap: break-word;
	font-size: 16px;
	user-select: none;
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
        <div class="span4 sidebar page-sidebar" style="display:none;" id="serial-sidebar"><!-- Begin sidebar column -->

            <!--Latest News-->
            <div style="height: 10px;"></div>
            <h5 class="title-bg">현재 보고 있는 작품</h5>
            <ul class="popular-posts" id="bookInfo">
                <li style="border-bottom: 0px solid;">
                    <a href="#"><img src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post" id="bookImage"></a>
                    <h6><a href="" id="bookTitle">제목</a></h6>
                    <h6 id="bookAuthor"></h6>
                </li>
            </ul>
            

            <!--Progress Bars-->
            <c:set var="sGrade" value="${sdto.sgrade*20}"/>
            <h5 class="title-bg" style="margin-top:0px;">이번 화 반응 </h5>
   			<c:choose>
            	<c:when test="${sGrade<=25}">
            		<div class="progress progress-danger progress-striped">
            	</c:when>
            	<c:when test="${sGrade<=50&&sGrade>25}">
           			<div class="progress progress-warning progress-striped">
            	</c:when>
            	<c:when test="${sGrade<=75&&sGrade>50}">
           			<div class="progress progress-success progress-striped">
            	</c:when>
            	<c:otherwise>
            		<div class="progress progress-info progress-striped">
            	</c:otherwise>
            </c:choose>
            	<div class="bar" style="" id="sGradeBar"></div>
            </div> 

        </div><!-- End sidebar column -->
        
       	<div class="span2" id="blank" style=""></div>
       
        

        <!-- Page Content
        ================================================== --> 
        <div class="span8"><!--Begin page content column-->

            <h4 class="title-bg" id="btitle" style="margin-left: 16px; margin-right: 22px;" ></h4>

			<div style="width: 100%;">
				<div oncontextmenu="return false" id="novel" >
					<p id="stitle" style="text-align: center; font-size: 20px; font-weight: bold;">${sdto.stitle}</p>
					<br/>
					<p id="context">${sdto.scontent}</p>
					
				</div>
				<div style="width: 22%;height: 270px;margin-left:23px;float: left;border: 2px solid #ddd;padding: 2px;padding-top: 6px;border-radius: 15px;background-color: #f5f5f5;">
            		<div align="center" id="secnt" style="font-size:20px; margin-top:5px; margin-bottom: 8px;">${myCount} / ${totalCount}</div>
            		<div align="center">
            			<select style="width: 40%;" id="sesel">
            				<c:forEach begin="1" end="${totalCount}" var="i">
            					<c:choose>
            						<c:when test="${i == myCount}">
            							<option value="${i}" selected="selected">${i}화</option>
            						</c:when>
            						<c:otherwise>
            							<option value="${i}">${i}화</option>
            						</c:otherwise>
            					</c:choose>
            				</c:forEach>
            			</select> 
            				<button class="btn" style="margin-bottom: 9px;" id="go">GO</button>
            		</div>
            		<div align="center">
            			<select style="width: 72%; margin-bottom: -1px;" id="gradesel">
            					<option selected="selected" value="5">★★★★★</option>
            					<option value="4">★★★★☆</option>
            					<option value="3">★★★☆☆</option>
            					<option value="2">★★☆☆☆</option>
            					<option value="1">★☆☆☆☆</option>
            			</select>
            		</div>
            		<div align="center">
            			<button class="btn" style="margin-top:0px; margin-bottom: 10px; width: 72%;" id="gradebtn">별점</button>
            		</div>
            		
            		<div align="center" style="margin-bottom: 13px;">
            			<button class="btn" id="prev" style="width:24%;"><img class="btn-img" style="width:auto; max-height: 100%;;" src="img/left_icon.png"></button>
            			<a href="bookDetai	l.kh?bno=${sdto.bno}"><button class="btn" id="prev" style="width:24%; padding:3px;"><img class="btn-img" style="width:auto; max-height: 100%;" src="img/book-main.png" ></button></a>
            			<button class="btn" id="next" style="width:24%;"><img class="btn-img" src="img/right_icon.png"></button>
            		</div>
            		<div align="center"><button class="btn" id="serialview-btn" style="width: 72%;">작품 정보 보기</button></div>
            		<div align="center" style="margin-top: -1px;" ><button class="btn" id="fbgo" style="width: 72%;">나의 관심 작품 </button></div>
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

	<jsp:include page="khbooks_footer.jsp"/>

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>

<script type="text/javascript">
var urno='';
var fileList='';
var bno='';
var rm='';
var totalCount='';
var id ='';
var sGrade = '';
var sideShow = 0;

$(document).ready(function(){
	bno=${bno};
	rm=${rm};
	totalCount=${totalCount};
	id='${sessionScope.id}';
	sGrade=${sdto.sgrade};
	
	$(document).scrollTop(200);
	
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : 'bookInfo.kh?bno='+bno,
		success : info_success
	})
	$('#add').on('click',function(){
		if(id==''){
			alert('로그인 후 이용하세요.');
		}else{
			$.ajax({
				type : 'GET',
				url : 'favinsert.kh?bno='+bno,
				success : function(res){
					if(res==0){
						alert('추가되었습니다.');
					}else{
						alert("이미추가된 항목입니다.");
						
					}
				}
			});
		}
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
			location.href='loginForm.kh';
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
	
	$("#sGradeBar").attr('style','width:'+sGrade*20+'%');	
	
	$("#serialview-btn").on("click",function(){
		if($(this).text()=="작품 정보 보기"){
			$("#serial-sidebar").attr("style","");
			$("#blank").attr("style","display:none");
			$(this).html("작품 정보 닫기");
		}else{
			$("#serial-sidebar").attr("style","display:none");
			$("#blank").attr("style","");
			$(this).html("작품 정보 보기");
		}
	})
	
	$("#fbgo").on("click",function(){
		if(id==''){
			alert("로그인 후 사용할수 있는 기능입니다.")
			location.href='loginForm.kh';
		}else{
			location.href='favBookList.kh';
		}
	});

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
		var check = confirm('변경하시겠습니까?');
		if(check){
			$.ajax({
				type : 'GET',
				dataType : 'text',
				url : 'gradeUpdate.kh',
				data : 'bno=' + bno + '&rm=' + rm + '&grade=' + grade,
				success : function(res) {
					alert('변경 완료');
				}
			});
		}else{
			alert("취소되었습니다.")
			return;
		}
	}
}

function info_success(res) {
		var source = '{{bname}}';
		var template = Handlebars.compile(source);
		$('#bookTitle').text(template(res));
		$('#btitle').text(template(res));
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
				url : 'authorBook.kh?auno=' + template(value)+'&bno='+bno,
				success : function(result) {
					var src = '<h5 class="title-bg">작가의 다른 작품</h5>'
		            	 +'<ul class="popular-posts">';
					$.each(result, function(idx, val) {
						source = '<li style="width:100px; display:inline-block; clear:both; border-bottom: 0px solid;"><a href="bookDetail.kh?bno={{bno}}"><div style="height:80px; width:80px; overflow:hidden; float:left; margin-right:5px;" title="{{bname}}" >'
						+'<img src="img/gallery/flickr-img-1.jpg"></div></a></li>';
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
	$('#stitle').text('');
	$('#context').text('');
	var source = '{{stitle}}';
	var template = Handlebars.compile(source);
	var source2 = '{{{scontent}}}';
	var template2 = Handlebars.compile(source2);
	$('#stitle').text(template(res));
	$('#context').html(template2(res));
	var source3 = '{{upno}}';
	var template3 = Handlebars.compile(source3);
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
		var source = '<li class="time_sub"  id="{{rno}}" style="list-style: none; clear:both; padding-top: 20px;">'
		 +'<div style="float:left; font-size:13px; width: 15%;"><div style=" font-size:20px;"> <i class="icon-leaf"></i>{{id}}</div>'
		 +'{{newDate rdate}}<br/>'
		 +'<button class="btn btn-mini" type="button" id="{{rno}}">delete</button></div>'
		 +'<div style="float:right; font-size:16px; word-wrap:break-word; width: 85%;">{{rtext}}</div>'
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
</html>