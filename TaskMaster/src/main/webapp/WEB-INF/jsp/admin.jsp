<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	padding: 0;
	margin: 0;
}

#container {
	width: calc(100% - 40px);
	height: calc(100% - 60px);
	overflow: auto;
	padding: 10px;
	margin: 20px 0px 20px 20px;
}

#item-container {
	padding: 10px;
	margin: 0;
	width: 900px;
}

#container::-webkit-scrollbar {
	width: 8px;
	height: 8px;
}

#container::-webkit-scrollbar-button {
	width: 8px;
	height: 8px;
}

#container::-webkit-scrollbar-corner {
	background: transparent;
}

#container::-webkit-scrollbar-thumb {
	background: #999999;
	border: 1px solid #999999;
	border-radius: 7px;
}

#container::-webkit-scrollbar-track {
	background: transparent;
	border: 0 none transparent;
}

.item {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 10px;
	cursor: pointer;
}

.item:hover {
	background-color: #f1f1f1;
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

#main-container {
	display: flex;
	flex-direction: column;
	width: 100%;
	height: 100vh;
	overflow-x: hidden;
}

#main-header {
	width: 100%;
	height: 80px;
	background-color: bisque;
	text-align: center;
	font-size: 2rem;
}

#main-content {
	display: flex;
	height: 100vh;
	width: 100%;
	overflow-x: hidden;
}

#content-sidebar {
	min-width: 280px;
	height: 100%;
	background-color: burlywood;
	text-align: center;
	font-size: 2rem;
	position: sticky;
	left: 0;
	top: 0;
}

#content-board {
	position: relative;
	flex-grow: 1;
	background: #ffffff;
}

.item_box {
	height: 80px;
}

.item_box2 {
	height: 150px;
	width: 400px;
}

.panel-content-div {
	height: 50px;
	padding: 10px 10px 0px 10px;
	margin: 10px;
	width: calc(100% - 40px);
	font-size: 1.2rem;
	border-bottom: 1px solid #d1d1d1;
	display: flex;
	gap: 30px;
}

.panel-content-div>div {
	line-height: 50px;
}

.panel-content-div>div:nth-child(1) {
	width: 150px;
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

.nav-tab-table {
    width: 100%;
    background-color: black;
    color: white;
}
</style>

<body>
	<div id="main-container">
		<div id="main-header">header 영역</div>
		<div id="main-content">
			<div id="content-sidebar">
				<p>sidebar 영역</p>
			</div>
			<div id="content-board">
				<div id="container">
					<div id="item-container">
						<!-- 회사 인증 승인 탭 -->
						<ul class="nav nav-tabs nav-justified nav-justified">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#allowCompany">회사 인증 승인</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#userManaging">사용자 삭제</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#projectManaging">프로젝트 관리</a></li>
						</ul>
						<div id="allowCompany" class="tab-pane fade show active">
							<table class="nav-tab-table">
								<colgroup>
									<col style="width: 10%">
									<col style="width: 60%">
									<col style="width: 15%">
									<col style="width: 15%">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align: center;">No</th>
										<th style="text-align: center;">사용자명</th>
										<th style="text-align: center;">이메일</th>
										<th style="text-align: center;">승인</th>
									</tr>
								</thead>
								<tbody id="tbody">
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
						<div id="#userManaging" class="tab-pane fade show active"
							style="width: 100%;">
							<table class="nav-tab-table">
								<colgroup>
									<col style="width: 10%">
									<col style="width: 60%">
									<col style="width: 15%">
									<col style="width: 15%">
								</colgroup>
								<thead>
									<tr>
										<th style="text-align: center;">No</th>
										<th style="text-align: center;">사용자명</th>
										<th style="text-align: center;">이메일</th>
										<th style="text-align: center;">삭제</th>
									</tr>
								</thead>
								<tbody id="tbody">
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
						<div id="#projectManaging" class="tab-pane fade show active"
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
<script>

	// 사용자 승인 테이블
	$(function (){
		$.ajax({
			   url: "/admin/getAllowUser",
			   type: 'post',
			   success: function (result) {
			      getAllowUser(result);
			   },
			   error: function (request, status, error) {
			      console.log(error);
			   }
			})
	})
	
	function getAllowUser(list){
		console.log(list);
	}
	$(document).ready(function() {
		$('.item').click(function() {
		const title = this.getAttribute('data-title');
		const period = this.getAttribute('data-period');
		const status = this.getAttribute('data-status');
		const progress = this.getAttribute('data-progress');
		const admin = this.getAttribute('data-admin');
		const member = this.getAttribute('data-member');
		const desc = this.getAttribute('data-desc');
		$('#panel-title').text(title);
		$('#panel-period').text(period);
		$('#panel-status').text(status);
		$('#panel-progress').text(progress);
		$('#panel-admin').text(admin);
		$('#panel-member').text(member);
		$('#panel-desc').text(desc);
	
		if (!$('#detailPanel').hasClass('open')) {
				$('#detailPanel').addClass('open');
				$('#detailPanel').animate({
					right : '0px'
				});
	
				let container_calc_w = $('#container').width()- $('#detailPanel').width() - 60;
				$('#container').animate({
					width : container_calc_w
				});
			}
		})

		$('#closeBtn').click(
				function() {
					let panel_calc_w = -($('#detailPanel')
							.width() + 40);
					let continer_calc_w = $('#content-board')
							.width() - 40;
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
	
	});
</script>

</html>