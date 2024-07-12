<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alarm Test Page</title>
    </head>
    <link href="/resources/css/alarm.css" rel="stylesheet" />
    <script src="/resources/js/jquery-3.7.1.js"></script>
    <script src="/resources/js/alarm.js"></script>
    <body>
        <div id="container">
            <div id="form_container">
                <form id="test_form">
                    <input id="projectSeq" type="text" name="projectSeq" placeholder="projectSeq">
                    <input id="taskSeq" type="text" name="taskSeq" placeholder="taskSeq">
                    <input id="companyCd" type="text" name="companyCd" placeholder="companyCd">
                    <input id="replySeq" type="text" name="replySeq" placeholder="replySeq">
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