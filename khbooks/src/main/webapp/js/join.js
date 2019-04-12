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
		$('#emailchk_btn').on('click', checkEmail);
	});//end ready

	
	function joinChk() {
		var pwd = $('#userPwd').val();
		var pwdchk = $('#userPwdChk').val();
		var regpw=/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		var regid= /^[0-9a-zA-Z]{4,20}$/;
/*
		document.getElementById('pwrong').innerHTML = '';
		document.getElementById('idwrong').innerHTML = '';*/

		if(confirm("회원가입을 하시겠습니까?")){
	        if(idchk==0){/*
	        	document.getElementById('idwrong').innerHTML = '아이디 중복체크를 해주세요.';*/
	        	alert("아이디 중복체크를 해주세요.");
	            return false;
	        }
	        
	        if(emailchk==0){
/*	        	document.getElementById('emailwrong').innerHTML = '이메일 중복체크를 해주세요.';
 */		     	alert("이메일 중복체크를 해주세요.")
	        	return false;
	        }
	        
	        if(!regid.test($("input[id='id']").val())){
/*	        	document.getElementById('idwrong').innerHTML = '아이디는 최소 4자 이상. 숫자, 영문만 입력이 가능합니다.';
*/	        	alert("아이디는 최소 4자 이상. 숫자, 영문만 입력이 가능합니다.")
	        	return false;
	        }
	       
	        if(pwd.length < 8){
				alert("비밀번호를 8자리 이상 입력해주세요.");
				return false;
			}
	        
	        if (pwd != pwdchk) {
/*				document.getElementById('pwrong').innerHTML = '비밀번호가 틀렸습니다. 다시 입력해 주세요';
*/				alert("비밀 번호와 비밀 번호 확인이 다릅니다. 다시 입력해 주세요.");
	        	return false;
			}
	        
	        if(!regpw.test($("input[id='userPwd']").val())){
/*	        	document.getElementById('pwrong').innerHTML = '특수문자, 문자, 숫자를 포함한 8자리 이상의 비밀번호를 작성해주세요.';
*/	        	alert("특수문자, 문자, 숫자를 포함한 8자리 이상의 비밀번호를 작성해주세요.");
	        	return false;
	        }
			
			if(!$("input[name='ugender']:checked").val()){
				alert('성별을 선택해주세요.');
				return false;
			}
			
			if(!$("input[id='c1']:checked").val()||!$("input[id='c2']:checked").val()){
				alert('필수 이용약관에 동의하셔야 회원가입이 완료됩니다.');
				return false
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
				if(data > 0) {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				    idchk = 0;
				}else {
					alert("사용가능한 아이디입니다.");
					idchk = 1;
				}
			}

		});
	}
	
	var emailchk = 0;
	function checkEmail(){
		var userEmail = $("#uemail").val();
		$.ajax({
			async: true,
			type : 'POST',
			data : userEmail,
			url : 'checkEmail.kh',
	        dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
			if(data > 0){
				alert("이메일이 존재합니다. 다른 이메일을 입력해주세요.");
	               emailchk = 0;
	        }else {
				alert("사용 가능한 이메일 입니다.");
	               emailchk = 1;
		        }
			}

		});
	}
	
	
	