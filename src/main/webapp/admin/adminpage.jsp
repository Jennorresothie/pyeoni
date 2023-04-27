<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<%@ include file="../common/commonfiles.jsp"%>
<style>
.w3-animate-opacity {
	animation-duration: 5s; /* change to the desired duration */
}

div.adminhome {
	font-weight: bold;
	font-size: 40px;
	position: absolute;
	z-index: 1; /* 다른 요소들보다 위에 나타나게 됩니다. */
	left: 50%;
	color: #F69320;
	transform: translate(-50%, -50%);
}

#here {
	margin-top: 10%;
	top: 80%;
	position: absolute;
	/* 	  left: 50%;
  transform: translateX(-50%); */
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>

</head>
<body>
	<%@ include file="adminsidebar.jsp"%>

	<div style="margin-left: 25%;">
		<div class="adminhome w3-animate-opacity">ADMINISTER PAGE</div>
	</div>


	<div id="here">사이드바를 통해 원하는 기능을 선택하세요</div>

</body>
<script>
	$(document).ready(function() {
		$("#updateStore").click(function() {
			$("#here").load("updateProduct.view");
		});
		$("#manageMember").click(function() {
			$("#here").load("manageMember.view");
		});
		$("#manageComments").click(function() {
			$("#here").load("manageComments.view");
		});
	});
</script>

</html>