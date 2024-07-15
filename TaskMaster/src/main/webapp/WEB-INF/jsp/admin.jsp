<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="/resources/js/jquery-3.7.1.js"></script>
<script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/admin.css" rel="stylesheet" />
<script src="/resources/js/admin.js"></script>
</head>
<body>
	<div id="main-container">
	  <div id="main-header"></div>
		<div id="main-content">
			<div id="content-sidebar">
				<p>sidebar 영역</p>
			</div>
			<div id="content-board">
				<div id="container">
					<div id="item-container">
						<!-- 회사 인증 승인 탭 -->
						<ul class="nav nav-tabs nav-justified">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#allowCompany">회사 인증 승인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#userManaging">사용자 삭제</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#projectManaging">프로젝트 관리</a>
							</li>
						</ul>
						<div id="allowCompany" class="tab-pane fade show active">
							<table class="nav-tab-table">
								<colgroup>
									<col style="width: 10%">
									<col style="width: 20%">
									<col style="width: 45%">
									<col style="width: 25%">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align: center;">No</th>
										<th style="text-align: center;">사용자명</th>
										<th style="text-align: center;">이메일</th>
										<th style="text-align: center;">승인</th>
									</tr>
								</thead>
								<tbody id="allowCompanyTable">
								</tbody>
							</table>
						</div>
						<!-- 사용자 삭제 탭 -->
						<ul class="nav nav-tabs nav-justified">
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#allowCompany">회사 인증 승인</a></li>
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#userManaging">사용자 삭제</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#projectManaging">프로젝트 관리</a></li>
						</ul>
						<div id="userManaging" class="tab-pane fade show active"
							style="width: 100%;">
							<table class="nav-tab-table">
								<colgroup>
									<col style="width: 10%">
									<col style="width: 20%">
									<col style="width: 45%">
									<col style="width: 25%">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align: center;">No</th>
										<th style="text-align: center;">사용자명</th>
										<th style="text-align: center;">이메일</th>
										<th style="text-align: center;">삭제</th>
									</tr>
								</thead>
								<tbody id="userManagingTable">
								</tbody>
							</table>
						</div>
						<!-- 프로젝트 관리 탭 -->
						<ul class="nav nav-tabs nav-justified">
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#allowCompany">회사 인증 승인</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#userManaging">사용자 삭제</a></li>
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#projectManaging">프로젝트 관리</a></li>
						</ul>
						<div id="projectManaging" class="tab-pane fade show active"
							style="width: 100%;">
							<table class="nav-tab-table">
							</table>
						</div>
					</div>
				</div>

				<div class="panel" id="detailPanel">
					<div id="resizer"></div>
					<span class="close-btn" id="closeBtn"><ion-icon
							style="font-size: 24px;" name="chevron-forward-circle-outline"></ion-icon></span>
					<div id="panelContent">
						<div class="panel-content-div">
							<div id="panel-title-div">업무 제목</div>
							<div id="panel-title"></div>
						</div>
						<div class="panel-content-div">
							<div id="panel-period-div">업무 기간</div>
							<div id="panel-period"></div>
						</div>
						<div class="panel-content-div">
							<div id="panel-status-div">업무 상태</div>
							<div id="panel-status"></div>
						</div>
						<div class="panel-content-div">
							<div id="panel-progress-div">업무 진행도</div>
							<div id="panel-progress"></div>
						</div>
						<div class="panel-content-div">
							<div id="panel-admin-div">관리자</div>
							<div id="panel-admin"></div>
						</div>
						<div class="panel-content-div">
							<div id="panel-member-div">담당 멤버</div>
							<div id="panel-member"></div>
						</div>
						<div class="panel-content-div">
							<div id="panel-desc-div">업무 설명</div>
							<div id="panel-desc"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>