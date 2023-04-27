
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 댓글 관리</title>

<style>
#comment-div {
	position: fixed;
	width: 700px;
	transform: translate(-50%, -30%);
}

#comment-table {
	width: 100%;
	border-collapse: collapse;
}
</style>

<script type="text/javascript">

	$(function () {
		comm();
	});

	function comm() {
	
		$.ajax({
			url : 'commentlist.do',
			success : function(responseData) {
				$('tbody').html("");
				var datas = JSON.parse(responseData);
				var commentList = datas.commentList;
				
				$.each(commentList,function(index,comment) {
					var content = comment['content'];
					var obj =   JSON.stringify(comment);
					let Pname =  comment['productName'];
			
					 
					commentHTML = `
						<tr>
							<th scope="row" class="com_tr">${"${index+1}"}</th>
							<td class="com_td">${"${comment['commentId']}"}</td>
							<td class="com_td">${"${content}"}</td>
							<td class="com_td">${"${comment['email']}"}</td>
							<td class="com_td">${"${comment['commentDate']}"}</td>
							<td class="com_td"><button class="com_btn" onclick="Delete(event)" data-commentid=${"${comment['commentId']}"}>삭제</button></td>
						</tr>
					`;
					
					$('tbody').append(commentHTML);
				});
			},
			error : function(xhr, status, error) {
				console.log(xhr.responseText);
				console.log(status);
				console.log(error);
				alert('오류가 발생했습니다!');
			}
		});
		
	}
	
	function Delete(event) {
		let cid = event.target.dataset.commentid;

	    var result = confirm("정말 삭제하시겠습니까?");
	    if (result) {
	        // 삭제를 진행하는 로직
	       $.ajax({
	        	url: '../comment/deleteComment.view',
	        	data:{
	        		"commentId" : cid
	        	},
	        	success : function(responseData) {
					// 삭제가 성공했을 때 commentlist.do로 리다이렉트합니다.
			        comm();
					
				},
				error : function(xhr, status, error) {
					console.log(xhr.responseText);
					console.log(status);
					console.log(error);
					alert('오류가 발생했습니다!');
				}
	        		
	        });
	        alert("삭제되었습니다.");
	    } else {
	        alert("삭제가 취소되었습니다.");
	    }
	} 
	

</script>
</head>
<body id="com_body">

	<div style="text-align: center" id="comment-div">
		<h1 class="com_h1">전체 댓글 관리</h1>

		<table class="table table-striped border-0" id="comment-table">
			<thead id="com_thead">
				<tr class="table-dark">
					<th scope="col" class="com_th">순번</th>
					<th scope="col" class="com_th">댓글 번호</th>
					<th scope="col" class="com_th">내용</th>
					<th scope="col" class="com_th">작성자</th>
					<th scope="col" class="com_th">작성일</th>
					<th scope="col" class="com_th">삭제</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

</body>
</html>