<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>

<!DOCTYPE>

<html>

<head>
<title>Kistagram</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<script type="text/javascript" charset="UTF-8">




//팔로우 요청
$(document).ready(function() {
	
	$("#follow-request-btn").click(function() {
		
		var id = "${session_id}";
		var following = "${id}";
		var follower = "${session_id}";
		
		console.log("follow 요청 id:" + id);
		console.log("follow 상대 id:" + following);
		
		 $.ajax({
         	url : "${path}/follow-action",
             type : "POST",
             data : {
             	id : id,
             	following : following,
             	follower : id
            	
              },
             success : function(result){
            	 
            	 
             	var msg;
                 
                 if(result) {
                 	 msg = "팔로우 성공";
                 	window.location.reload();
                 } else {
                 	msg = "팔로우 실패";
                 }
                 
                 alert(msg);
             }
		});
			
	});
});	

//팔로워 리스트
function fn_followerList(id) {
	
	$.ajax({
		url : "${path}/followerList",
		type : "post",
		data : {
			id : id
		},
		success : function(data){
			
			console.log(data);
			
			let followerHtml = "";
			
				for(let i=0; i<data.length; i++){
					
					followerHtml += "<div class='follower-list-array'>";
					if(data[i].profile_name!=null){
						
				 		followerHtml += "<img src='${path}/resources/profileimg-uploadfolder\\"+ data[i].id + "\\" + data[i].profile_name+"'>";
			 		} else {
			 			followerHtml += "<img src='${path}/resources/img/profile.png' id='post_profile_img'>";
			 		}
					followerHtml += "<span><a href='${path}/main/"+data[i].id+"'>"+data[i].id+"</a></span>";
					
					followerHtml +=  "<div id='follower_name'>" + data[i].name +"</div>";
					followerHtml +=  "</div>";

						
					
				}
			
				$("#followerList").html(followerHtml);
				$("#mySmallModal").modal();
			}
		
		});
	
}

//팔로우 리스트
function fn_followList(id) {
	
	$.ajax({
		url : "${path}/followList",
		type : "post",
		data : {
			id : id
		},
		success : function(data){
			
			console.log(data);

			let followHtml = "";
			
				for(let i=0; i<data.length; i++){
					
					followHtml += "<div class='follow-list-array'>";
					if(data[i].profile_name!=null){
						
				 		followHtml += "<img src='${path}/resources/profileimg-uploadfolder\\"+ data[i].id + "\\" + data[i].profile_name+"'>";
			 		} else {
			 			followHtml += "<img src='${path}/resources/img/profile.png' id='post_profile_img'>";
			 		}
					followHtml += "<span><a href='${path}/main/"+data[i].id+"'>"+data[i].id+"</a></span>";
					if(id == "${session_id}"){
						followHtml += "<span><input type='button' value='팔로잉' onclick='fn_delFollowBtn(\""+data[i].id+"\");'></sapn>"
					}
					followHtml +=  "<div id='follow_name'>" + data[i].name +"</div>";
					followHtml +=  "</div>";
						
					
				}
			
				$("#followList").html(followHtml);
				$("#mySmallModal2").modal();
			}
		
		});
	
}

	
var bxSlider; //write
var slider;   //detail
var action = '';
var url = '';
var type = '';

	
$(document).ready(function(){ 
	
	bxSlider = $('.bxSlider').bxSlider({
		infiniteLoop: false,
		pager: false
	}); 
	
	
	slider = $('.slider').bxSlider({
		infiniteLoop: false,
		pager: false
	}); 
	
// 	  var fileTarget = $('#file'); 
// 	  fileTarget.on('change', function(){ // 값이 변경되면
// 	      var cur=$(".filebox input[type='file']").val();
// 		    $(".bxSlider").html();
// 		    $(".upload-name").val(cur);
	   
// 	  }); 
	  
	  $("#myLargeModal").on('hidden.bs.modal', function (e){
		  
// 		  var msg = confirm("게시글 등록을 취소하시겠습니까?");
			
// 			if(msg){
		  
			  $(this).find('form')[0].reset();
			  $(".bxSlider").html("<li><img id='photo-icon' src='${path}/resources/img/photo-icon.png'></li>");
// 			} 
	  });

 
	//write 버튼 클릭	
	$("#writeBtn").click(function() {
		
		
		action = 'create';
		type = 'post';
		
		$("#modal-title").text("Write");
		console.log("modal-title");

		$.ajax({
			url : "${path}/writeUserInfo",
			type : "post",
			
			success : function(result) {
				//console.log(result);
				if(result.profile_name != null) {
					$("#post_id img").attr("src","${path}/resources/profileimg-uploadfolder/"
								+ "${session_id}" + "/" + result.profile_name);
					}
				$("#post_id span").text("${session_id}");
				$("#post-content").val("");
				$("#myLargeModal").modal();
				
				bxSlider.reloadSlider();
				console.log("modal-title-success");
			}
		});

	});
	
//다중파일 이미지 미리보기
	var sel_files = [];
	
	$('#file').on("change", handleImgsFilesSelect);

	function handleImgsFilesSelect(e){
		$(".bxSlider").empty();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")) {
				alert("이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)");
				return;
			}
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\""+e.target.result +"\" />";
// 				var img_html = $(".imgs_wrap img").attr("src","\""+e.target.result +"\" /");
				$(".bxSlider").append(img_html);
				bxSlider.reloadSlider();
			}
			reader.readAsDataURL(f);
			

		});
	}
	
	
	//Modal의 submit 버튼 클릭

	$("#modalSubmit").click(function() {
		
		var form = $('#write-form')[0];
		var formData = new FormData(form);
		
		var inputFile = $("input[name='uploadfile']");
		var files = inputFile[0].files;
		
		
		console.log(files);
		
		//파일 formData에 추가
	
		for(var i=0; i< files.length; i++){
			formData.append('uploadfiles', files[i]);
			
			}
		
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: '${path}/write-action',
			processData: false,
			contentType: false,
			data: formData,
			
			success: function(result){
				if (action == 'create') {
					if (result) {
						alert("등록에 성공하였습니다.");

					} else {
						alert("오류가 발생하였습니다. 다시 등록해주세요");
					}
				} else if (action == 'modify') {
					if (result) {
						alert("수정에 성공하였습니다.");
					} else {
						alert("수정에 실패하였습니다.");
					}
				}
				
				$("#myLargeModal").modal('toggle');
				window.location.reload();
			}
			
		});
		
	});
	
	
	$(".input_text").on("blur", function(){
		$("body").on("click", function(e){
			if(e.target.parentNode.id != "suggestListDiv"){
				hide();
			}
		});
	});
});

	
	
function postDetail(post_no){
	
	console.log("post_no : "+post_no);
	$.ajax({
		url : "${path}/detail",
		type : "post",
		data : {
			post_no : post_no
		},
		success : function(result) {
			
// 			console.log(result);
// 			$(".slider").html();
			$("#detail_post_no").val(result[0].post_no);
			
			if(result[0].profile_name != null) {
				$("#detail_id img").attr("src","${path}/resources/profileimg-uploadfolder/"
						+ result[0].id + "/" + result[0].profile_name);
			}
			
			$("#detail_id span").text(result[0].id);
			$("#detail_content").text(result[0].content);
			$("#detail_regdate").text(result[0].regdate);
			
			let imgHTML="";
			for(let i=0; i < result.length ; i++ ){
				imgHTML += "<li><img src='${path}/resources/uploadfolder\\" + result[i].id + "\\" + result[i].img_name +"'></li>";
			}
			console.log(imgHTML);
			$(".slider").html(imgHTML);
			
			$("#myLargeModal2").modal();
			
			slider.reloadSlider();
// 			alert("aa");
		
// 			action = "modify";
		}
	});
}	
	
function commentList(post_no){
	
	$.ajax({
		url : "${path}/commentList",
		type : 'GET',
		data: {post_no : post_no
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			
			console.log(data);
			
			//댓글 목록을 html로 담기
			let listHtml = "";
		 	for(let j=0; j<data.length; j++){
		 		
		 		listHtml += "<div class='comment-list-array'>";
		 		if(data[j].profile_name!=null){
			 		listHtml += "<img src='${path}/resources/profileimg-uploadfolder\\"+ data[j].id + "\\" + data[j].profile_name+"' id='post_profile_img'>";
		 		} else {
		 			listHtml += "<img src='${path}/resources/img/profile.png' id='post_profile_img'>";
		 		}
		 		listHtml += "<span class='comment-id-array'><a href='${path}/main/"+data[j].id+"'>" + data[j].id + "</a></span>";
		 		listHtml += "<span> "+data[j].comment_content+" </span><br>";
		 		listHtml += "<span class='comment-regdate-array'> "+data[j].comment_regdate+"</span>";
		 		listHtml += "</div>"
		 		
            }
                
            $("#commentList").html(listHtml);
            
        }
    });
}

function likeState(post_no){
	console.log("like-state");
	var id = "${session_id}";
	
	$.ajax({
		url: "${path}/like-state",
		type: 'POST',
		data: {
			id: id,
	    	post_no: post_no
		},
		success : function(result) {
			
			console.log(result);
			
			$("#like-check").val(result);
			
			if(result == 1) {
				$('.post_like_section #like_img').attr("src", "${path}/resources/img/like.png" );
			}else {
				$('.post_like_section #like_img').attr("src", "${path}/resources/img/dislike.png" );
			}
		}
		
	});
}
	
	
//게시글 상세 보기
function fn_Detail(post_no) {
	
	console.log(post_no);
	
	$("#detail_post_no").val(post_no);
	
	postDetail(post_no);
	commentList(post_no);
	likeState(post_no);
	
}


		function enterSearch() {
		    if(event.keyCode == 13){
		        myFunction();  // 실행할 이벤트
		    }
		}
		function myFunction() {
		    var x = document.getElementById("text").value;
		    window.location.href = "http://cybertramp.net/search/"+x;
		}
		
		
		

		
		
	</script>
</head>
<body>


	<%@include file="include/navigation2.jsp"%>

	<main id="main">

		<div class="site-section site-portfolio">

			<div class="container">
				<div class="mb-5 align-items-center">
					<div class="col-md-12 mb-4 mb-lg-0" data-aos="fade-up">

						<div class="box">
							<c:choose>
								<c:when test="${ empty profile_name}">
									<img class="profile" src="${path }/resources/img/profile.png" alt="Image">
								</c:when>
								<c:otherwise>
									<img class="profile" src="${path }/resources/profileimg-uploadfolder/${id }/${profile_name}" alt="Image">
								</c:otherwise>
							</c:choose>
						</div>

						<div class="state">

							<input type="text" id="id" name="id" class="mainid" size="10" value="${id }" readonly><br>
							<p>${introduce }</p>

<%-- 							<span class="mb-0 mg-20 dis-ib">게시물 ${postCnt }</span>  --%>
							<span class="mb-0 mg-20 dis-ib">
								<a href="javascript:fn_followerList('${id }')">팔로워	${followerCnt }</a>
							</span> 
							<span class="mb-0 mg-20 dis-ib">
								<a href="javascript:fn_followList('${id }')">팔로우 ${followCnt }</a>
							</span>

							<c:choose>
								<c:when test="${followState eq 0 }">
									<c:choose>
										<c:when test="${id eq session_id }">
											<span></span>
										</c:when>
										<c:otherwise>
											<span> 
												<input type="button" id="follow-request-btn" value="팔로우">
											</span>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${followState eq 1 }">
									<span>
										<button type="button" id="already-follow-btn">
											<div>
												<img id="already-follow-icon" src="${path }/resources/img/already-follow-icon.png">
											</div>
										</button>
									</span>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<!--         <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200"> -->

				<!--           <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4"> -->
				<div class="row mb-5 align-items-center">
					<c:forEach items="${pilist }" var="pilist">
						<div class="img-div" onclick="fn_Detail(${pilist.post_no}); return false;">
							<img src="${path += '/resources/uploadfolder/' += pilist.id += '/' += pilist.img_name}"	width="360" height="360" />
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 팔로워 리스트 -->
		<%@include file="./include/followerList-modal.jsp"%>
		<!-- 팔로우 리스트 -->
		<%@include file="./include/followList-modal.jsp"%>
		<!-- 게시글 상세 -->
		<%@include file="./include/detail-modal.jsp"%>
		<!-- 게시글 작성 -->
		<%@include file="./include/write-modal.jsp"%>
	</main>
	<%@include file="./include/footer.jsp"%>

	<!-- Vendor JS Files -->
	<!-- 	<script src="resources/vendor/jquery/jquery.min.js"></script> -->
	<!-- 	<script src="resources/vendor/jquery/jquery-migrate.min.js"></script> -->
	<script src="${path }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${path }/resources/vendor/easing/easing.min.js"></script>
	<!-- 	<script src="resources/vendor/php-email-form/validate.js"></script> -->
	<script src="${path }/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<script src="${path }/resources/vendor/aos/aos.js"></script>
	<script src="${path }/resources/vendor/owlcarousel/owl.carousel.min.js"></script>
	<!-- Template Main JS File -->
	<script src="${path }/resources/js/main.js"></script>

</body>

</html>
