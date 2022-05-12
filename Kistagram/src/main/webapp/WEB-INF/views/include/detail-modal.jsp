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
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<script src="resources/js/bootstrap.min.js"></script>
		
		
		<link rel="stylesheet" href="resources/css/jquery.bxslider.css">
<!-- 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

		<script>
		    
			
		    //댓글 등록
		    $("#commentBtn").on("click", function(){
		        	var id = "${session_id}" // 사용자 아이디
		            var post_no = "${clist.post_no}"; // 글번호
		            var comment_content = $("#comment_content").val(); // 댓글내용
		            
		            console.log(id);
		                
		                $.ajax({
		                	url : "addComment",
		                    type : "POST",
		                    data : {
		                    	id : id,
		                   		comment_content : comment_content,
		                   		post_no : post_no,
		                       
		                     },
		                    success : function(result){
		                    	var msg;
		                        
		                        switch(result) {
		                        case 1 :  //성공
		                        	msg = "댓글 등록 성공";
		                            // 내용을 작성한 textarea를 다 지워줌
		                            $("#comment_content").val("");
		                            selectRlist(); // selectRlist()함수 호출
		                            break;
		                            
		                        case 0 :  //등록실패
		                        	msg = "댓글 등록 실패";
		                            break;
		                        case -1 :
		                        	msg = "댓글 등록 오류 발생";
		                            break;
		                        }
		                        
		                        alert(msg);
		                    },
		                    error : function(){
		                    	console.log("ajax 통신 실패");
		                    }
		                });
		           
		        });
		    
		</script>
  
	</head>
	<body>
<!-- Detail Modal -->
	<div class="modal fade" id="myLargeModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">

		 <div class="modal-dialog modal-lg" role="document">

			<!-- Modal content-->
			
			<div class="modal-content">
			
				<div class="modal-header">
				<h5 class="modal-title" id="historyModalLabel"></h5>
					<button type="button" id="closeX" class="close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" id="myModalBody">
<!-- 						<form action="write-action" id="write-form" method="post" enctype="multipart/form-data"> -->
						      <div style="float:right;">
							      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
									</svg> ${session_id }
							      <div id="content" name="content">
							      </div>
						      </div>
						      
						      <div style="float:left;">
						      	<ul class="slider">
									<c:forEach items="${pivo }" var="pivo">
									<li>
									<span class="detail_img">
										<img src="${path += '/resources/uploadfolder/' += pivo.id += '/' += pivo.img_name}">
									</span>
									</li>
									</c:forEach>
								</ul>
						      
						     </div>
						     <!-- 댓글 -->
						     <c:forEach items="${clist }" var="cvo">
							<div class="comment"><input type="hidden" value="${cvo.comment_no }">
								<span class="font-w-b">${cvo.id }</span> | 
								<span class="font-s10 font-c-gray">${cvo.comment_regdate }</span>&nbsp;&nbsp;
								<span class="margin-t10 display-inb">${cvo.comment_content }</span>
							</div>
						<div class="hide"><textarea rows="3" cols="20"></textarea></div>
						<c:forEach items="${cclist }" var="ccvo">
							<c:if test="${cvo.comment_no eq ccvo.parent_comment }">
								<div class="child comment">
									<span class="font-w-b">${ccvo.id }</span>|
									<span class="font-s10 font-c-gray">${ccvo.comment_regdate }</span><br>
									<span class="margin-t10 display-inb">${ccvo.comment_content }</span>
								</div>	
							</c:if>
						</c:forEach>
						
					</c:forEach>
						     <input class="w-100 form-control" id="comment_content" type="text" placeholder="댓글입력"><br>
						     <button class="write_comment_btn" type="button" id="commentBtn">전송</button>
							
<!-- 						</form> -->
				
					<div class="modal-footer">
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
	      $('.slider').bxSlider();
	    });
	
	</script>
	</body>
</html>
 