<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                         <!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>
<!DOCTYPE HTML>

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		
	</head>
	<body>

<!-- FollowerList Modal -->
	<div class="modal" id="mySmallModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">

		 <div class="modal-dialog modal-sm" role="document">

			<!-- Modal content-->
			
			<div class="modal-content">
			
				<div class="modal-header">
				<h6 class="modal-title" id="historyModalLabelFollowing">팔로잉</h6>
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body" id="myModalBody">
					
					<div id="followList">
							
					</div> 
					
				</div>
				
			</div>
		</div>
	</div>

	</body>
</html>
 