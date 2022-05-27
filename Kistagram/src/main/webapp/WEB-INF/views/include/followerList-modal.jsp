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
	<div class="modal" id="mySmallModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">

		 <div class="modal-dialog modal-sm modal-dialog-scrollable" role="document">

			<!-- Modal content-->
			
			<div class="modal-content">
			
				<div class="modal-header">
				<h6 class="modal-title" id="historyModalLabelFollower">팔로워</h6>
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body" id="myModalBody">
				
						
						<div id="followerList">
							
						</div>  
						
				</div>
			</div>
		</div>
	</div>

	</body>
</html>
 