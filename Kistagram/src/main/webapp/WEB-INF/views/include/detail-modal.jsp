<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>
<!DOCTYPE HTML>

<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	//좋아요 버튼 누르기
	function fn_like() {

		var id = "${session_id}";
		var post_no = $("#detail_post_no").val();
		var likeCheck = $("#like-check").val();

		//빈하트 눌렀을 때
		if (likeCheck == 0) {

			$.ajax({
				url : "${path}/like-action",
				type : "POST",
				data : {
					id : id,
					post_no : post_no

				},
				success : function(result) {
					if (result) {
						//꽉찬하트로 바꾸기
						$('.post_like_section #like_img').attr("src","${path}/resources/img/like.png");
						$("#like-check").val(1);
					}

				},
				error : function() {
					alert("서버에러");
				}
			});
			console.log("꽉찬 하트로 바껴라")

			//꽉찬 하트 눌렀을 때
		} else {

			$.ajax({

				url : "${path}/delete-like",
				type : "POST",
				data : {
					id : id,
					post_no : post_no
				},
				success : function(result) {
					if (result == 1) {
						//빈 하트로 바꾸기
						$('.post_like_section #like_img').attr("src","${path}/resources/img/dislike.png");
						$("#like-check").val(0);
					}

				},
				error : function() {
					alert("서버에러");
				}
			});
			console.log("빈 하트로 바껴라")
		}
	}

	$(document).ready(function() {

		//댓글 등록
		$("#commentBtn").on("click", function() {
			var id = "${session_id}";
			var comment_content = $("#comment_content").val();
			var post_no = $("#detail_post_no").val();

			console.log(id);
			console.log(post_no);
			console.log(comment_content);

			$.ajax({
				url : "${path}/write-comment-action",
				type : "POST",
				data : {
					id : id,
					post_no : post_no,
					comment_content : comment_content

				},
				success : function(result) {
					var msg;

					if (result) {
						msg = "댓글 등록 성공";
						$("#comment_content").val("");
						commentList(post_no);
					} else {
						msg = "댓글 등록 실패";
					}

					alert(msg);
				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			});

		});
	});

	//게시글 삭제 버튼 누르기
	function fn_deletePost() {
		var msg = confirm("정말로 삭제하시겠습니까?");

		if (msg) {

			var id = "${session_id}";
			var post_no = $("#detail_post_no").val();

			$.ajax({
				url : "${path}/delete-post",
				type : "POST",
				data : {
					id : id,
					post_no : post_no
				},
				success : function(result) {

					alert("삭제가 완료되었습니다.");
					location.reload();
				}

			});
		}

	}
</script>
</head>

<body>
	<!-- Detail Modal -->
	<div class="modal" id="myLargeModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">

		<div class="modal-dialog modal-lg" role="document">

			<!-- Modal content-->

			<div class="modal-content">

				<div class="modal-header">
					<!-- 				<h5 class="modal-title" id="historyModalLabel"></h5> -->
					<c:choose>
						<c:when test="${session_id eq id }">
							<a href='javascript: fn_deletePost();'> 
							<img id="detail_bin_img" src='${path}/resources/img/bin.png'>
							</a>
						</c:when>
					</c:choose>
					<button type="button" id="closeX" class="close"	data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="myModalBody">
					<div class="detail_img">
						<div>
							<ul class="slider">
								<li><img src="${path}/resources/img/profile.png"></li>
							</ul>
						</div>

						<div class="post_like_section">
							<input type="hidden" id="like-check"> 
							<a href='javascript: fn_like();'>
								<img src='${path}/resources/img/dislike.png' id='like_img'>
							</a>&nbsp;
							<span>
								<a href='#'>
									<img src='${path}/resources/img/comment.png' id='comment_icon'>
								</a>
							</span>
						</div>
					</div>
					<div class="post-content-class">
						<div id="detail_id">
							<img id="detail_profile_img" src='${path}/resources/img/profile.png'> 
							<span></span>
						</div>
						<div id="detail_content"></div>
						<div id="detail_regdate"></div>
					</div>
					<!-- 댓글 리스트 -->
					<div class="comment-container">
						<form id="comment-list-form" name="comment-list-form" method="post">
							<div id="commentList"></div>
						</form>
					</div>

					<!-- modal header 종료 -->
					<!--댓글 작성  -->
					<!-- 						<div class="input_comment_div"> -->
					<input type="hidden" id="detail_post_no"> 
					<input class="w-100 form-control" id="comment_content" type="text" placeholder="댓글입력"><br>
					<button class="write_comment_btn" type="button" id="commentBtn">전송</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
