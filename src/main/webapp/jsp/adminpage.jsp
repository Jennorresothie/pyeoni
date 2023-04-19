<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="../common/commonfiles.jsp"%>
<style>
.w3-animate-opacity {
	animation-duration: 5s; /* change to the desired duration */
}

div.adminhome {
	font-weight: bold;
	font-size: 40px;
	position: absolute;
	left: 50%;
	color: orange;
	transform: translate(-50%, -50%);
}

#here {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<script>
	$(function() {
		$("#updateStore").click(function() {
			$("#here").load("update.jsp");
		});
		$("#manageMember").click(function() {
			$("#here").load("manageMember.jsp");
		});
		$("#manageComments").click(function() {
			$("#here").load("manageComments.jsp");
		});

	});
</script>
</head>
<body>
	<%@ include file="adminheader.jsp"%>
	<div style="margin-left: 25%;">
		<div class="adminhome w3-animate-opacity">ADMIN PANEL</div>
	</div>
	<div class="w3-sidebar w3-bar-block" style="width: 20%;">
		<br><br><br>
		<button id="updateStore" class="w3-bar-item w3-button w3-hover-orange">편의점
			행사 내역 업데이트</button>
		<br>
		<button id="manageMember"
			class="w3-bar-item w3-button w3-hover-orange">회원 관리</button>
		<br>
		<button id="manageComments"
			class="w3-bar-item w3-button w3-hover-orange">댓글 관리</button>
		<br>
		<button id="goToHome" class="w3-bar-item w3-button w3-hover-orange">홈으로
			돌아가기</button>
	</div>

	<div id="here" class="w3-container w3-center w3-animate-opacity">사이드바를
		통해 원하는 기능을 선택하세요</div>

</body>
</html>