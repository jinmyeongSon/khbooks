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
border: 2px solid #a9a9a9;
border-radius: 6px;
text-align: center; 

}
#ul{
margin-left:290px;
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

</head>

<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    <!-- header -->
    	<jsp:include page="../khbooks_header.jsp"></jsp:include>
     
    <!-- Page Content
    ================================================== --> 
    <div class="row"><!--Container row-->

        <div class="span8 contact"><!--Begin page content column-->
         <h2>관심 작품</h2>
                    
                    <table >
                    	<thead>
							<tr >
								<th width="3%"></th>
								<th width="10%">작품 이름</th>
								<th width="10%">최신 업로드</th>
								<th width="10%">작품 평점</th>
								<th width="10%">작품 조회수</th>
								<th width="10%">연재 화수</th>
								<th width="10%">이동</th>
							</tr>
						</thead>
						<tbody >
							<c:choose>
								<c:when test="${empty aList}">
								<tr>
									<td colspan="7">저장된 데이터가 없습니다.</td>
								</tr>
								</c:when>
							
							<c:otherwise>
								<c:forEach var="dto" items="${aList}" >
							<tr >							
								<form method="POST">
								<input type="hidden" value="${dto.bno }" name="num"/>
								<td><input class="icon-trash" style="width:70%; height:90%;" type="button" id="deletebtn"/></td>
								<td style="width:500px;"><a href="http://localhost:8090/khbook/bookDetail.kh?bno=${dto.bno }">${dto.bname }</a></td>
								<td>${dto.bupdate }</td>
								<td>${dto.bgrade }</td>
								<td>${dto.bview }</td>
								<td>
								<select style="width: 100%;" >
										<c:forEach begin="1" end="${dto.count}" var="i">
												<option value="${dto.bno}">${i}</option>
										</c:forEach>
										</select>
									</td>
									<td><input type="button" value="이동" id="move"/></td>
									<input type="hidden" name="currentPage" value="${pv.currentPage }"/>
								</form>
								</tr>
							
							</c:forEach>
							</c:otherwise>
							</c:choose>
					 </tbody>
                    </table>
                  
                   <!--  <button class="btn btn-inverse pull-left" id="deletebtn" type="button">삭제</button> -->
                    <!-- Pagination -->
                <c:if test="${not empty aList }">
                
                	<div class="pagination">
                	 <ul id="ul">
                <c:choose>
                	<c:when test="${pv.currentPage==1}">
                		<li class="active"><a href="favBookList.kh?currentPage=1">Prev</a></li>
                	</c:when>
					<c:when test="${pv.currentPage>1&&pv.currentPage<pv.blockPage/2+2}">
                		<li><a href="favBookList.kh?currentPage=1">Prev</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="favBookList.kh?currentPage=${pv.currentPage-1}">Prev</a></li>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="i" begin="${-blockPage/2}" end="${pv.blockPage/2}" step="1" >
                	<c:if test="${(pv.currentPage+i-1)>0 && ((pv.currentPage+i-2)<(pv.endPage))}">
                		<c:choose>
                			<c:when test="${(i+pv.currentPage-1) == pv.currentPage}">
                				<li class="active">
                			</c:when>
                			<c:otherwise>
                				<li>
                			</c:otherwise>
                		</c:choose>
                		<a href="favBookList.kh?currentPage=${pv.currentPage + (i - 1)}">${pv.currentPage + (i-1)}</a></li>
                	</c:if>
                </c:forEach>
             
                <c:choose>
                	<c:when test="${pv.currentPage==pv.endPage}">
                		<li class="active"><a href="favBookList.kh?currentPage=${pv.endPage}">Next</a></li>
                	</c:when>
                	<c:when test="${pv.endPage-pv.currentPage > 0 && pv.endPage-pv.currentPage<pv.blockPage/2}">
                		<li><a href="favBookList.kh?currentPage=${pv.endPage}">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="favBookList.kh?currentPage=${pv.currentPage+pv.blockPage/2+1}">Next</a></li>
                	</c:otherwise>
                </c:choose>
                </ul>
       </div>
      
     </c:if>
   </div>
                    
           

        <!-- Sidebar
        ================================================== --> 
        <div class="span4 sidebar page-sidebar"><!-- Begin sidebar column -->
             <h5 class="title-bg">Categories</h5>
            <ul class="post-category-list">
                <li><a href="http://localhost:8090/khbook/memberInfor.kh"><i class="icon-plus-sign"></i>회원정보</a></li>
                <li><a href="http://localhost:8090/khbook/favAuthorList.kh"><i class="icon-plus-sign"></i>관심작가</a></li>
                <li><a href="http://localhost:8090/khbook/favBookList.kh"><i class="icon-plus-sign"></i>관심작품</a></li>
            </ul>
        </div><!-- End sidebar column -->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->

	<jsp:include page="../khbooks_footer.jsp"/>
    
</body>
<script type="text/javascript">
var id = '${sessionScope.id}';
$(document).ready(function () {
	if(id==''){
		alert('로그인을 해주세요.');
		location.href="loginForm.kh";
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
});

</script>
</html>
