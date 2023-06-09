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
<style>

/* #productInfo:hover {
  background-color: rgba(117, 20, 133, 0.3);
} */
.selectall {
	text-align: center;
}

.hrselectall {
	width: 700px;
	margin: 0 auto;
}

.productInfo {
	background-color: white;
	border: white;
	margin: 0 auto;
}

.btnCU:hover {
	background-color: rgba(177, 70, 193, 0.3);
}

.btnGS25:hover {
	background-color: rgba(70, 176, 193, 0.3);
}

.btnSEVENELEVEN:hover {
	background-color: rgba(8, 120, 10, 0.3);
}

.btnMINISTOP:hover {
	background-color: rgba(7, 15, 112, 0.3);
}

.btnC-SPACE:hover {
	background-color: rgba(128, 128, 128, 0.3);
}

.btnEMART24:hover {
	background-color: rgba(255, 126, 0, 0.3);
}

/* likecss */
.icon.heart {
	text-decoration: none;
	color: inherit;
	cursor: pointer;
}

.right_area .icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: calc(100vw * ( 45/ 1920));
	height: calc(100vw * ( 45/ 1920));
	border-radius: 50%;
	border: solid 2px #eaeaea;
	background-color: #fff;
}

.icon.heart img {
	width: calc(100vw * ( 24/ 1920));
	height: calc(100vw * ( 24/ 1920));
}

.icon.heart.fas {
	color: red
}

.heart {
	transform-origin: center;
}

.heart.active img {
	animation: animateHeart .3s linear forwards;
}

@
keyframes animateHeart { 0% {
	transform: scale(.2);
}
40
%
{
transform
:
scale(
1.2
);
}
100
%
{
transform
:
scale(
1
);
}
}
</style>
<script>
/* $(function() {
	  $('.icon.heart').click(function() {
	    if (!"${sessionScope.loginUser}") return;

	    $(this).toggleClass('active');

	    if ($(this).hasClass('active')) {
	      $(this).find('img').attr({
	        'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
	        'alt': '찜하기 완료'
	      });
	    } else {
	      $(this).find('i').removeClass('fas').addClass('far');
	      $(this).find('img').attr({
	        'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
	        'alt': '찜하기'
	      });
	    }
	  });
	});
	 */
	
	
	

	/* 	$(function() {
	 $("td.prodshow").on(
	 "click",
	 function() {

	 if ($(this).find("span.icon").length == 0) {

	 $("#prodname").text(
	 $(this).parent().parent().parent().parent()
	 .attr("data-pname"));
	 $("#prodpromotion").text(
	 $(this).parent().parent().parent().parent()
	 .attr("data-ppro"));
	 $("#prodprice").text(
	 $(this).parent().parent().parent().parent()
	 .attr("data-pprice"));
	 $("#prodbrand").text(
	 $(this).parent().parent().parent().parent()
	 .attr("data-pbrand"));
	 $("#modalimg").attr(
	 'src',
	 $(this).parent().parent().parent().parent()
	 .attr("data-pimg"));
	 $("#exampleModal").modal("show");
	 viewComment();

	 }
	 });
	 }); */
	function showModal(elem) {
		if ($(elem).find("span.icon").length == 0) {
			$("#prodname").text(
					$(elem).parent().parent().parent().parent().attr(
							"data-pname"));
			$("#prodpromotion").text(
					$(elem).parent().parent().parent().parent().attr(
							"data-ppro"));
			$("#prodprice").text(
					$(elem).parent().parent().parent().parent().attr(
							"data-pprice"));
			$("#prodbrand").text(
					$(elem).parent().parent().parent().parent().attr(
							"data-pbrand"));
			$("#modalimg").attr(
					'src',
					$(elem).parent().parent().parent().parent().attr(
							"data-pimg"));
			$("#textComment").val('');
			$("#exampleModal").modal("show");
			viewComment();
		}
	}
	function likebtn(elem, pname, pro, brand, price) {
		if (!"${sessionScope.loginUser}") {
			alert("로그인을 해주세요");
		} else {
			console.log("likebtn실행");
			/* 		좋아요를 눌렀습니다.... 좋아요 테이블에 추가하기....그리고 좋아요값을 수정하기
			 onclick 이기때문에 온로드일필요가 없습니다. */
			var newlike = 0;
			$.ajax({
				method : 'POST',
				url : '../like/addLike.do',
				data : {
					/* 			누가 어디 좋아요를 눌렀나? 
								가격, 브랜드, productName promotion brand price email */
					"productName" : pname,
					"promotion" : pro,
					"brand" : brand,
					"price" : price,
					"email" : "${loginUser.email}"
				},
				success : function(responseData) {

					newlike = parseInt(responseData);
					var onclickval = $(elem).attr('onclick');
					onclickval = onclickval.replace('like', 'del');
					$(elem).attr('onclick', onclickval);
					console.log("${newlikenum}");
					$(elem).closest('td').find('div.likenum')
							.text('' + newlike);
					$(elem).find('img').attr('src','https://cdn-icons-png.flaticon.com/512/803/803087.png');
				},
				error : function() { // 괄호 추가

				}
			});
		}

	}

	function delbtn(elem, pname, pro, brand, price) {
		console.log("delbtn실행");
		var newlike = 0;
		$.ajax({
			method : 'GET',
			url : '../like/deleteLike.do',
			data : {
				"productName" : pname,
				"promotion" : pro,
				"brand" : brand,
				"price" : price,
				"email" : "${loginUser.email}"
			},
			success : function(responseData) {
				newlike = parseInt(responseData);
				var onclickval = $(elem).attr('onclick');
				onclickval = onclickval.replace('del', 'like');
				$(elem).attr('onclick', onclickval);
				console.log("${newlikenum}");
				$(elem).closest('td').find('div.likenum').text('' + newlike);
				$(elem).find('img').attr('src','https://cdn-icons-png.flaticon.com/512/812/812327.png');
			},
			error : function() { // 괄호 추가

			}
		});

	}
</script>
</head>
<body>
	<%-- 	<%
	ProductServices ps = new ProductServices();
	List<ProductVO> plist = ps.selectAllProduct(1,20);
	request.setAttribute("plist", plist);
	%> --%>
	<script>
		
	</script>
	<div class="selectall">
		<c:forEach items="${productList}" var="p">

			<button data-bs-target="#exampleModal" data-bs-whatever="@mdo"
				data-pname="${p.productName}" data-ppro="${p.promotion}"
				data-pprice="${p.price}" data-pbrand="${p.brand}"
				data-pimg="${p.productImg }"
				class="productInfo ${p.brand == 'CU' ? 'btnCU' : 
                                      p.brand == 'GS25' ? 'btnGS25' :
                                      p.brand == '7-ELEVEn' ? 'btnSEVENELEVEN' :
                                      p.brand == 'MINISTOP' ? 'btnMINISTOP' :
                                      p.brand == 'C·SPACE' ? 'btnC-SPACE' : 'btnEMART24'}">
				<!-- CU, GS25, emart24, 7-ELEVEn, MINISTOP, cspace -->
				<table class="tg" style="table-layout: fixed; width: 625px">
					<colgroup>
						<col style="width: 144.333333px">
						<col style="width: 137.333333px">
						<col style="width: 56.333333px">
						<col style="width: 225.333333px">
						<col style="width: 61.333333px">
					</colgroup>
					<thead>
						<tr>
							<td onclick="showModal(this)" class="prodshow tg-8n49"
								rowspan="2"><img src="${p.productImg}" alt="Image"
								style="width: 100px; height: 100px; object-fit: contain;"></td>
							<td onclick="showModal(this)" class="prodshow tg-7eit">${p.productName}<br></td>
							<td onclick="showModal(this)" class="prodshow tg-8n49"
								rowspan="2"></td>
							<td onclick="showModal(this)" class="prodshow tg-8n49">${p.price}원<br></td>
							<td onclick="showModal(this)" class="prodshow tg-7eit"
								rowspan="2"><div class="right_area">
									<c:choose>
										<c:when test="${p.check == 1}">
											<span style="margin-left: 7px;" class="icon heart active"
												onclick="delbtn(this,'${p.productName}','${p.promotion}','${p.brand}','${p.price}')">
												<img
												src="https://cdn-icons-png.flaticon.com/512/803/803087.png"
												alt="찜하기 완료">
											</span>
										</c:when>
										<c:otherwise>
											<span style="margin-left: 7px;" class="icon heart"
												onclick="likebtn(this,'${p.productName}','${p.promotion}','${p.brand}','${p.price}')">
												<img
												src="https://cdn-icons-png.flaticon.com/512/812/812327.png"
												alt="찜하기">
											</span>
										</c:otherwise>
									</c:choose>
								</div> <br>
								<div class="likenum">${p.likenum }</div></td>
						</tr>
						<tr>
							<td onclick="showModal(this)" class="prodshow tg-7eit">${p.promotion}</td>
							<td onclick="showModal(this)" class="prodshow tg-7eit">${p.brand}</td>
						</tr>
					</thead>
				</table>
			</button>

			<br>
			<br>
			<hr class="hrselectall">
			<br>

		</c:forEach>
		<%@ include file="DetailModal.jsp"%>

	</div>
</body>

</html>