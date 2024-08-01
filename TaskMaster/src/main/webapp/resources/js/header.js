$(document).ready(function() {
    var profileDropdown = $('#profileDropdown');
    var profileMenu = $('#profileMenu');
    var dropdownIcon = profileDropdown.find('.dropdown-icon');

    profileDropdown.on('click', function(event) {
        event.preventDefault();

        // 드롭다운 메뉴 토글
        profileMenu.toggleClass('show');

        // 아이콘 회전 클래스 토글
        dropdownIcon.toggleClass('rotate');
        
    });
	
    // 문서의 다른 곳을 클릭했을 때, 드롭다운 메뉴 닫기
    $(document).on('click', function(event) {
        // 프로필 드롭다운을 클릭한 경우 무시
        if (!profileDropdown.is(event.target) && profileDropdown.has(event.target).length === 0) {
            // 드롭다운 메뉴 닫기
            profileMenu.removeClass('show');
            // 아이콘 회전 클래스 제거
            dropdownIcon.removeClass('rotate');
        }
    });
    
    let userId = $("#userId").val();
    
    $.ajax({
            url: "/getAlarm_test",
            data: {
                    "userId" : userId
                },
            type: 'post',
		    success: function (result) {
		      getAlarmList(result);
		    },
		    error: function (request, status, error) {
		      console.log(error);
		    }
		 })
	
	// 모달
	$('#alarmList').on('click', function() {
        var modal = $('#modal');
        var alarmImg = $('.alarmImg');

        // 알람 이미지의 위치 및 크기 가져오기
        var rect = alarmImg[0].getBoundingClientRect();
        
        modal.css({ // 모달 위치 설정 (알람 이미지의 왼쪽에 배치)
            top: rect.top + 'px',
            left: (rect.left - modal.outerWidth()) + 'px'
        });

        modal.show();
    });

    $('.modal_close').on('click', function() {
        $('#modal').hide();
    });

    $(window).on('click', function(event) {
        var modalContent = $('.modal-content');

        // 모달 외부를 클릭했을 때만 모달을 숨김
        if (!modalContent.is(event.target) && modalContent.has(event.target).length === 0 && !$('#alarmList').is(event.target)) {
            $('#modal').hide();
        }
    });
});

function getAlarmList(list){
	if (list.length > 0) {
        $('#notificationBadge').text("N");
        $('#notificationBadge').show();
        for(var i = 0; i < list.length; i++){
			if(list[i].alarmType == "A"){
				var str = "<tr onclick=\"toAdmin('"+ list[i].alarmSeq +"');\" style=\"cursor: pointer\">";
				str += "<td class=\"alarmContents\">"+list[i].alarmContents+"</td>";
				str += "<td class=\"alarmRegDate\">"+list[i].regDate+"</td>";
				str += "</tr>";
				$("#alarmTable").append(str);
			}
		}
    } else {
        $('#notificationBadge').hide();
        $("#alarmTable").append("신규 알람이 없습니다.");
    }
	
}

// 회사 승인 알람 클릭
function toAdmin(seq){
	$.ajax({
		   url: "/alarm/updateReadYn",
		   type: 'post',
		   data: { alarmSeq: seq },
		   success: function (result) {
		      updateReadYn(result);
		      
		   },
		   error: function (request, status, error) {
		      console.log(error);
		   }
		})
}

function updateReadYn(){
	location.href = "/admin";
}