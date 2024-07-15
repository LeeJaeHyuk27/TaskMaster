
// Include Font Awesome
const link1 = document.createElement('link');
link1.rel = "stylesheet";
link1.href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css";
document.head.appendChild(link1);



	// 커밋 테스트
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