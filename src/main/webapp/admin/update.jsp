<!-- 
업데이트 기능을 추가할 jsp페이지.
업데이트 관련 설명과 버튼을 추가하자.
업데이트 버튼을 누르면 업데이트 기능 실행 
-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

</style>
</head>
<body>
	<div style = "text-align: center">
		<h1>편의점 행사 내역 업데이트</h1>
		<br>
		<p>아래 버튼을 클릭하면 모든 편의점의 행사 내역을 크롤링하여</p>
		<br>
		<p>데이터베이스에 있는 테이블에 반영이 됩니다.</p>
		<br>
		<button id="update">UPDATE</button>
	</div>
</body>
</html>