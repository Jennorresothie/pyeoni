<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
.products {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 20px;
}

.detail {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	flex: 1;
	text-align: left;
	font-size: 1.5rem;
}

.comments {
	margin-top: 20px;
}

.modalcomment {
	list-style: none;
}

.products img {
	width: 150px;
	height: 150px;
	object-fit: cover;
}

#cokeimg {
	width: 150px;
	height: 300px;
}

/* 댓글 모달 css */
#commentsection{
	text-align: left;
}

.commentdel{
	background-color: black;
	border: 2px solid black;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	margin-left:350px;
}

.commentdel:hover{
	background-color: white;
	color: black;
}

.comment-date {
  font-family: Arial, sans-serif;
  font-size: 0.8em;
  float : right;
  color: #999;
}

.comment-email {
	font-family: Arial, sans-serif;
	font-size: 1.3em;
	margin-left: 10px;
	color: #999;
}

.comment-text {
	font-family: Arial, sans-serif;
	font-size: 1.3em;
	margin: 10px 0;
	margin-left: 10px;
	color: #333;
}

</style>
<script>

function commentdel(){	
	alert("댓글삭제완료");
	var commentId = event.target.parentNode.id;
	$.ajax({
		method : 'GET',
		url : '../comment/deleteComment.view',
		data : {
			"commentId" : commentId
			//어떤 댓글을 지울지
			//댓글 아이디를 주면 된다.
		},
		success : function(responseData) {
			if(responseData == "true")
				viewComment();
		},
		error : function() { // 괄호 추가
			
		}
	});	
} 

	$(function() {	
		$('#btnaddcomment').on('click', addComment);
		function addComment() {		
			var comment = $('#textComment').val();
			var prodname = $('#prodname').text();
			var prodpromotion = $('#prodpromotion').text();
			var prodprice = $('#prodprice').text();
			var prodbrand = $('#prodbrand').text();
			prodprice = prodprice.slice(0, -1);
			console.log("a" + prodbrand);
			$.ajax({
				method : "POST",
				url : '../comment/writeComment.view',//댓글컨트롤러----------------------------------------------수정하기
				data : {
					"comment" : comment,
					"product_name" : prodname,
					"promotion" : prodpromotion,
					"price" : prodprice,
					"brand" : prodbrand,
					"email" : "${loginUser.email}"
				},
				success : function(responseData) {
					if(responseData=="false" ){
						alert("로그인을 해주세요");
					}else
						alert("댓글 추가 성공");
					viewComment();
				},
				error : function() { // 괄호 추가
					alert("로그인해주세요");
				}
			});
		}

	});
	
	function viewComment() {//댓글 보이게
		console.log("viewcomment 실행");
		$('#commentsection').html("");
		var prodname = $('#prodname').text();
		var prodpromotion = $('#prodpromotion').text();
		var prodprice = $('#prodprice').text();
		var prodbrand = $('#prodbrand').text();
		var loginuser = "${sessionScope.loginUser.userName}";
		prodprice = prodprice.slice(0, -1);
		$.ajax({
			method : 'GET',
			url : '../comment/selectComment.view',
			data : {
				"product_name" : prodname,
				"promotion" : prodpromotion,
				"price" : prodprice,
				"brand" : prodbrand
			},
			success : function(responseData) {
				var datas = JSON.parse(responseData);
				var commentList = datas.commentList;
				console.log("username:" + loginuser);
				
				//댓글 refresh
				//div commentsection에 쓰기
				var commentHTML = '';
				$.each(commentList,function(index,comment) {
					console.log("commentid is")
					console.log(comment['commentId']);
					var commentid = comment['commentId'];
					console.log(commentid);
				/* 	const comment = commentList[i]; */
				if(loginuser == comment['email']|| loginuser == "관리자") {
          		commentHTML += `
            		<div id=${"${comment['commentId']}"} class="comment" >	              		
            		<span class="comment-email">${"${comment['email']}"}</span>
            		<span class="comment-date">${"${comment['commentDate']}"}</span><br><br>
					<span class="comment-text">${"${comment['content']}"}</span>		
	              		<button class="commentdel" onclick="commentdel()">댓글 삭제</button>
            		</div>
            		<hr>
          			`;
				}else{					
		    		commentHTML += `
	            		<div class="comment">	              		
		    			<span class="comment-email">${"${comment['email']}"}</span>
		    			<span class="comment-date">${"${comment['commentDate']}"}</span><br><br>	              		
	              		<span class="comment-text">${"${comment['content']}"}</span>		
	            		</div>
	            		<hr>
	          			`;			
				}
				});
				console.log("html" + commentHTML);
				$('#commentsection').append(commentHTML);

			},
			error : function() { // 괄호 추가
				alert("실패");
			}
		});
	}
</script>

</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">상품</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<ul>
						<li class="modalcomment">
							<div class="products">
								<div>
									<img id="modalimg" src="" style="width: 200px; height: 200px; object-fit: contain;">									
								</div>
								<div class="detail">
									<span id="prodbrand"><img id="cu_logo"
										src="../img/logo_CU.png"
										style="object-fit: contain; max-width: 100%; max-height: 100%;"></span><br>
									<div class="product">
										<span id="prodname"></span><br> <span id="prodpromotion"></span><br>
										<span id="prodprice"></span><br>
									</div>
								</div>
							</div>
						</li>
						<!-- 댓글 목록 -->
						<li class="modalcomment">
							<hr>
							<div id="commentsection"></div>
							<div class="card mb-2">
								<textarea id="textComment" rows="3"></textarea>
								<button type="button" class="btn btn-dark mt-3" id="btnaddcomment">댓글 작성</button>
							</div>
						</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>