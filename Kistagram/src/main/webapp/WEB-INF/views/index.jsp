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
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<script>



//팔로우 요청
$(document).ready(function() {
	
	$("#follow-request-btn").click(function() {
		
		var id = "${session_id}";
		var following = "${member_md}"
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
                 	
                 } else {
                 	msg = "팔로우 실패";
                 }
                 
                 alert(msg);
             }
		});
			
	});
});	
	
//파일 업로드
	var bxSlider;
	
$(document).ready(function(){ 
	
	 bxSlider = $('.bxSlider').bxSlider(); 
	
	  var fileTarget = $('#file'); 
	  fileTarget.on('change', function(){ // 값이 변경되면
	      var cur=$(".filebox input[type='file']").val();
		    $(".bxSlider").html();
		    $(".upload-name").val(cur);
	   
	  }); 
	  
	  $("#myLargeModal").on('hidden.bs.modal', function (e){

		  $(this).find('form')[0].reset();
		  $(".bxSlider").html("");
	  });
}); 


 	var action = '';
	var url = '';
	var type = '';
	var slider;

	
$(document).ready(function() {
	
	slider = $('.slider').bxSlider(); 

 
	//write 버튼 클릭	
	$("#writeBtn").click(function() {
		
		action = 'create';
		type = 'post',
		
		
		$("#modal-title").text("Write");
		
		if("${profile_name}" != "") {
			$("#post_id img").attr("src","${path}/resources/profileimg-uploadfolder\\"
						+ "${session_id}" + "\\" + "${profile_name}");
			}
		
		$("#post_id span").text("${session_id}");
		$("#post-content").val("");
		
		
		$("#myLargeModal").modal();
		


	});
	
//다중파일 이미지 미리보기
	var sel_files = [];
	
	$('#file').on("change", handleImgsFilesSelect);

	function handleImgsFilesSelect(e){
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
			
			console.log(result);
			
			$(".slider").html();
			$("#detail_post_no").val(result[0].post_no);
			
			if(result[0].profile_name != null) {
				$("#detail_id img").attr("src","${path}/resources/profileimg-uploadfolder/"
						+ result[0].id + "/" + result[0].profile_name);
			}
			
			$("#detail_id span").text(result[0].id);
			$("#detail_content").text(result[0].content);
			
			
			
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
		type : 'get',
		data: {post_no : post_no
		},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			
			console.log(data);
			
			//댓글 목록을 html로 담기
			let listHtml = "";
		 	for(let j=0; j<data.length; j++){
		 		
		 		listHtml += "<div class='comment-list-array'>";
		 		listHtml += "<img src='${path}/resources/profileimg-uploadfolder\\"+ data[j].id + "\\" + data[j].profile_name+"' id='post_profile_img'>";
		 		listHtml += "<span class='comment-id-array'> "+ data[j].id + "</span>";
		 		listHtml += "<span> "+data[j].comment_content+" </span><br>";
		 		listHtml += "<span class='comment-regdate-array'> "+data[j].comment_regdate+"</span>";
		 		listHtml += "</div>"
		 		
            }
                
            console.log(listHtml);
            $("#commentList").html(listHtml);
            
        }
    });
}
	
	
//게시글 상세 보기
function fn_Detail(post_no) {
	
	console.log(post_no);
	
	$("#detail_post_no").val(post_no);
	
	postDetail(post_no);
	commentList(post_no);
	
	
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
		
		 function sendKeyword(){
								
			  var userKeyword = document.myForm.userKeyword.value;
			  if(userKeyword==""){
			   hide();//검색창이 비워져있으면 숨김
			   return;
			  }
			  var params = "userKeyword="+userKeyword;
			  console.log("params : "+params)
			  sendRequest('${path}/search', params, displaySuggest, "POST");
		}


			 function displaySuggest(){
			  if(httpRequest.readyState==4){
			   if(httpRequest.status==200){//서버응답 정상처리인 경우
			    var resultText = httpRequest.responseText;//resposne로 넘어온 텍스트 할당
			    //alert(resultText);
			    //5|abc,ajax,abc마트
			    var resultArray = resultText.split("|"); //{5, {abc,ajax,abc} } 로 나눔
			    var count = parseInt(resultArray[0]);//5
			    var keywordList = null;
			    if(count>0){
			     keywordList = resultArray[1].split(",");
			     var html = "";
			     for(var i=0;i<keywordList.length;i++){			    	 
			      html += "<a href=\"javascript:select('" +
			      keywordList[i] + "');\">" +
			      keywordList[i] + "</a><br/>";
			      //<a href="javascript:select('ajax');">ajax</a><br/>
			     }
			     var suggestListDiv = document.getElementById("suggestListDiv");
			     suggestListDiv.innerHTML = html;
			     show(); 
			    }else{
			     //count==0
			     hide();
			    } 
			   }else{
			    //status!=200
			    hide();
			   }
			  }else{
			   //readyState!=4
			   hide();
			  }
			 }//function..end


			 //사용자가 제시어중에서 클릭한 키워드
			 function select(selectKeyword){
			  //클릭한 제시어를 inputbox에 넣어줌
			  document.myForm.userKeyword.value = selectKeyword;
			  hide();//다른 제시어 감춤
			 }
			 function show(){
			  var suggestDiv = document.getElementById("suggestDiv");
			  suggestDiv.style.display = "block";
			 }
			 function hide(){
			  var suggestDiv = document.getElementById("suggestDiv");
			  suggestDiv.style.display = "none";
			 }
			 //처음 DOM이 로드되었을때 보이지 않도록
			 window.onload = function(){
			  hide();
			 }
		
		
		
		
	</script>
</head>
<body>

	<%@include file="include/navigation2.jsp"%>
<!-- 	<nav class="navbar-light custom-navbar"> -->
<!-- 		<div class="margin-b-30 container"> -->
<%-- 			<a class="navbar-brand" href="${path }/main">Kistagram.</a>  --%>
			
<!-- 			<div style="float:right;"> -->
<!-- 			<span class='green_window'>  -->
<!-- 				<input id=text type="text" class='input_text green_window' name="search" onkeydown="enterSearch()" /> -->
<!-- 			</span>  -->
<!-- 			<input type="button" class='sch_smit' value="검색" onclick="myFunction()" /> -->
<!-- 			</div> -->
<!-- 			<div id="filters" class="filters"> -->
<%-- 				<a href="${path }/profile">Profile</a>  --%>
<!-- 				<a id="writeBtn" data-toggle="modal" class="write">Write</a>  -->
<!-- 				<a href="#"	data-filter=".branding">Follow</a>  -->
<%-- 				<a href="${path }/sign-out"	class="logout">Logout</a> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</nav> -->

	<main id="main">


		<div class="site-section site-portfolio">

			<div class="container">
				<div class="mb-5 align-items-center">
					<div class="col-md-12 mb-4 mb-lg-0" data-aos="fade-up">

						<div class="box">
							<img class="profile"
								src="${path }/resources/profileimg-uploadfolder/${id }/${profile_name}"
								alt="Image">
						</div>

						<div class="state">

								<input type="text" id="id" name="id" class="mainid" size="10" value="${id }" readonly ><br>
								<p>${introduce }</p>
					
								<span class="mb-0 mg-20 dis-ib">팔로워 ${followerCnt }</span>
								<span class="mb-0 mg-20 dis-ib">팔로우 ${followCnt }</span>
								
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
							<img src="${path += '/resources/uploadfolder/' += pilist.id += '/' += pilist.img_name}" width="360" height="360" />
						</div>


					</c:forEach>
				</div>
			</div>
		</div>


		<!-- 게시글 상세 -->
		<%@include file="./include/detail-modal.jsp"%>
		<!-- 게시글 작성 -->
		<%@include file="./include/write-modal.jsp"%>
	</main>
	<%@include file="./include/footer.jsp" %>

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
