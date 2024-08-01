<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<!-- css -->
<link href="/resources/css/admin.css" rel="stylesheet" />
<!-- js -->
<script src="/resources/js/jquery-3.7.1.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="/resources/js/pagination.js"></script>
<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="/resources/css/pagination.css" />
</head>
<body>

	<div id="main-container">
	  <div id="main-header"><%@ include file="layout/header.jsp" %></div>
		<div id="main-content">
			<div id="content-sidebar">
				<p>sidebar 영역</p>
			</div>
			<div id="content-board">
				<div id="container">
					<div id="item-container">
						<!-- 회사 인증 승인 탭 -->
						<ul id="allowCompany" class="nav-tabs">
						    <li><a class="active" href="#allowCompany">회사 인증 승인</a></li>
						    <li><a href="#userManaging">사용자 삭제</a></li>
						    <li><a href="#projectManaging">프로젝트 관리</a></li>
						</ul>
						<div class="tab-item">
							<table class="tab-table">
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
							<div id="allowCompany-pagination-container"></div>
						</div>
						<!-- 사용자 삭제 탭 -->
						<ul id="userManaging" class="nav-tabs">
						    <li><a href="#allowCompany">회사 인증 승인</a></li>
						    <li><a class="active" href="#userManaging">사용자 삭제</a></li>
						    <li><a href="#projectManaging">프로젝트 관리</a></li>
						</ul>
						<div class="tab-item"
							style="width: 100%;">
							<table class="tab-table">
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
							<div id="userManaging-pagination-container"></div>
						</div>
						<!-- 프로젝트 관리 탭 -->
						<ul id="projectManaging" class="nav-tabs">
						    <li><a href="#allowCompany">회사 인증 승인</a></li>
						    <li><a href="#userManaging">사용자 삭제</a></li>
						    <li><a class="active" href="#projectManaging">프로젝트 관리</a></li>
						</ul>
						<div class="tab-item"
							style="width: 100%;">
							<table class="tab-table">
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