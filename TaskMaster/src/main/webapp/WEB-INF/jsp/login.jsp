<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<!--script src="https://code.jquery.com/jquery-3.6.4.min.js"></script-->
<!-- Template Main JS File -->
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>
</head>
<style>
body {
	background: linear-gradient(135deg, #ececec, #f5f5f5);
	font-family: 'Nunito', sans-serif;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	width: 400px;
	height: 450px;
	position: absolute;
	top: 23%;
	left: 38%;
}

.card-title {
	text-align: center;
	font-weight: 700;
	font-size: 1.8rem;
	color: #090E19;
}

.form-control {
	border-radius: 10px;
	padding: 15px;
	border: 1px solid #ddd;
	transition: all 0.3s ease;
}

.form-control:focus {
	border-color: #5a67d8;
	box-shadow: 0 0 5px rgba(90, 103, 216, 0.5);
}

.btn-primary {
	background-color: #090E19;
	border: none;
	border-radius: 10px;
	color: #ffffff;
	font-weight: 600;
	transition: background-color 0.3s ease;
	width: 350px;
	height: 40px;
}

.btn-primary:hover {
	background-color: #444444;
}

.btn-secondary {
	background-color: #ffffff;
	border: 1px solid #cccccc;
	border-radius: 10px;
	font-weight: 600;
	transition: background-color 0.3s ease;
	width: 350px;
	height: 40px;
}

.btn-secondary:hover {
	background-color: #e0e0e0;
	color: #000000;
}

.form-check-label {
	font-size: 0.9rem;
	color: #333;
}

.back-to-top {
	background-color: #5a67d8;
	color: #fff;
	border-radius: 50%;
	width: 40px;
	height: 40px;
}

.form-label {
	padding-left: 25px;
}

.panel {
	position: absolute;
	top: 0;
	right: -740px;
	width: 700px;
	height: calc(100% - 40px);
	padding: 20px;
	background-color: #f9f9f9;
	box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
	overflow-y: auto;
	z-index: 10;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.close-btn {
	display: inline-block;
	margin-bottom: 20px;
	color: #707070;
	cursor: pointer;
	border-radius: 5px;
}

.close-btn:hover {
	color: #333333;
	background-color: #dddddd;
}

.panel-content-title {
	height: 50px;
	padding: 10px 10px 0px 10px;
	margin: 10px;
	width: calc(100% - 40px);
	font-size: 1.2rem;
	border-bottom: 1px solid #d1d1d1;
	display: flex;
	gap: 30px;
}

.panel-joinContent {
	height: 25px;
	padding: 10px 10px 0px 10px;
	margin: 10px;
	width: calc(100% - 40px);
	font-size: 1rem;
	display: flex;
	gap: 10px;
	flex-direction: column;
	margin-bottom: 45px;
}

.joinInput {
	height: 25px;
	width: 150px;
	border-radius: 10px; /* 모서리를 둥글게 만들기 위해 추가 */
	border: 1px solid #ccc; /* 테두리 설정 */
}

.inputContainer {
	margin-top: -5px;
	display: flex;
	gap: 5px;
}

.panel-content-div>div {
	line-height: 50px;
}

.panel-content-div>div:nth-child(1) {
	width: 150px;
}

.joinBtn {
	background-color: #090E19;
	border: none;
	border-radius: 10px;
	color: #ffffff;
	font-weight: 600;
	transition: background-color 0.3s ease;
	width: 200px;
	height: 40px;
	position: absolute;
	top: 90%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.joinBtn:hover {
	background-color: #444444;
}

#resizer {
	position: absolute;
	width: 5px;
	height: 100%;
	left: 0;
	top: 0;
	cursor: col-resize;
	z-index: 20;
}

#resizer:hover {
	border-left: 3px solid #b9b9b9;
	box-shadow: -12px 0px 5px 4px rgb(0 0 0/ 50%);
}
</style>
<body style="overflow-x: hidden">
	<main>
		<div id="content-board">
			<div id="container">
				<div class="card">
					<div>
						<h5 class="card-title">Task Master</h5>
					</div>
					<form id="loginform">
						<div style="margin-bottom: 10px;">
							<label for="yourUsername" class="form-label">사용자ID</label>
							<div style="text-align: center;">
								<input type="text" style="width: 315px;" id="userId"
									name="userId" class="form-control" required>
							</div>
						</div>
						<div style="margin-bottom: 10px;">
							<label for="yourPassword" class="form-label">패스워드</label>
							<div style="text-align: center;">
								<input type="password" style="width: 315px;" id="password"
									name="password" class="form-control" required>
							</div>
						</div>
						<div style="padding-left: 25px; margin-bottom: 10px;">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="true"
									id="rememberMe"> <label class="form-check-label"
									for="rememberMe">기억하기</label>
							</div>
						</div>
						<div style="text-align: center; margin-bottom: 10px;">
							<button class="btn btn-primary w-100" type="button"
								onclick="login();">로그인</button>
						</div>
						<div style="text-align: center;">
							<button class="btn btn-secondary w-100" type="button"
								id="joinPanel">회원가입</button>
						</div>
					</form>
				</div>
				<div class="panel" id="detailPanel">
					<div id="resizer"></div>
					<span class="close-btn" id="closeBtn"> <ion-icon
							style="font-size: 24px;" name="chevron-forward-circle-outline"></ion-icon>
					</span>
					<form id="joinform">
						<div id="panelContent">
							<div class="panel-content-title">
								<div id="panel-title-div">회원가입</div>
								<div id="panel-title"></div>
							</div>
							<div class="panel-joinContent">
								<div>이메일</div>
								<div class="inputContainer">
									<input class="joinInput" type="text" id="joinUserId" name="userId">
									<input class="joinInput" type="text" id="email" name="email">
									<select class="joinInput" id="emailSelect" style="text-align: center;">
										<option value="">===직접 입력===</option>
										<option value="@gmail.com">@gmail.com</option>
										<option value="@naver.com">@naver.com</option>
										<option value="@nate.com">@nate.com</option>
										<option value="@daum.net">@daum.net</option>
									</select>
								</div>
							</div>
							<div class="panel-joinContent">
								<div>비밀번호</div>
								<div class="inputContainer">
									<input class="joinInput" type="password" id="joinPassword"
										name="password">
								</div>
							</div>
							<div class="panel-joinContent">
								<div>비밀번호 확인</div>
								<div class="inputContainer">
									<input class="joinInput" type="password" id="passwordCheck"
										name="passwordCheck">
								</div>
							</div>
							<div class="panel-joinContent">
								<div>사용자명</div>
								<div class="inputContainer">
									<input class="joinInput" type="text" id="userName" name="userName">
								</div>
							</div>
							<div class="panel-joinContent">
								<div>회사</div>
								<div class="inputContainer">
									<select class="joinInput" id="company" name="companyCd"
										style="text-align: center;">
										<option value=>=== 선택 ===</option>
									</select>
								</div>
							</div>
							<button class="joinBtn" type="button" onclick="join();">회원가입</button>
						</div>
					</form>
				</div>
				<form id="hiddenform">
					<input type='hidden' id='aaa' name='aaa'>
				</form>
			</div>
		</div>


	</main>

</body>


<script>
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
<<<<<<< HEAD
		call_server(loginform, "/loginProcess", confirmLogin);
<<<<<<< HEAD
	}
	
	function confirmLogin(vo){
        if(vo.result){
            location.href="/main";
        }else{
            alert(vo.msg);
        }
    }
=======
>>>>>>> refs/remotes/origin/main
=======
		
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

>>>>>>> branch 'main' of https://github.com/YoouHaa/TaskMaster.git

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
</script>
</html>