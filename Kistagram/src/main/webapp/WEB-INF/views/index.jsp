<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="./include/header.jsp"%>

<!DOCTYPE html>

<html>
<head>
<title>Kistagram</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>



<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="resources/vendor/line-awesome/css/line-awesome.min.css"
	rel="stylesheet">
<link href="resources/vendor/aos/aos.css" rel="stylesheet">
<link href="resources/vendor/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- =======================================================
	    Template Name: MyPortfolio
	    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
	    Author: BootstrapMade.com
	    Author URL: https://bootstrapmade.com/
	  ======================================================= -->
<head>
<meta charset="utf-8">
<title>Kistagram</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<!--   <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="resources/css/style.css" rel="stylesheet">
<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="resources/vendor/line-awesome/css/line-awesome.min.css"	rel="stylesheet">
<link href="resources/vendor/aos/aos.css" rel="stylesheet">
<link href="resources/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">


<!-- Template Main CSS File -->


<!-- =======================================================
    Template Name: MyPortfolio
    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com/
  ======================================================= -->


<script>
 
 
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
		$("#id").val("${session_id}");
		$("#id").attr("readonly",true);
		$("#content").val("");
		
		
		$("#myLargeModal").modal();

	});
	
	//파일 업로드
	$(document).ready(function(){ 
	  var fileTarget = $('#file'); 
	  fileTarget.on('change', function(){ // 값이 변경되면
	      var cur=$(".filebox input[type='file']").val();
	    $(".upload-name").val(cur);
	  }); 
	}); 
	
	
	
	//이미지 미리보기
	 $('#file').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#file').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });

    /**
    onclick event handler for the delete button.
    It removes the image, clears and unhides the file input field.
    */
    $('#image_preview a').bind('click', function() {
        resetFormElement($('#file')); //전달한 양식 초기화
        $('#file').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
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
// 						 $("#wrtie-form").val("");
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
			}
			
		});
		
	});
		
});
	
	
function postDetail(post_no){
	$.ajax({
		url : "${path}/detail",
		type : "post",
		data : {
			post_no : post_no
		},
		success : function(result) {
			console.log(result);
			$(".slider").html();
			$("#post_no").val(result[0].post_no);
			$("#id").val(result[0].id);
			$("#id").attr("readonly", true);
			$("#content").text(result[0].content);
			$("#content").attr("readonly", true);
			
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
		 		
		 		listHtml += "<div class='comment-list-array'>"
// 		 		listHTML += "<img src='${path}/resources/img/profile.png'>";
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

 
 </script>

<script type="text/javascript">
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



	<nav class="navbar navbar-light custom-navbar">
		<div class="container">
			<a class="navbar-brand" href="${path }/main">Kistagram.</a> <span
				class='green_window'> <input id=text type="text"
				class='input_text' name="search" onkeydown="enterSearch()" /></span> <input
				type="button" class='sch_smit' value="검색" onclick="myFunction()" />

		</div>
	</nav>

	<main id="main">


		<div class="site-section site-portfolio">

			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">

						<div class="box">
							<img class="profile" src="resources/img/profile.jpg" alt="Image">
						</div>

						<div class="state">
							<div id="mainid">
								<input type="text" id="id" name="id" placeholder="Username" ]
									style="border: 0px solid black; font-family: Raleway, sans-serif; font-size: 45px; background-color: #fff;"
									value="${id }" readonly />
							</div>
							<input type="text" id="mainintro" name="introduce"
								class="input-2" readonly value="${introduce }" />
							<div class="follower">

								<p class="mb-0">팔로워 6514</p>
							</div>
							<div class="follow">
								<p class="mb-0">팔로우 0</p>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-6 text-left text-lg-right"
						data-aos="fade-up" data-aos-delay="100">
						<div id="filters" class="filters">
							<a href="${path }/profile">Profile</a> 
							<a id="writeBtn" data-toggle="modal" class="write">Write</a> 
							<a href="#"	data-filter=".branding">Follow</a> 
							<a href="${path }/sign-out"	class="logout">Logout</a>
						</div>
					</div>
				</div>


				<!--         <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200"> -->

				<!--           <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4"> -->
				<ul class="img-list">
					<c:forEach items="${pilist }" var="pilist">
						<!-- 						<span class="image"> -->
						<li onclick="fn_Detail(${pilist.post_no}); return false;">
							<img src="${path += '/resources/uploadfolder/' += pilist.id += '/' += pilist.img_name}"	width="360" height="360" />
						</li>
						<!-- 						</span> -->

						<!--               <div class="work-info"> -->
						<!--                 <h3>Boxed Water</h3> -->
						<!--               </div> -->
						<!--               <img class="img-fluid" src="resources/img/img_1.jpg"> -->

					</c:forEach>
				</ul>
			</div>
		</div>
		  	
		
			<!-- 게시글 상세 -->
			<%@include file="./include/detail-modal.jsp"%>
			<!-- 게시글 작성 -->
			<%@include file="./include/write-modal.jsp"%>
	</main>
	<footer class="footer" role="contentinfo">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<p class="mb-1">&copy; 2022 Kistagram from Meta</p>
					<div class="credits">
						<!--
	              All the links in the footer should remain intact.
	              You can delete the links only if you purchased the pro version.
	              Licensing information: https://bootstrapmade.com/license/
	              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
	            -->
					</div>
				</div>

			</div>
		</div>
	</footer>

	<!-- Vendor JS Files -->
<!-- 	<script src="resources/vendor/jquery/jquery.min.js"></script> -->
<!-- 	<script src="resources/vendor/jquery/jquery-migrate.min.js"></script> -->
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/easing/easing.min.js"></script>
<!-- 	<script src="resources/vendor/php-email-form/validate.js"></script> -->
	<script src="resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<script src="resources/vendor/aos/aos.js"></script>
	<script src="resources/vendor/owlcarousel/owl.carousel.min.js"></script>
	<!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>

</body>
</html>
