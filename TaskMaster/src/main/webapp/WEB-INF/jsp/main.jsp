<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
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
	width: 1400px;
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

.input-group-from-to textarea {
	padding: 4px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 45px;
}

.input-group-title input {
	padding: 4px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 10px;
	margin-bottom: 45px;
}

.input-group {
	display: flex;
	flex-direction: column;
}

.input-group label {
	margin-bottom: 10px;
}

.input-group-from-to input, .input-group input, .input-group textarea {
	padding: 8px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 10px;
	margin-bottom: 45px;
}

.input-group textarea {
	border-radius: 30px;
	resize: none;
}

.input-group-member input {
	height: 70px;
	width: 610px;
	padding: 4px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 30px;
	margin-bottom: 45px;
}

.card {
	border: 1px solid #ddd;
	border-radius: 5px;
	max-width: 920px;
	height: 400px;
	width: 900px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-body {
	align-items: center;
	justify-content: space-between;
	height: 100px;
	width: 200px;
	border: 1px solid black;
	display: inline-block;
}

.card-body img {
	cursor: pointer;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.main_container {
	position: relative;
	width: 130px;
	height: 5ch;
	margin: 0 auto;
}

.progress {
	width: 120px;
	height: 20px;
	border: 1px solid #ddd;
	border-radius: 2px;
	background-color: #ddd;
	position: relative;
	overflow: hidden;
	display: flex;
	margin: 20px auto;
}

.rectangle {
	width: 12px;
	height: 90%;
	border: 1px solid #fff;
	border-radius: 2px;
	background-color: #ff7b00b4;
	position: absolute;
	bottom: 0;
	transition: 0.2s;
}

.percentageInput {
	position: relative;
	background-color: rgba(255, 0, 0, 0);
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	width: 20px;
	height: 10px;
	margin: auto auto;
	border: 0;
	outline: none;
}

.rectangle_bar {
	position: absolute;
	height: 100%;
	width: 5px;
	right: 0;
	cursor: ew-resize;
}

.project-name {
	font-size: 14px;
	text-align: center;
}

.card-body>div {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.btn_modal {
	background-color: #4CAF50; /* 녹색 배경 */
	border: none; /* 테두리 제거 */
	color: white; /* 흰색 텍스트 */
	padding: 10px 20px; /* 패딩 */
	text-align: center; /* 텍스트 중앙 정렬 */
	text-decoration: none; /* 밑줄 제거 */
	display: inline-block; /* 인라인 블록으로 설정 */
	font-size: 16px; /* 폰트 크기 증가 */
	margin: 4px 2px; /* 여백 추가 */
	cursor: pointer; /* 마우스 커서 포인터로 변경 */
	border-radius: 5px; /* 둥근 모서리 */
	position: absolute;
	right: 20px;
	top: 20px;
}

.modal-content {
	width: 180px;
	height: 250px;
}

#registerBtn { /*페널안등록버튼*/
	position: absolute;
	width: 120px;
	height: 30px;
	top: 10px;
	right: 10px;
	padding: 5px 10px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
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

<script src="/assets/js/common.js"></script>

<script>
	$(function() {
		$('#newProject').click(
				function() {
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
				});

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
		});
	});

	$(document)
			.ready(
					function() {
						let isDragging = false;
						let mouseXOffset = 0;
						let $currentRectangle;
						let $currentPercentageInput;

						$('.percentageInput')
								.each(
										function(index, item) {
											let percentage = $(this).val();

											if (percentage < 34) {
												$(this).siblings('.rectangle')
														.css('backgroundColor',
																'#ff7b00b4');
											} else if (percentage < 67) {
												$(this).siblings('.rectangle')
														.css('backgroundColor',
																'#ffee00b4');
											} else {
												$(this).siblings('.rectangle')
														.css('backgroundColor',
																'#73ff00b4');
											}

											if (percentage >= 99) {
												percentage -= 2;
											}
											$(this).siblings('.rectangle').css(
													'width', '${percentage}%');
										});

						function updateRectangleWidth($input) {
							let percentage = parseFloat($input.val());
							if (isNaN(percentage)) {
								percentage = 0;
								$input.siblings('.rectangle').css(
										'backgroundColor', '#ff7b00b4');
								$input.siblings('.rectangle')
										.css('width', '0%');
							}

							if (!isNaN(percentage) && percentage >= 0
									&& percentage <= 100) {
								if (percentage < 34) {
									$input.siblings('.rectangle').css(
											'backgroundColor', '#ff7b00b4');
								} else if (percentage < 67) {
									$input.siblings('.rectangle').css(
											'backgroundColor', '#ffee00b4');
								} else {
									$input.siblings('.rectangle').css(
											'backgroundColor', '#73ff00b4');
								}

								if (percentage >= 99) {
									percentage -= 2;
								}
								$input.siblings('.rectangle').css('width',
										'${percentage}%');
							}
						}

						$('.percentageInput').on('input', function() {
							let inputVal = $(this).val();

							if (!/^[0-9]*$/.test(inputVal)) {
								inputVal = 0;
							}
							if (inputVal > 100) {
								inputVal = 100;
							}

							$(this).val(inputVal);
							updateRectangleWidth($(this));
						});

						$('.rectangle_bar').on(
								'mousedown',
								function(e) {
									isDragging = true;
									$currentRectangle = $(this).closest(
											'.rectangle');
									$currentPercentageInput = $currentRectangle
											.siblings('.percentageInput');
									mouseXOffset = e.clientX
											- $(this).offset().left;
								});

						$(document)
								.on(
										'mousemove',
										function(e) {
											if (!isDragging)
												return;
											const $progress = $currentRectangle
													.parent();
											const containerLeft = $progress
													.offset().left;
											let mouseX = e.clientX;
											if (mouseX < containerLeft) {
												mouseX = containerLeft;
											} else if (mouseX > containerLeft
													+ $progress.width()) {
												mouseX = containerLeft
														+ $progress.width();
											}
											const offsetX = Math.min($progress
													.width(), mouseX
													- containerLeft);
											let percentage = ((offsetX / $progress
													.width()) * 100).toFixed(0);
											if (percentage >= 0
													&& percentage <= 100) {
												$currentPercentageInput
														.val(percentage);
												if (percentage < 34) {
													$currentRectangle.css(
															'backgroundColor',
															'#ff7b00b4');
												} else if (percentage < 67) {
													$currentRectangle.css(
															'backgroundColor',
															'#ffee00b4');
												} else {
													$currentRectangle.css(
															'backgroundColor',
															'#73ff00b4');
												}

												if (percentage >= 99) {
													percentage -= 2;
												}
												$currentRectangle.css('width',
														`${percentage}%`);
											}
										});

						$(document).on('mouseup', function() {
							isDragging = false;
						});
					});

	//================================================

	$(function() {
		let param = {
			"userId" : $("#userId").val()
		};

		$.ajax({
			data : param,
			type : "POST",
			url : "/selectProject",
			cache : false,
			processData : false,
			contentType : false,
			success : function(result) {
				selectProject(result);
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
	})

	function selectProject(list) {
		console.log(list);
		//var str;
		for (var i = 0; i < list.length; i++) {
			var str = "";
			str += "<div class=\"card-body\" style=\"padding: 10px;\">";
			str += "<div style=\"padding: 5px;\">";

			if (list[i].favoritesYn == "Y") {
				str += "<ion-icon name=\"star\" style=\"color: gold; font-size: 24px;\" onclick=\"star(this,"
						+ list[i].projectYn
						+ ","
						+ list[i].projectSeq
						+ ")\"></ion-icon>";
			} else {
				str += "<ion-icon name=\"star-outline\" style=\"color: black; font-size: 24px;\" onclick=\"emptyStar(this,"
						+ list[i].projectYn
						+ ","
						+ list[i].projectSeq
						+ ")\"></ion-icon>";
			}

			str += "<span class=\"project-name\">" + list[i].projectName
					+ "</span>";
			str += "<i class=\"fa fa-pencil-square\" aria-hidden=\"true\" onclick=\"smallmodal('"
					+ list[i].projectName
					+ "' ,'"
					+ list[i].favoritesYn
					+ "');\" style=\"margin-left: 10px;\"></i>";
			str += "</div>";
			str += "<div class=\"progress\">";
			if (list[i].taskProgress == null || list[i].taskProgress == "") {
				str += "<div class=\"rectangle\" style=\"width:0%;\"><div class=\"rectangle_bar\"></div></div>";
			} else {
				str += "<div class=\"rectangle\" style=\"width: "
						+ list[i].taskProgress
						+ "%;\"><div class=\"rectangle_bar\"></div></div>";
			}
			if (list[i].taskProgress == null || list[i].taskProgress == "") {
				str += "<input type=\"number\" class=\"percentageInput\" value=\"0\" min=\"0\" max=\"100\" step=\"1\">";
			} else {
				str += "<input type=\"number\" class=\"percentageInput\" value=\"" + list[i].taskProgress + "\" min=\"0\" max=\"100\" step=\"1\">";
			}
			str += "</div>";
			str += "</div>";
			console.log(str);

			if (list[i].favoritesYn == "Y") {
				$('.favorite').append(str);
			} else {
				$('.participating').append(str);
			}
		}
	}

	function star(element, yn, seq) {
		element.setAttribute('name', 'star-outline');
		element.style.color = 'black';
		element.setAttribute('onclick', 'emptyStar(this)');

		const cardBody = element.closest('.card-body');
		document.querySelector('.participating').appendChild(cardBody);

		$("#favoritesYn").val(yn);
		$("#projectSeq").val(seq);

		let param = {
			"favoritesYn" : yn,
			"userId" : $("#userId").val(),
			"projectSeq" : seq
		};

		$.ajax({
			data : param,
			type : "POST",
			url : "/updateFavoritesYn",
			cache : false,
			success : function(result) {
				selectProject(result);
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
	}

	function emptyStar(element, yn, seq) {
		// 아이콘을 변경하고 색상을 업데이트합니다.
		element.setAttribute('name', 'star');
		element.style.color = 'gold';
		element.setAttribute('onclick', 'star(this)');

		// favoritesYn 속성을 Y로 변경하고 섹션을 이동합니다.
		const cardBody = element.closest('.card-body');
		document.querySelector('.favorite').appendChild(cardBody);

		$("#favoritesYn").val(yn);
		$("#projectSeq").val(seq);

		let param = {
			"favoritesYn" : yn,
			"userId" : $("#userId").val(),
			"projectSeq" : seq
		};
		$.ajax({
			data : param,
			type : "POST",
			url : "/updateFavoritesYn",
			cache : false,
			success : function(result) {
				selectProject(result);
			},
			error : function(request, status, error) {
				console.log(error);
			}
		});
	}

	function smallmodal(name) {
		$('#projectN').val(name);
		console.log($('#projectN').val());
		$('#smallModal').modal('show');
	}

	function newProjectAdd() {
		$(function() {
			let formData = new FormData(document.getElementById('projectForm'));

			$.ajax({
				data : formData,
				type : "POST",
				url : "/insertNewProject",
				processData : false, // FormData 객체를 변환하지 않음
				contentType : false, // jQuery가 Content-Type 헤더를 설정하지 않음
				success : function(result) {
					selectProject(result);
				},
				error : function(request, status, error) {
					console.log(error);
				}
			});
		})
	}
</script>

</html>