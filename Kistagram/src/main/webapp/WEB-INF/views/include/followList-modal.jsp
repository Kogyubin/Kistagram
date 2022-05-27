<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                         <!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>
<!DOCTYPE HTML>

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script>
		
//팔로우 삭제
		
			function fn_delFollowBtn(following) {
				
				var msg = confirm("팔로우를 취소하시겠습니까?");
				
				if(msg) {
					
					var id = "${session_id}";
					//var following = id;
					
					console.log(id, following);
					
					$.ajax({
						
						url: "${path}/delete-follow",
					    type: "POST",
					    data: {
					    	id: id,
					    	following: following
					    },
					    success: function(result) {
					    	
					    	console.log(result);
					    
					    	if(result){
					    	
					    		alert("팔로우가 취소되었습니다. 생각이 바뀌면 다시 팔로우를  요청할 수 있습니다.");
					    		fn_followList(id);
					    	}
					    
					    }
						
					});
					
				}
				
				
			}
		
	
		
		
		</script>
		
	</head>
	<body>

<!-- FollowerList Modal -->
	<div class="modal" id="mySmallModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">

		 <div class="modal-dialog modal-sm modal-dialog-scrollable" role="document">

			<!-- Modal content-->
			
			<div class="modal-content">
			
				<div class="modal-header">
				<h6 class="modal-title" id="historyModalLabelFollowing">팔로잉</h6>
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body" id="followList-myModalBody">
					
					
						<div id="followList">
								
						</div> 
					
				</div>
			</div>
		</div>
	</div>

	</body>
</html>
 