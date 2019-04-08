var userInfo = (function (jq) {
	"use strict";

	var validTel = false;
	var validBirthDate = false;
	var validSubmit = false;
	var paymentStopMsg = "카카오페이 결제를 중단하시겠습니까?";

	function eventBind() {
		jq("#tfPhone").on('focus', activateInput);
		jq("#tfPhone").on('blur', inactivateInput);
		jq("#tfBirthday").on('focus', activateInput);
		jq("#tfBirthday").on('blur', inactivateInput);
		/*[-
		 *	입력 필드 변경,keyup,붙여넣기,input,cut 이벤트 시
		 *	validate format
		 * -]*/
		jq("#tfPhone").on("change keyup paste input cut", checkTelFormat);
		jq("#tfBirthday").on("change keyup paste input cut", checkBirthdayFormat);

		/*[-
		 *	핸드폰번호, 생년월일 제출
		 * -]*/
		jq("#userPost").submit(function (e) {
			var tel = jq("#tfPhone").val();
			
			e.preventDefault();
			sendUserInfo(tel);
		});

		jq(".btn_close").on('click', function () {
            teslaBaseCommon.payConfirm(paymentStopMsg,
				function(){return teslaCommonPayment.paymentStop(hash, isCancelPost, blockUserEvents, "#actionPost");}
			);
		});
	}

	function activateInput(e) {
		jq(e.target).parent().toggleClass("data_focus");
	}

	function inactivateInput(e) {
		jq(e.target).parent().removeClass("data_focus");
	}

	function isValidTel(tel) {
		var regexTel = /^0\d{9,10}$/;
		if (regexTel.test(tel)) {
			validTel = true;
		} else {
			validTel = false;
		}
	}

	function isValidBirthday(birthDay) {
		var regexBirthDay = /^\d{6}$/;
		if (regexBirthDay.test(birthDay)) {
			validBirthDate = true;
		} else {
			validBirthDate = false;
		}
	}

	function updateSubmitStatus() {
		if (validTel === true && validBirthDate === true) {
			validSubmit = true;
			jq(".btn_submit").removeAttr("disabled");
		} else {
			validSubmit = false;
			jq(".btn_submit").attr("disabled", "disabled");
		}
	}

	function checkTelFormat(e) {
		var tel = jq(this).val();
		isValidTel(tel);
		updateSubmitStatus();
	}

	function checkBirthdayFormat(e) {
		var birthDay = jq(this).val();
		isValidBirthday(birthDay);
		updateSubmitStatus();
	}

	/*function blockUserEvents() {
		$("#userPost").attr("disabled");
		$(".btn_close").click(
			function (e) {
				e.preventDefault();
			}
		)
	}*/

	function sendUserInfo(tel) {
		var tmsInfo = $('#tfPhone').val();
		var formData = new FormData();
		
		formData.append('tel', tmsInfo);
		jq.ajax({
			type: "POST",
			url : 'paymentPro.kh',
			data: formData
		}).done(function (data, status) {
			/*[- *	동일 url GET 요청 * -]*/
			location.reload(true);
			alert('awfaw');
		}).fail(function ($xhr, status) {
			var response = $xhr.responseJSON;
			alert(formData);

			if ($xhr.status == 500) {
                teslaBaseCommon.payAlert(response.client_message,
                    function() {return teslaCommonPayment.redirectToUrlWithMethod(isFailPost, failUrl, "#actionPost");}
                );
            }

            teslaBaseCommon.payAlert(response.client_message);
		})
	}

	return {
		"eventBind": eventBind
	}

})(jQuery);
jQuery(document).ready(function () {
	userInfo.eventBind();
});