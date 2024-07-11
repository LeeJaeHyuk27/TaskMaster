<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alarm Test Page</title>
    </head>
    <style>
        input {
            display: block;
            height: 30px;
            padding: 5px;
            margin: 5px;
            width: 90%;
        }

        #container {
            display: flex;
            width: 700px;
            margin: 30px auto;
        }

        #alarm_btn {
            display: block;
            width: 100px;
            margin: 10px auto;
        }

        #getAlarm_btn {
            display: block;
            width: 130px;
            margin: 10px auto;
        }

        .alarm_div{
            width: 100%;
            padding: 10px;
            margin: 10px;
            font-size: 12px;
            border: 1px solid #9e9e9e;
            border-radius: 5px;
            background-color: #9e9e9e;
        }

        #form_container{
            width: 100%;
        }

        #alarm_container{
            width: 100%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#alarm_btn').click(function () {
                let param = $('#test_form').serializeArray();
                let alarmType = $('#alarmType').val();
                let projectSeq = $('#projectSeq').val();
                let taskSeq = $('#taskSeq').val();
                let userId = $('#userId').val();
                let createUserId = $('#createUserId').val();

                if (!userId) {
                    alert("userId는 알람을 받는 유저 아이디임으로 필수 입력 값 입니다.");
                    return;
                }

                if (!createUserId) {
                    alert("createUserId는 알람을 생성하는 유저 아이디임으로 필수 입력 값 입니다.");
                    return;
                }

                if (alarmType === 'B' && !projectSeq) {
                    alert("알람타입 'B'는 프로젝트 초대 알람으로 프로젝트 시퀀스는 필수 입력 값 입니다.");
                    return;
                }

                if (!taskSeq) {
                    if (alarmType === 'C') {
                        alert("알람 타입 'C'는 업무 할당 알람으로 업무 시퀀스는 필수 입력 값 입니다.");
                        return;
                    }
                    if (alarmType === 'D') {
                        alert("알람 타입 'D'는 댓글 알람으로 업무 시퀀스는 필수 입력 값 입니다.");
                        return;
                    }
                    if (alarmType === 'E') {
                        alert("알람 타입 'E'는 대댓글 알람으로 업무 시퀀스는 필수 입력 값 입니다.");
                        return;
                    }
                }

                if (!projectSeq) {
                    if (alarmType === 'C') {
                        alert("알람 타입 'C'는 업무 할당 알람으로 프로젝트 시퀀스는 필수 입력 값 입니다.");
                        return;
                    }
                    if (alarmType === 'D') {
                        alert("알람 타입 'D'는 댓글 알람으로 프로젝트 시퀀스는 필수 입력 값 입니다.");
                        return;
                    }
                    if (alarmType === 'E') {
                        alert("알람 타입 'E'는 대댓글 알람으로 프로젝트 시퀀스는 필수 입력 값 입니다.");
                        return;
                    }
                }

                $.ajax({
                    url: "/alarm_test",
                    data: param,
                    type: 'post',
                    dataType: "text",
                    success: function (result) {
                        alert(result);
                    },
                    error: function (request, status, error) {
                        console.log(error);
                    }
                })

            })

            $('#getAlarm_btn').click(function () {
                let userId = $('#userId').val();

                if (!userId) {
                    alert("userId는 알람 조회시 필수 입력 값 입니다.");
                    return;
                }

                $.ajax({
                    url: "/getAlarm_test",
                    data: {
                            "userId" : userId
                        },
                    type: 'post',
                    dataType: "json",
                    success: function (result) {
                        let output = "";
                        for(let i in result){
                            console.log(result[i].regDate);
                            output += `
                                        <div class="alarm_div">
                                            <div>알람 시퀀스 : \${result[i].alarmSeq}</div>
                                            <div>알람 내용 : \${result[i].alarmContents}</div>
                                            <div>알람 타입 : \${result[i].alarmType}</div>  
                                            <div>생성일 : \${result[i].regDate}</div>  
                                            <div>프로젝트 시퀀스 : \${result[i].projectSeq}</div>  
                                            <div>업무 시퀀스 : \${result[i].taskSeq}</div>
                                        </div>  
                                    `;
                        }
                        $('#alarm_container').html(output);
                    },
                    error: function (request, status, error) {
                        console.log(error);
                    }
                })
            })
        })

    </script>

    <body>
        <div id="container">
            <div id="form_container">
                <form id="test_form">
                    <input id="projectSeq" type="text" name="projectSeq" placeholder="projectSeq">
                    <input id="taskSeq" type="text" name="taskSeq" placeholder="taskSeq">
                    <input id="userId" type="text" name="userId" placeholder="userId">
                    <input id="createUserId" type="text" name="createUserId" placeholder="createUserId">
                    <input id="alarmType" type="text" name="alarmType" placeholder="input alarmType(A, B, C, D, E)">
                </form>
                <button id="alarm_btn" type="button">알람 테스트</button>
                <button id="getAlarm_btn" type="button">알람 조회 테스트</button>
            </div>
            <div id="alarm_container"></div>
        </div>
    </body>

    </html>