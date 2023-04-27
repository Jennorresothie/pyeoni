<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리 페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#comment-div {
	position: fixed;
	width: 600px;
	transform: translate(-50%, -30%);
}
</style>
</head>
<body>
	<div style="text-align: center" id="comment-div">
		<h1>회원 정보 관리</h1>
		<br>
		
		<table class="table">
			<thead>
				<tr class="table-dark">
					<th>순번</th>
					<th>회원 이메일</th>
					<th>회원 이름</th>
					<th>등급</th>
					<th>탈퇴 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${MemList}" var="mem" varStatus="status">
					<tr class="${mem.withDraw == 0? 'table-success' : 'table-danger'}" style="${mem.isAdmin == 1 ? 'font-weight: bold;' : ''} ">
						<td>${status.count}</td>
						<td>${mem.email}</td>						
						<td>${mem.userName}</td>
						<td>${mem.isAdmin == 1 ? "관리자" : "일반 회원"}</td>
						<td>${mem.withDraw == 1 ? "탈퇴" : "가입"}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>