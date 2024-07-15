<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MainPage</title>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

.modal {
	position: absolute;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: absolute;
	top: 50%;
	width: 200px;
	height: 400px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateY(-50%);
}

.card {
	border: 1px solid #ddd;
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
						<div class="card">
							<div style="padding-top: 20px;">
								<!-- General Form Elements -->
								<form id="searchform">
									<table class="col-lg-12">
										<tr>
											<td rowspan="1" style="text-align: right;">
												<button type="button" class="btn btn-info" id="newProject"
													data-title="프로젝트1" data-period="2023-01-01 ~ 2023-12-31"
													data-member="진행 중" data-desc="프로젝트 설명">프로젝트생성</button>
											</td>
										</tr>
									</table>
									<div class="favorite" style="padding: 10px;">
										<h2>즐겨찾기</h2>
										<div class="col-xxl-4 col-md-6" style="max-width: 300px;">
											<div class="card-body" style="padding: 10px;">
												<div style="padding: 5px;">
													<ion-icon name="star" style="color: gold; font-size: 24px;"
														onclick="toggleFavorite('project1', this)"></ion-icon>
													<span style="font-size: 14px;">프로젝트1</span> <i
														class="fa fa-pencil-square" aria-hidden="true"
														onclick="modal()"></i>
												</div>
												<div class="progress">
													<div class="rectangle">
														<div class="rectangle_bar"></div>
													</div>
													<input type="number" class="percentageInput" value="70"
														min="0" max="100" step="1">
												</div>
											</div>

										</div>
										<!-- End Sales Card -->
									</div>
									<div class="participating"  style="padding: 10px;">
										<h2>참여중인 프로젝트</h2>
										<div class="card-body" style="padding: 10px;">
											<div style="padding: 5px;">
												<i class="far fa-star" width="15px" height="15px"
													style="margin-bottom: 5px; cursor: pointer;" alt="star"
													id="star" onclick="toggleFavorite('project2', this)"></i> <span
													style="font-size: 14px;">프로젝트2</span> <i
													class="fa fa-pencil-square" aria-hidden="true"
													onclick="modal()"></i>
											</div>
											<div class="progress">
												<div class="rectangle">
													<div class="rectangle_bar"></div>
												</div>
												<input type="number" class="percentageInput" value="40"
													min="0" max="100" step="1">
											</div>
										</div>
										<div class="card-body" style="padding: 10px;">
											<div style="padding: 5px;">
												<i class="far fa-star" width="15px" height="15px"
													style="margin-bottom: 5px; cursor: pointer;" alt="star"
													id="star" onclick="toggleFavorite('project2', this)"></i> <span
													style="font-size: 14px;">프로젝트2</span> <i
													class="fa fa-pencil-square" aria-hidden="true"
													onclick="modal()"></i>
											</div>
											<div class="progress">
												<div class="rectangle">
													<div class="rectangle_bar"></div>
												</div>
												<input type="number" class="percentageInput" value="70"
													min="0" max="100" step="1">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>


						<div class="modal">
							<div class="modal fade" id="smallModal" tabindex="-1">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<table>
												<tr>
													<td><button type="button" onclick="bomDtlSearch();">프로젝트
															초대</button></td>
												</tr>
												<tr>
													<td><button type="button" onclick="bomDtlSearch();">프로젝트
															수정</button></td>
												</tr>
												<tr>
													<td><button type="button" onclick="bomDtlSearch();">프로젝트
															삭제</button></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- End Small Modal-->
						</div>
					</div>
				</div>

				<div class="panel" id="detailPanel">
					<div id="resizer"></div>
					<span class="close-btn" id="closeBtn"><ion-icon
							style="font-size: 24px;" name="chevron-forward-circle-outline"></ion-icon></span>
					<div id="panelContent">
						<form id="projectForm">
							<div class="input-group-title">
								<label for="projectTitle">프로젝트 제목</label> <input type="text"
									id="projectTitle" name="projectTitle">
							</div>
							<div class="input-group-from-to">
								<label for="projectPeriodFrom">프로젝트 기간</label> <input
									type="date" id="projectPeriodFrom" name="projectPeriodFrom">
								~ <input type="date" id="projectPeriodTo" name="projectPeriodTo">
							</div>
							<div class="input-group-member">
								<label for="projectMember">프로젝트 멤버</label> <input type="text"
									id="projectMember" name="projectMember">
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

<script>
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
        });
    </script>
<script>
	 $(function () {
	        $('#newProject').click(function () {
	            if (!$('#detailPanel').hasClass('open')) {
	                $('#detailPanel').addClass('open');
	                $('#detailPanel').animate({ right: '0px' });

	                let container_calc_w = $('#container').width() - $('#detailPanel').width() - 60;
	                $('#container').animate({ width: container_calc_w });
	            }
	        });

	        $('#closeBtn').click(function () {
	            let panel_calc_w = -($('#detailPanel').width() + 40);
	            let continer_calc_w = $('#content-board').width() - 40;
	            $('#detailPanel').animate({ right: panel_calc_w });
	            $('#container').animate({ width: continer_calc_w });
	            $('#detailPanel').removeClass('open');
	        });
	    });
	 
	

	 	const container = document.getElementById('progress');
	    $(document).ready(function () {
	        let isDragging = false;
	        let mouseXOffset = 0;
	        let $currentRectangle;
	        let $currentPercentageInput;

	        $('.percentageInput').each(function(index, item){
	            let percentage = $(this).val();
	            
	            if(percentage < 34){
	                $(this).siblings('.rectangle').css('backgroundColor', '#ff7b00b4');
	            }else if(percentage < 67){
	                $(this).siblings('.rectangle').css('backgroundColor', '#ffee00b4');
	            }else{
	                $(this).siblings('.rectangle').css('backgroundColor', '#73ff00b4');
	            }

	            if (percentage >= 99) {
	                percentage -= 2;
	            }
	            $(this).siblings('.rectangle').css('width', `${percentage}%`);
	        });

	        function updateRectangleWidth($input) {
	            let percentage = parseFloat($input.val());
	            if(isNaN(percentage)){
	                percentage = 0;
	                $input.siblings('.rectangle').css('backgroundColor', '#ff7b00b4');
	                $input.siblings('.rectangle').css('width', `0%`);
	            }

	            if (!isNaN(percentage) && percentage >= 0 && percentage <= 100) {
	                if(percentage < 34){
	                    $input.siblings('.rectangle').css('backgroundColor', '#ff7b00b4');
	                }else if(percentage < 67){
	                    $input.siblings('.rectangle').css('backgroundColor', '#ffee00b4');
	                }else{
	                    $input.siblings('.rectangle').css('backgroundColor', '#73ff00b4');
	                }

	                if (percentage >= 99) {
	                    percentage -= 2;
	                }
	                $input.siblings('.rectangle').css('width', `${percentage}%`);
	            }
	        }

	        $('.percentageInput').on('input', function () {
	            let inputVal = $(this).val();
	            
	            if(! /^[0-9]*$/.test(inputVal)) {
	                inputVal = 0;
	            }
	            if(inputVal > 100){
	                inputVal = 100;
	            }
	            
	            $(this).val(inputVal);
	            updateRectangleWidth($(this));
	        });

	        $('.rectangle_bar').on('mousedown', function (e) {
	            isDragging = true;
	            $currentRectangle = $(this).closest('.rectangle');
	            $currentPercentageInput = $currentRectangle.siblings('.percentageInput');
	            mouseXOffset = e.clientX - $(this).offset().left;
	        });

	        $(document).on('mousemove', function (e) {
	            if (!isDragging) return;
	            const $container = $currentRectangle.parent();
	            const containerLeft = $container.offset().left;
	            let mouseX = e.clientX;
	            if (mouseX < containerLeft) {
	                mouseX = containerLeft;
	            } else if (mouseX > containerLeft + $container.width()) {
	                mouseX = containerLeft + $container.width();
	            }
	            const offsetX = Math.min($container.width(), mouseX - containerLeft);
	            let percentage = ((offsetX / $container.width()) * 100).toFixed(0);
	            if (percentage >= 0 && percentage <= 100) {
	                $currentPercentageInput.val(percentage);
	                if(percentage < 34){
	                    $currentRectangle.css('backgroundColor', '#ff7b00b4');
	                }else if(percentage < 67){
	                    $currentRectangle.css('backgroundColor', '#ffee00b4');
	                }else{
	                    $currentRectangle.css('backgroundColor', '#73ff00b4');
	                }

	                if (percentage >= 99) {
	                    percentage -= 2;
	                }
	                $currentRectangle.css('width', `${percentage}%`);
	            }
	        });

	        $(document).on('mouseup', function () {
	            isDragging = false;
	        });
	    });
     
     //================================================

    	 
    	/*call_server(searchform, '/selectProject', selectProject);
     
    	function selectProject(list){
    		for (var i = 0; i < list.length; i++) {
    			str = "<tr>";
    			str += "<div class=\"card-body\" style=\"padding: 10px;\">";
    			str += "<div  style=\"padding: 5px;\">";
    			if(list[i].favoritesYn =="Y"){
  		      	str += "<ion-icon name=\"star\" style=\"color: gold; font-size: 24px;\" onclick=\"toggleFavorite('project1', this)\"></ion-icon>";
    			}else{
    				str +=  "<i class=\"far fa-star\" width=\"15px\" height=\"15px\" style=\"margin-bottom: 5px; cursor: pointer;\" alt=\"star\" id=\"star\" onclick=\"toggleFavorite('project2', this)\"></i>";
    			}
  		      	str += "<span style=\"font-size: 14px;\">"+list[i].projectName+"</span>";
  		      	str += "<i class=\"fa fa-pencil-square\" aria-hidden=\"true\" onclick =\"modal()\"></i>";
  		      	str += "</div>";
  		     	str += "<div id=\"progress\">";
  		      	str += "<div id=\"rectangle\" style=\"width: 10%;\"></div>";
  	            str += "<input type=\"number\" id=\"percentageInput\" value=\"list[i].taskProgress\" min=\"0\" max=\"100\" step=\"1\">";
  	            str += "</div>";
         		str += "</div>";
         		if(list[i].favoritesYn =="Y"){
         		$('#favorite').append(str);
         		}else{
         		$('#participating').append(str);
         		}
         		
         		function modal(){
         			$('#smallModal').modal('show');   			
         		}
         		
         		document.getElementById('toggleFavorite').addEventListener('change', function() {
                    if (this.checked) {
                        document.getElementById('favoritesYn').value = 'Y';
                        //아이콘 바꿔야함
                        return;
                    } else {
                        document.getElementById('favoritesYn').value = 'N';
                        return;
                    }
                }); */
         		
         		
    		
    	 
    	 
</script>

</html>