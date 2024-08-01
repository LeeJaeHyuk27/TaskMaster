<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="/resources/js/jquery-3.7.1.js"></script>
<!--script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"-->
<script src="/resources/js/main.js"></script>
<link href="/resources/css/main.css" rel="stylesheet" />
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
					<div class="card">
						<div style="padding-top: 20px;">
							<!-- General Form Elements -->
							<form id="searchform">
								<input type="hidden" id="favoritesYn" name="favoritesYn">
								<input type="hidden" id="projectSeq" name="projectSeq">
								<table>
									<tr>
										<td rowspan="1" style="text-align: right;">
											<button type="button" class="btn_modal" id="newProject"
												data-title="프로젝트1" data-period="2023-01-01 ~ 2023-12-31"
												data-member="진행 중" data-desc="프로젝트 설명">프로젝트생성</button>
										</td>
									</tr>
								</table>
								<div class="favorite" style="padding: 10px;">
									<h2>즐겨찾기</h2>

								</div>
								<div class="participating" style="padding: 10px;">
									<h2>참여중인 프로젝트</h2>

								</div>
							</form>
						</div>
					</div>
				</div>


				<div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h3>
									<input type="text" id="projectN" style="width: 150px;">
								</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<table>
									<tr>
										<td><button type="button" class="btn btn-primary"
												onclick="bomDtlSearch();">프로젝트 초대</button></td>
									</tr>
									<tr>
										<td><button type="button" class="btn btn-warning"
												onclick="bomDtlSearch();">프로젝트 수정</button></td>
									</tr>
									<tr>
										<td><button type="button" class="btn btn-danger"
												onclick="bomDtlSearch();">프로젝트 삭제</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div id="detailPanel" class="panel">
					<div id="resizer"></div>
					<span class="close-btn" id="closeBtn"><ion-icon
							style="font-size: 24px;" name="chevron-forward-circle-outline"></ion-icon>
					</span>
					<button type="button" id="registerBtn" onclick="newProjectAdd()">등록</button>
					<div id="panelContent">
						<form id="projectForm">
							<div class="input-group-title">
								<label for="projectTitle">프로젝트 제목</label> <input type="text"
									id="projectTitle" name="projectName">
							</div>
							<div class="input-group-from-to">
								<label for="projectPeriodFrom">프로젝트 기간</label> <input
									type="date" id="startDate" name="startDate"> ~ <input
									type="date" id="endDate" name="endDate">
							</div>
							<div class="input-group-member">
								<label for="projectMember">프로젝트 멤버</label>
								<div class="input-with-icon">
									<input type="text" id="projectMember" name="projectMember">
									<span class="search-icon"> <ion-icon id="searchMember"
											name="search-outline"></ion-icon>
									</span>
								</div>
							</div>
							<div class="input-group">
								<label for="projectDesc">프로젝트 설명</label>
								<textarea id="projectDesc" name="projectDesc" rows="5"
									maxlength="500"></textarea>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>