<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                         <!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js" integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA=" crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="resources/assets/css/bootstrap.min.css"> -->
<!-- <script src="resources/assets/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css"> -->

<!-- Write Modal -->
	<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">

		 <div class="modal-dialog modal-lg" role="document">

			<!-- Modal content-->
			
			<div class="modal-content">
			
				<div class="modal-header">
				<h5 class="modal-title" id="historyModalLabel">새 게시물 만들기</h5>
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="myModalBody">
						<form action="write-action" id="write-form" method="post" enctype="multipart/form-data">
						      <div style="float:right;">
									<img src='${path}/resources/img/profile.png' id='post_profile_img'>&nbsp;${session_id }</a>
						      <div>
						      <textarea rows="8" cols="40" name="content" placeholder="문구입력"></textarea>
						      </div>
						      </div>
						      <div>
					        <input type="file" name="uploadfile" id="image" multiple="multiple"/>
						    <div id="image_preview" style="flot:left;">
						        <img src="#" />
						        <br />
					        <a href="#">Remove</a>
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
 
 