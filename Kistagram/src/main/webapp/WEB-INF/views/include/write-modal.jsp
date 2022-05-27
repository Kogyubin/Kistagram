<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js" integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA=" crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css"> -->
<!-- <script src="resources/assets/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css"> -->

<!-- Write Modal -->
<div class="modal" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">

	<div class="modal-dialog modal-lg" role="document">

		<!-- Modal content-->

		<div class="modal-content">

			<div class="modal-header">
				<h6 class="modal-title" id="historyModalLabel">새 게시물 만들기</h6>
				<button type="button" id="write-closeX" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body" id="myModalBody">
				<form action="write-action" id="write-form" method="post" enctype="multipart/form-data">

					<div id="post_id" style="float:right;">
						<img id="post_profile_img" src='${path}/resources/img/profile.png'>
						<span></span>
						<div>
							<textarea rows="16" cols="40" id="post-content" name="content"
								placeholder="문구입력"></textarea>
						</div>
					</div>

					<div class="filebox">
						<label for="file">업로드</label>
						<input type="file" name="uploadfile" id="file" multiple="multiple" /> 
						<input class="upload-name" value="파일선택" readonly>

						<div class="imgs_wrap" style="width: 390px">
							<div>
								<ul class="bxSlider">
									<li><img id="photo-icon" src="${path}/resources/img/photo-icon.png"></li>
								</ul>
							</div>
						</div>

					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-success">공유하기</button>
			</div>
		</div>
	</div>
</div>

