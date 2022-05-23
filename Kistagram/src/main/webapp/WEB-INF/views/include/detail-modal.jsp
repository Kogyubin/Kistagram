<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                         <!-- http://localhost:8989/kitri/ -->
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>
<!DOCTYPE HTML>

<html>
	<head>
<!-- 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- 		<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js" integrity="sha256-hlKLmzaRlE8SCJC1Kw8zoUbU8BxA+8kR3gseuKfMjxA=" crossorigin="anonymous"></script> -->
		
<!-- 		<script src="resources/js/bootstrap.min.js"></script> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

	  	
		<script>
// 		alert("aa123");
		//좋아요
// 		function fn_like() {
// 			var frm_read = $('#frm_read');
// 			  var post_no = $('#post_no', frm_read).val();
			 
			  
// 			  $.ajax({
// 			    url: "${path}/like-action",
// 			    type: "GET",
// 			    cache: false,
// 			    dataType: "json",
// 			    data: 'post_no=' +post_no,
// 			    success: function(data) {
// 			      var msg = '';
// 			      var like_img = '';
// 			      msg += data.msg;
// 			      alert(msg);
			      
// 			      if(data.like_check == 0){
// 			        like_img = "${path}/resources/img/dislike.png";
// 			      } else {
// 			        like_img = "${path}/resources/img/like.png";
// 			      }      
// 			      $('#like_img', frm_read).attr('src', like_img);
// 			      $('#like_cnt').html(data.like_cnt);
// 			      $('#like_check').html(data.like_check);
// 			    },
// 			    error: function(request, status, error){
// 			      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 			    }
// 			  });


		
// 		}
		
				
	$(document).ready(function() {	    
			
		    //댓글 등록
		    $("#commentBtn").on("click", function(){
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
	                   		comment_content :comment_content
	                   		
	                     },
	                    success : function(result){
	                    	var msg;
	                        
	                        if(result) {
	                        	 msg = "댓글 등록 성공";
	                        	 $("#comment_content").val("");
	                        	 commentList(post_no);
	                        } else {
	                        	msg = "댓글 등록 실패";
	                        }
	                        
	                        
	                        alert(msg);
	                    },
	                    error : function(){
	                    	console.log("ajax 통신 실패");
	                    }
	                });
	           
	        	});
	});
		    
		</script>
		
  
	</head>
	<body>
<!-- Detail Modal -->
	<div class="modal" id="myLargeModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">

		 <div class="modal-dialog modal-lg" role="document">

			<!-- Modal content-->
			
			<div class="modal-content">
			
				<div class="modal-header">
				<h5 class="modal-title" id="historyModalLabel"></h5>
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="myModalBody">
				
					<div>
						<div id="detail_id">
						      <img id="post_profile_img" src='${path}/resources/img/profile.png'>
						      <span></span>
					    </div>
						<div id="content">
						</div>
					</div>  
					
					<div class="detail_img">
						<div >
				      		<ul class="slider"></ul>
				     	</div>	
				     	
				     	<div class="post_like_section">
						 	 <a href='javascript: fn_like();'><img src='${path}/resources/img/dislike.png' id='like_img'></a>&nbsp;
							 <a href='#'><img src='${path}/resources/img/comment.png' id='comment_icon'></a>	
							
						</div>	
			     	</div>
			     	<!-- 댓글 리스트 -->
						<div class="container">
							<form id="comment-list-form" name="comment-list-form" method="post">
								<div id="commentList">
								
									
								</div>
							</form>
					    </div>
				
						  
				<!-- modal header 종료 -->
							<!--댓글 작성  -->
	<!-- 						<div class="input_comment_div"> -->
								<input type="hidden" id="detail_post_no">
					     		<input class="w-100 form-control" id="comment_content" type="text" placeholder="댓글입력"><br>
						     	<button class="write_comment_btn" type="button" id="commentBtn">전송</button>
						</div>		
					
		
					<div class="modal-footer">
					</div>
			</div>
		</div>
	</div>
	

	</body>
</html>
 