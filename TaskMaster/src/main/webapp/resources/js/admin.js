
// 회사 인증 승인/ 사용자 삭제 테이블
$(function (){
	$.ajax({
		   url: "/admin/getUserInfo",
		   type: 'post',
		   success: function (result) {
		      getUserInfo(result);
		   },
		   error: function (request, status, error) {
		      console.log(error);
		   }
		})
})

function getUserInfo(list){
	var ACT = 1;
	var UMT = 1;
	for(var i = 0; i < list.length; i++){
		if(list[i].authYn != "Y"){
			var str = "<tr>";
			str += "<td>"+(ACT)+"</td>";
			str += "<td>"+list[i].userName+"</td>";
			str += "<td>"+list[i].userId+"</td>";
			str += "<td><button class=\"btn btn-primary\" type=\"button\" onclick=\"allow('"+list[i].userId+"');\">승인</button></td>";	
			str += "</tr>";
			$("#allowCompanyTable").append(str);
			ACT++;
		}else{
			var str = "<tr>";
			str += "<td>"+(UMT)+"</td>";
			str += "<td>"+list[i].userName+"</td>";
			str += "<td>"+list[i].userId+"</td>";
			str += "<td><button class=\"btn btn-primary\" type=\"button\" onclick=\"dltUser('"+list[i].userId+"');\">삭제</button></td>";	
			str += "</tr>";
			$("#userManagingTable").append(str);
			UMT++;
		}
	}
}

// 회사 인증 승인
function allow(id){
	$.ajax({
		   url: "/admin/allowUser",
		   type: 'post',
		   data: { userId: id },
		   success: function (result) {
		      allowUser(result, id);
		   },
		   error: function (request, status, error) {
		      console.log(error);
		   }
		})
}

function allowUser(cnt, id){
	if(cnt > 0){
		alert("승인이 완료되었습니다.");
		$("#allowCompanyTable").find(`button[onclick="allow('${id}')"]`).closest("tr").remove();
		location.reload();
	}else{
		alert("승인이 실패되었습니다.");
	}
}

// 사용자 삭제
function dltUser(id){
	$.ajax({
		   url: "/admin/deleteUser",
		   type: 'post',
		   data: { userId: id },
		   success: function (result) {
		      deleteUser(result, id);
		   },
		   error: function (request, status, error) {
		      console.log(error);
		   }
		})
}

function deleteUser(cnt, id){
	if(cnt > 0){
		alert("사용자가 삭제되었습니다.");
		$("#userManagingTable").find(`button[onclick="allow('${id}')"]`).closest("tr").remove();
		location.reload();
	}else{
		alert("사용자가 삭제되었습니다.");
	}
}

// 프로젝트 생성 패널
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