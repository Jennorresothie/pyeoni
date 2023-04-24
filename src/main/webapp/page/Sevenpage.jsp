<%@page import="com.pyeoni.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.pyeoni.model.ProductServices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">


<%@ include file="../common/commonfiles.jsp"%>

<style>
body {
	margin: 0 auto;
}

.navbar-brand>img {
	height: 80px;
	width: 80px;
}

.nav-item {
	padding-left: 50px;
}

.nav-link:hover {
	background-color: rgb(0, 129, 98);
	color: white;
	border-radius: 10px;
}

a.nav-link {
	color: rgb(0, 129, 98);
	font-size: 20px;
}

#login_btn {
	margin-right: 50px;
	background-color: white;
	border-color: rgb(0, 129, 98);
	color: rgb(0, 129, 98);
	font-weight: bold;
}

#login_btn:hover {
	background-color: rgb(0, 129, 98);
	color: white;
	font-weight: bold;
}

.content {
	text-align: center;
	margin-top: 80px;
}

/* 애니메이션 */
.w3-animate-opacity {
	animation-duration: 5s; /* change to the desired duration */
}

.input-group {
	width: 550px;
	margin: auto;
	margin-bottom: 30px;
}

#main_search {
	display: flex;
	flex-direction: column;
}

.select {
	text-align: center;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	margin: 0 auto;
}

.select_product {
	margin: 0px 20px 0px 20px;
}

.select select {
	text-align: center;
}

#search_bar {
	text-align: center;
	width: 350px;
	border-width: 2px;
}

#search_btn {
	color: rgb(0, 129, 98);
	border-color: rgb(0, 129, 98);
	border-width: 2px;
	font-weight: bold;
}

#search_btn:hover {
	background-color: rgb(0, 129, 98);
	color: white;
	font-weight: bold;
}

/* SevenEleven페이지 css시작 */
#logo_seven {
	width: 360px;
	height: 250px;
}

.change_event {
	text-align: center;
	margin-bottom: 30px;
	color: rgb(0, 129, 98);
	font-size: 25px;
	font-weight: bold;
}

/* footer */
footer {
	width: 95%;
	height: 110px;
	bottom: 0;
	position: absolute;
	text-align: right;
	font-size: 15px;
}
</style>


</head>
<body>
	<%@ include file="../common/sidebar.jsp"%>
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="../page/mainpage.jsp"><img
				src="../img/logo_pyeoni.png">Pyeoni</a>
			<!--토글러 -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="../page/cupage.jsp">CU</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../page/GSpage.jsp">GS25</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../page/Sevenpage.jsp">SEVENELEVEN</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../page/Minipage.jsp">MINISTOP</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../page/Emartpage.jsp">emart24</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../page/Cspacepage.jsp">CSPACE</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../page/Allpage.jsp">ALL</a></li>
					<!-- Session에서 관리자인지 확인하기 -->
					<c:if test="${sessionScope.userLoggedIn == true}">
						<li class="nav-item"><a class="nav-link" href="#">관리자 페이지</a>
						</li>
					</c:if>
				</ul>
				<form action="#">
					<button class="btn" type="button" id="login_btn">login/register</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="content">
		<div class="col-md-6 offset-md-3 mt-2 mb-4" id="search">
			<!-- 애니메이션 적용 -->
			<div class="w3-container w3-center w3-animate-opacity">
				<img src="../img/logo_seven3.png" id="logo_seven">

				<%@ include file="../common/pageForm.jsp" %>				
			</div>
		</div>
	</div>

	<!-- 1+1, 2+1 텍스트 -->
	<div class="change_event">

		<i class='bx bxs-megaphone'></i> <span id="1+1">1+1 행사상품입니다.</span><br>
		<!-- <span id="2+1">2+1 행사상품입니다.</span><br>  
	   <span id="allproduct">전체 상품목록입니다.</span><br>  -->
	</div>

	<!-- ProductSelectAll -->
	<%-- <%@ include file="../product/ProductSelectAll.jsp"%> --%>


	<!-- <footer>
         <hr>
         <nav>
            <a href="https://www.naver.com/">Naver</a> | <a
               href="https://github.com/Jennorresothie/pyeoni">Github</a>
         </nav>
         <p>
            <span>제작자 : 맨앞줄조</span> <br> <span>이메일 : 1111@naver.com</span>
            <br> <span>Copyright 2023. All Rights Reserved.</span>
         </p>
   </footer> -->

</body>
</html>