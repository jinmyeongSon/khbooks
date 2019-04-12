<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>KH BOOKs 코인충전</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->

<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<jsp:include page="../khbooks_header.jsp"/>

    
		<div class="row">
			
				<table class="table">
					<tr>
						<th>결제금액</th>
						<th>충전코인</th>
						<th></th>
					</tr>
					<tr>
						<td>10(테스트)</td>
						<td>30코인</td>
						<td><input type="radio" name="radio" value="10"></td>
					</tr>
					<tr>
						<td>3,000</td>
						<td>30코인</td>
						<td><input type="radio" name="radio" value="3000"></td>
					</tr>
					<tr>
						<td>5,000</td>
						<td>50코인</td>
						<td><input type="radio" name="radio" value="5000"></td>
					</tr>
					<tr>
						<td>7,000</td>
						<td>70코인</td>
						<td><input type="radio" name="radio" value="7000"></td>
					</tr>
					<tr>
						<td>10,000</td>
						<td>100코인</td>
						<td><input type="radio" name="radio" value="10000"></td>
					</tr>
					<tr>
						<td>30,000</td>
						<td>300코인</td>
						<td><input type="radio" name="radio" value="30000"></td>
					</tr>
					<tr>
						<td>50,000</td>
						<td>500코인</td>
						<td><input type="radio" name="radio" value="50000"></td>
					</tr>
					
				</table>
				
		 

				<div> 
					<button type="button" id="pay">카드결제</button>
					<button type="button" class="btn_pay btn_pay_hover" id="kakaopay_btn" onclick="payment();">카카오페이</button>
				</div>
		

		</div>

	</div>
	<!-- End Container -->

	<!-- Footer Area
        ================================================== -->
	<jsp:include page="../khbooks_footer.jsp"/>
	<!-- End Footer -->

	<!-- Scroll to Top -->
	<div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>

</body>


<script type="text/javascript">
	$(document).ready(function() {
		if($('input[type="radio"]:checked').val() !=null){
			alert($('input[type="radio"]:checked').val());
		}
		 
		
		$("#pay").click(function(){
			var coin = $('input[type="radio"]:checked').val();
			if(coin != null){
				
			$.ajax({
				url: 'paymentPro.kh',
	            method: 'GET',
	            dataType: 'json',
	            success : function(res){
	            	
	            	var IMP = window.IMP; // 생략가능
	    			IMP.init('imp39904934'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    			IMP.request_pay({
	    			    pg : 'inicis', // version 1.1.0부터 지원.
	    			    pay_method : 'card',
	    			    merchant_uid : 'merchant_' + new Date().getTime(),
	    			    name : '주문명:KH BOOKs 코인충전',
	    			    amount : coin,
	    			    buyer_email : res.uemail,
	    			    buyer_name : res.id,//https://ojava.tistory.com/124
	    			    buyer_tel : res.uphone,	    			    
	    			    m_redirect_url : 'http://localhost:8090/khbook/dsds.kh'
	    			}, function(rsp) {
	    			    if ( rsp.success ) {
	    			        var msg = '결제가 완료되었습니다.';
	    			    	$.ajax({
	    				        	url: 'dsds.kh?total_amount='+coin,
	    				            method: 'GET',
	    				            dataType: 'json',
	    				        });
	    			    } else {
	    			        var msg = '결제에 실패하였습니다.';
	    			        msg += '에러내용 : ' + rsp.error_msg;
	    			    }
	    			    alert(msg);
	    			});//end function(rsp)
	    			
	    		}//ens success
			});//end ajax
					}else {
						alert("결제금액을 선택해주세요");
					}
		});//end pay 
			
			
		
		
	
	
	});
	
	function payment(){
		$.ajax({
            url: 'searchOpen.kh?total_amount='+$('input[type="radio"]:checked').val(),
            method: 'POST',
            dataType: 'json',
            success: function(total){
            	window.open(total.next_redirect_pc_url, 'payment_popup', 'width=426,height=510,toolbar=no,location=no');
            }
        });
     
    }

</script>

</html>
