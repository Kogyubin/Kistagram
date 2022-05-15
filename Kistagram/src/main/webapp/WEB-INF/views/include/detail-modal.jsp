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
		
			//댓글 리스트 가져오는 함수
			const commentList = function(comment_no){
				$.ajax({
					url : '${path}/commentList',
					type : 'get'
					data : {
						comment_no : comment_no
					},
					success : function(data){
						
						console.log("댓글 리스트 가져오기");
						
						//댓글 목록을 html로 담기
						let listHtml = "";
						for(const i in data){
							let comment_no = data[i].comment_no;
							let post_no = data[i].post_no;
							let id = data[i].id;
							let comment_content = data[i].comment_content;
							let comment_regdate = data[i].comment_regdate;
							let parent_comment = data[i].parent_comment;
							
							listHtml += "<div class= 'row commentrow comment" + comment_no + "'>";
							
								if(comment_content == ""){		//삭제된 댓글일 때
									listHtml += "	<div>";
									listHtml += "   		(삭제된 댓글입니다)"	;
									listHtml += "	</div>";
								}else{
									if(parent_comment == 0){
										
									}
								}
								
						};
					}
					
				});
				//댓글리스트 부분에 받아온 댓글리스트 넣기
				$(".comment-list"+comment_no).html(listHtml);
			};
				
		    
			
		    //댓글 등록
		    $("#commentBtn").on("click", function(){
		        	var id = "${session_id}" // 사용자 아이디
		        	var post_no = "${cvo.post_no}"; //게시글 번호
		            var comment_content = $("#comment_content").val();
		        	
		            console.log(post_no);
		            console.log(comment_content);
		        	
		        	
	                $.ajax({
	                	url : "${path}/write-comment",
	                    type : "POST",
	                    data : {
	                    	"id" : id,
	                    	"post_no" : post_no,
	                   		"comment_content" :comment_content,
	                   		
	                     },
	                    success : function(result){
	                    	var msg;
	                        
	                        switch(result) {
	                        case 1 :  //성공
	                        	msg = "댓글 등록 성공";
	                            // 내용을 작성한 tex를 다 지워줌
	                            $("#comment_content").val("");
	                            selectclist(); // selectclist()함수 호출
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
						<div id="id">
						      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							  </svg> &nbsp;${session_id }
					    </div>
						<div class="post-img">
					      	<ul class="slider">
								<c:forEach items="${pivo}" var="pivo">
								<li>
								<span class="image">
									<img src="${path += '/resources/uploadfolder/' += pivo.id += '/' += pivo.img_name}">
								</span>
								</li>
								</c:forEach>
							</ul>
					     </div>		
						  <div id="content" name="content">
						  </div>   
			      	    <div id="comment-icon">
					     	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
							  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
							  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
							</svg>
						</div>				
						<!-- 댓글 리스트 -->
						<c:forEach items="${clist }" var="cvo">
							<div class="comment"><input type="hidden" id="comment_no" value="${cvo.comment_no }">
								<span class="font-w-b" id="id">${cvo.id }</span> | 
								<span class="font-s10 font-c-gray" id="comment_regdate">${cvo.comment_regdate }</span>&nbsp;&nbsp;
								<span class="margin-t10 display-inb" id="comment_content">${cvo.content }</span>
							</div>
							
						</c:forEach>
						
						<!--댓글 작성  -->
<!-- 						<div class="input_comment_div"> -->
				     		<input class="w-100 form-control" id="comment_content" type="text" placeholder="댓글입력"><br>
					     	<button class="write_comment_btn" type="button" id="commentBtn">전송</button>
<!-- 						</div> -->
						
			   
				</div>	    	
					<div class="modal-footer">
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
 