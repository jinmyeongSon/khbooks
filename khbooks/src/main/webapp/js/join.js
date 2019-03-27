$(document).ready(function() {
		$(function() {
			$("#accordion").accordion({
				heightStyle : "fill"
			});
			
			$("#accordion-resizer").resizable({
				minHeight : 140,
				minWidth : 200,
				resize : function() {
					$("#accordion").accordion("refresh");
				}
			});
		});

		$('#allChk').click(function() {
			if ($('#allChk').prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
		
		
		
		$('#idchk_btn').on('click', checkId);
	});//end ready

	
	function joinChk() {
		var pwd = $('#userPwd').val();
		var pwdchk = $('#userPwdChk').val();
		/* if($("input[type=radio]").prop("checked", false)){
			document.getElementById('noGen').innerHTML = '성별을 선택해 주세요.';
			return false;
		} */
		
		if(confirm("회원가입을 하시겠습니까?")){
	        if(idchk==0){
	            alert('아이디 중복체크를 해주세요');
	            return false;
	        }
	       
	        if(pwd.length < 9){
				alert("비밀번호를 8자리 이상 입력해주세요.");
				return false;
			}
			
			if (pwd != pwdchk) {
				document.getElementById('pwrong').innerHTML = '비밀번호가 틀렸습니다. 다시 입력해 주세요';
				return false;
			}
			
			if(!('input[name=ugender]:checked').val()){
				alert('성별을 선택해주세요.');
				return false;
			}
			
			alert("회원가입이 완료되었습니다.");
			
	    }else{
	    	return false;
	    }
		
		
	}//end join check


	var idchk = 0;
	function checkId() {
		var userId = $("#id").val();
		console.log(userId);
			$.ajax({
				async: true,
	            type : 'POST',
	            data : userId,
				url : 'checkId.kh',
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
				if(data.cnt > 0) {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				    idchk = 0;
				}else {
					alert("사용가능한 아이디입니다.");
					idchk = 1;
				}
			}

		});
	}
	
	
	
	