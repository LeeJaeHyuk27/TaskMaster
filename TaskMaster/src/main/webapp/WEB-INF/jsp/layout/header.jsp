<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mysite.login.vo.UserInfoVO"%>
<%
UserInfoVO user = (UserInfoVO) session.getAttribute("TaskMaster");
String userId = "";
String userName = "";

if (user != null) {
	userId = user.getUserId();
	userName = user.getUserName();
}
%>
<link href="/resources/css/header.css" rel="stylesheet" />
<script src="/resources/js/header.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<header class="header">
	<input type="hidden" id="userId" value="<%=userId%>">
	<div class="logo">
		<a href="/main"><img src="/resources/img/logo.png"></a>
	</div>
	<div class="alarmImg">
		<img src="/resources/img/alarm.png" id="alarmList">
		<span id="notificationBadge" class="badge" style="display: none;"></span>
	</div>
	<div id="modal" class="modal">
        <div class="modal-content">
            <span class="modal_close">&times;</span>
            <table id="alarmTable">
            </table>
        </div>
    </div>
	<nav class="header-nav">
		<ul>
			<li class="nav-profile">
				<% if (user != null) { %>
                    <a href="#" id="profileDropdown"><%=userName%>
                    	<i class="fas fa-chevron-down dropdown-icon"></i>
                    </a>
                    <ul class="dropdown-menu" id="profileMenu">
                        <li class="dropdown-header"><%=userName%></li>
                        <li><a class="dropdown-item" href="#">Account Settings</a></li>
                        <li><a class="dropdown-item" href="/login">Sign Out</a></li>
                    </ul>
                <% } else { %>
                    <a href="/login">로그인</a>
                <% } %>
			</li>
		</ul>
	</nav>
</header>