// 로그인 버튼
function login() {
	if ($('#userId').val() == '') {
		alert("아이디를 입력하세요");
		return;
	}
	if ($('#password').val() == '') {
		alert("패스워드를 입력하세요");
		return;
	}
	
	let param = {"userId" : $("#userId").val(),
               "password" : $("#password").val()
               };

	$.ajax({
	   url: "/loginProcess",
	   data: param,
	   type: 'post',
	   success: function (result) {
	      confirmLogin(result);
	   },
	   error: function (request, status, error) {
	      console.log(error);
	   }
	})


}

function confirmLogin(vo) {
	if (vo.result) {
		location.href = "/admin";
	} else {
		alert(vo.msg);
	}
}

// 회원가입 패널 오픈
$(function() {
	$("#joinPanel").click(
			function() {
				const title = this.getAttribute('data-title');
				$('#panel-title').text(title);

				if (!$('#detailPanel').hasClass('open')) {
					$('#detailPanel').addClass('open');
					$('#detailPanel').animate({
						right : '0px'
					});

					let container_calc_w = $('#container').width()
							- $('#detailPanel').width() - 60;
					$('#container').animate({
						width : container_calc_w
					});
				}
			})
	$('#closeBtn').click(function() {
		let panel_calc_w = -($('#detailPanel').width() + 40);
		let continer_calc_w = $('#content-board').width() - 40;
		$('#detailPanel').animate({
			right : panel_calc_w
		});
		$('#container').animate({
			width : continer_calc_w
		});
		$('#detailPanel').removeClass('open');
	})

	let startX, containertWidth, panelWidth;

	$('#resizer').on('mousedown', function(e) {
		startX = e.clientX;
		containertWidth = $('#container').width();
		panelWidth = $('#detailPanel').width();
		$(window).on('mousemove', resize);
		$(window).on('mouseup', stopResize);
	});

	function resize(e) {
		let cb_width = $('#content-board').width();
		let dx = e.clientX - startX;
		let c_newWidth = containertWidth + dx + 10;
		let p_newWidth = cb_width - c_newWidth - 110;

		if (c_newWidth >= 450 && p_newWidth >= 450) {
			$('#container').width(c_newWidth);
			$('#detailPanel').width(p_newWidth);
		}
	}

	function stopResize() {
		$(window).off('mousemove', resize);
		$(window).off('mouseup', stopResize);
	}
})

// 회원가입 프로세스
function join() {
	if ($("#joinPassword").val() == $("#passwordCheck").val()) {
		if ($("#company").val() != null && $("#company").val() != '') {
			// joinform
			let param = {"userId" : $("#joinUserId").val(),
						"email" : $("#email").val(), 
		               	"password" : $("#joinPassword").val(),
		               	"userName" : $("#userName").val(),
		               	"companyCd" : $("#company").val()
		               	};

			$.ajax({
			   url: "/joinProcess",
			   data: param,
			   type: 'post',
			   success: function (result) {
			      joinProcess(result);
			   },
			   error: function (request, status, error) {
			      console.log(error);
			   }
			})
		} else {
			alert("회사를 선택해주세요.");
		}
	} else {
		alert("패스워드를 확인해주세요.");
	}
}
function joinProcess(vo) {
	if (vo.result) {
		alert(vo.msg);
		$('#joinform')[0].reset();
		$('#closeBtn').click();
	} else {
		alert(vo.msg);
	}
}

// 아이디 저장 프로세스
$(function() {
	var key = getCookie("savedId"); // savedId 라는 이름의 쿠키를 가져옮

	if (key != "") { // 쿠키가 존재하면 입력한 아이디 값을 쿠키값으로 설정
		$("#userId").val(key);
	}

	if ($("#userId").val() != "") { // 쿠키가 존재해서 아이디 값으로 할당돼있으면 체크박스 체크
		$("#rememberMe").attr("checked", true);
	}

	$("#rememberMe").change(function() {
		if ($("#rememberMe").is(":checked")) {
			setCookie("savedId", $("#userId").val(), 7); // 체크돼있으면 7일동안 입력한 아이디로 쿠키 저장
		} else {
			deleteCookie("savedId"); // 체크해제 시 쿠키삭제
		}
	});

	$("#userId").keyup(function() {
		if ($("#rememberMe").is(":checked")) { // 새로운 아이디 입력 후 체크돼있으면 입력된 아이디로 쿠키 저장
			setCookie("savedId", $("#userId").val(), 7);
		}
	});
})

function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays); // 쿠키 만료 날짜 설정
	// escape 함수를 사용하여 value를 인코딩, 만료 날짜를 문자열로 변환 후 쿠키 값을 구성
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue; // 쿠키 저장
}

function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1); // 만료 날짜를 현재 날짜 -1로 설정
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString(); // 쿠키 삭제
}

function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName); // 쿠키 문자열을 가져오고 지정한 cookieName을 찾음
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1)
			end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	} // cookieName을 찾으면 해당 쿠키의 값을 반환하고 쿠키가 존재하지 않으면 빈 문자열을 반환
	return unescape(cookieValue);
}

// 회사명 콤보박스
$(function() {
	$.ajax({
	   url: "/comp/getCompName",
	   type: 'post',
	   success: function (result) {
		   getCompName(result);
	   },
	   error: function (request, status, error) {
	      console.log(error);
	   }
	})
});

function getCompName(list) {
	var str;
	for (var i = 0; i < list.length; i++) {
		str += "<option value='"+list[i].companyCd+"'>"
				+ list[i].companyName + "</option>"
	}
	$("#company").append(str);
}

// 이메일 콤보박스 
$("#emailSelect").change(function(){
	$("#email").val($("#emailSelect").val());
	// 선택된 값이 빈 문자열이 아닌 경우
    if($("#emailSelect").val() != ""){
        $("#email").prop("readonly", true);
    } else {
        $("#email").prop("readonly", false);
    }
})