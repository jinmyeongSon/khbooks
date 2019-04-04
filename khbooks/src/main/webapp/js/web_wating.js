jQuery(document).ready(function (jq) {
	var paymentStopMsg = "카카오페이 결제를 중단하시겠습니까?";
	// 결제 인증 check interval 3초
	var checkPaymentInterval = 3000;
	var setTimer = null;
	var clickedButton = false;
	var xhr = null;
	// 취소하기 confirm 창 on/off
	var cancelPopupOn = false;

	/* 사용자가 결제정보 입력하는 데
	 걸리는 시간을 10초로 가정하고
	 10초 후에 polling시작 */
	setTimeout(paymentPolling, 10000);

	// 결제인증 확인 polling
	function paymentPolling() {
		setTimer = setTimeout(checkPollingAjax, checkPaymentInterval);
	}

	function blockUserEvents() {
		$(".btn_submit").attr("disabled", "disabled");
		$(".btn_close").attr("disabled", "disabled");
	}

	jq('.btn_submit').click(function (evt) {
		evt.preventDefault();
		jq(evt.target).attr("disabled", "disabled");

		clearTimeout(setTimer);
		// 기존 ajax가 있으면, 종료
		if (xhr != null) {
            xhr.abort();
            xhr = null;
		}
		clickedButton = true;
		checkPollingAjax();
	});

	jq('.btn_close').click(function () {
		cancelPopupOn = true;
        teslaBaseCommon.payConfirm(paymentStopMsg,
			function(){return teslaCommonPayment.paymentStop(hash, isCancelPost, blockUserEvents, "#actionPost");},
			function () {
				cancelPopupOn = false;
			}
		);
	});
    var _isProcessing;
	function checkPollingAjax() {
		function readyAlert() {
            // 결제완료 버튼클릭, 결제인증 상태 아님
            if (clickedButton) {
                clickedButton = false;
                teslaBaseCommon.payAlert("아직 결제가 완료되지 않았습니다.");
                jq('.btn_submit').removeAttr("disabled", "disabled");
            }
        }

		if(_isProcessing){
            readyAlert();
            return;
		}
        _isProcessing = true;
		xhr = jq.ajax({
			url: "/paymentPage/" + hash + "/check",
			type: "GET",
			cache: false
		}).done(function (resp) {
			// 유효시간 초과
			if (resp.expired) {
				clearTimeout(setTimer);
				blockUserEvents();
				// 취소팝업 보여지고 있을 때
				if (cancelPopupOn) {
					$("body").removeClass("layer_on");
					$("#payConfirmDiv").addClass("hide");
				}
                teslaBaseCommon.payAlert("유효시간 초과로 결제할 수 없습니다.<br/>가맹점에서 다시 결제를 요청해주세요.",
					function(){return teslaCommonPayment.redirectToUrlWithMethod(isFailPost, failUrl, "#approvalPost");}
				);
			} else {
				// 결제인증 완료
				if (resp.status_result == "success") {
					clearTimeout(setTimer);
					// 결제완료,닫기 사용 막음
					blockUserEvents();
                    teslaCommonPayment.showSpin(".loading_layer");
					jq(".loading_layer").show();
					jq(".img_loading").show();
                    teslaCommonPayment.redirectToUrlWithMethod(isApprovalPost, resp.approval_url, "#approvalPost");
				} else if (resp.status_result == "cancel") {
					blockUserEvents();
                    teslaBaseCommon.payAlert("결제를 취소하셨습니다.",
						function(){return teslaCommonPayment.redirectToUrlWithMethod(isCancelPost, cancelUrl, "#approvalPost");}
					);
				} else if (resp.status_result == "completed") {
					blockUserEvents();
                    teslaBaseCommon.payAlert("종료된 요청입니다.",
						function() {return teslaCommonPayment.redirectToUrlWithMethod(isFailPost, failUrl, "#approvalPost");}
					);

				} else if (resp.status_result == "failPassword") {
					blockUserEvents();
                    teslaCommonPayment.redirectToUrlWithMethod(isFailPost, failUrl, "#approvalPost");

				} else {
                    readyAlert();
					paymentPolling();
				}
			}
		}).fail(function (xhr, textStatus, error) {
			/*
			 *	abuse case : tid convert, tid 조회 실패
			 *	or network issue
			 * */
		}).always(function () {
            _isProcessing = false;
        });
	}

});