<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="/resources/js/jquery-3.7.1.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" />
<script src="/resources/js/login.js"></script>
</head>
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
</html>