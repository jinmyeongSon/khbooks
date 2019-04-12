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
.pagination{
text-align: center;
}
.pagination ul{
margin-left:0px;
}
table{
	width:650px;
	font-size:20px;
}
td{
	height:60px;
}
#ul{
margin-left:-70px;
text-align: center;

}
#au{
	font-size:20px;
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


$(document).ready(function () {
	var id = '${sessionScope.id}';
	if(id==''){
		alert('로그인을 해주세요.');
		location.href="loginForm.kh";
	}
	
	$(document).on('click','#deletebtn',function(){
		var del=confirm("정말 삭제 하시겠습니까 ?");
		if(del){
			var bno= $(this).parent().prev().val();
			$(this).parent().prev().prev().attr("action","favAuthorDelete.kh");
			$(this).parent().prev().prev().submit(); 
		}else{
			return false;
		}
	});
});

</script>
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
        <h2>관심 작가</h2>
  
                    <table>
                    	<thead>
							<tr>
								<th width="1%" ></th>
								<th width="10%">작가 이름</th>
								<th width="10%">작가 소개</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty aList}">
								<tr>
									<td colspan="3">저장된 데이터가 없습니다.</td>
								</tr>
								</c:when>
							<c:otherwise>
							<c:forEach var="dto" items="${aList}" >
								<tr>
									<form method="POST">
									<input type="hidden" value="${dto.auno }" name="num"/>
									<td><input class="icon-trash" style=" height:20px;" type="button" id="deletebtn"/></td>
									<td><a href="author.kh?auno=${dto.auno }">${dto.auname }</a></td>
									<td style="font-size: 15px; padding:10px;">${dto.auintro }</td>
									 <input type="hidden" name="currentPage" value="${pv.currentPage }"/>
									 </form>
								</tr>
								</c:forEach>
							</c:otherwise>
							</c:choose>
					 </tbody>
                    </table>
                   <!--  <button class="btn btn-inverse pull-left" id="deletebtn" type="button">삭제</button> -->
                    <c:if test="${not empty aList }">
                    
                    	<div class="pagination">
                	 <ul id="ul">
                	
                <c:choose>
                	<c:when test="${pv.currentPage==1}">
                		<li class="active"><a href="favAuthorList.kh?currentPage=1">Prev</a></li>
                	</c:when>
					<c:when test="${pv.currentPage>1&&pv.currentPage<pv.blockPage/2+2}">
                		<li><a href="favAuthorList.kh?currentPage=1">Prev</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="favAuthorList.kh?currentPage=${pv.currentPage-1}">Prev</a></li>
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
                		<a href="favAuthorList.kh?currentPage=${pv.currentPage + (i - 1)}">${pv.currentPage + (i-1)}</a></li>
                	</c:if>
                </c:forEach>
             
                <c:choose>
                	<c:when test="${pv.currentPage==pv.endPage}">
                		<li class="active"><a href="favAuthorList.kh?currentPage=${pv.endPage}">Next</a></li>
                	</c:when>
                	<c:when test="${pv.endPage-pv.currentPage > 0 && pv.endPage-pv.currentPage<pv.blockPage/2}">
                		<li><a href="favAuthorList.kh?currentPage=${pv.endPage}">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="favAuthorList.kh?currentPage=${pv.currentPage+pv.blockPage/2+1}">Next</a></li>
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
                <li><a href="memberInfor.kh"><i class="icon-plus-sign"></i>회원정보</a></li>
                <li><a href="favAuthorList.kh"><i class="icon-plus-sign"></i>관심작가</a></li>
                <li><a href="favBookList.kh"><i class="icon-plus-sign"></i>관심작품</a></li>
            </ul>
        </div><!-- End sidebar column -->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

    <!-- Footer Area
        ================================================== -->

	<jsp:include page="../khbooks_footer.jsp"/>

    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>
