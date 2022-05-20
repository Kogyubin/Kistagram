<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                         <!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js" integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<script src="resources/assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">

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
						      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg> ${session_id }
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
 
 