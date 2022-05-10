<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp" %>
<%@include file="./include/modal.jsp" %>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <title>Kistagram</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
<!--   <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  

  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
    rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="resources/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="resources/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/css/style.css" rel="stylesheet">

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
	

	
$(document).ready(function() {
 
	//write 버튼 클릭	
	$("#writeBtn").click(function() {
		
		action = 'create';
		type = 'post',
		
		$("#modal-title").text("Write");
		$("#id").val("");
		$("#id").attr("readonly",false);
		$("#content").val("");
		
		$("#myLargeModal").modal();

	});
	
	
	//이미지 미리보기
	 $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
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
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
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
// 	$("#modalSubmit").click(function() {
		
// 		if (action == 'create') {
// 			url = '${path}/write-action';
// 		} else if (action == 'modify') {
// 			url = '${path}/write-update';
// 		}

// 		var data = {
// 			id : $("#id").val(),
// 			content : $("#content").val()
			
// 		};

// 		console.log(data);

// 		$.ajax({
// 			url : url,
// 			type : type,
// 			processData : false,
// 			contentType : false,
// 			data : data
// 		}).done(function(result) {



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
			}
			
		});
		
	});
		
	});
	
	
 	
	
 
 </script>
</head>

<body>

  <div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
    <div class="container py-2 py-md-5">
      <div class="row align-items-start">
        <div class="col-md-2">
          <ul class="custom-menu">
            <li class="active"><a href="index.html">Home</a></li>
            <li><a href="resources/about.html">About Me</a></li>
            <li><a href="resources/services.html">Services</a></li>
            <li><a href="resources/works.html">Works</a></li>
            <li><a href="resources/contact.html">Contact</a></li>
          </ul>
        </div>
        <div class="col-md-6 d-none d-md-block  mr-auto">
          <div class="tweet d-flex">
            <span class="icofont-twitter text-white mt-2 mr-3"></span>
            <div>
              <p><em>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut
                  officiis explicabo inventore. <br> <a href="#">t.co/v82jsk</a></em></p>
            </div>
          </div>
        </div>
        <div class="col-md-4 d-none d-md-block">
          <h3>Hire Me</h3>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam necessitatibus incidunt ut officiis
            explicabo inventore. <br> <a href="#">myemail@gmail.com</a></p>
        </div>
      </div>

    </div>
  </div>

  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">Kistagram.</a>

	<span class='green_window'>
<input id=text type="text" class='input_text' name="search" onkeydown="enterSearch()"/></span>
<input type="button" class='sch_smit' value="검색" onclick="myFunction()"/>
<!-- JAVASCRIPT -->
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
            <h2>Yumvely</h2>
            <p class="mb-0">Freelance Creative &amp; Professional Graphics Designer</p>
            <div class="follower">
            <p class="mb-0">팔로워   6514</p> 
            </div>
            <div class="follow">
            <p class="mb-0">팔로우   0</p>
            </div>
            </div>
          </div>
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="${path }/main" data-filter="*" class="active">All</a>
              <a href="${path }/profile" >Profile</a>
               <a id="writeBtn" data-toggle="modal" class="write">Write</a>
              <a href="#" data-filter=".branding">Follow</a>
            </div>
          </div>
          <div>
           
          </div>
        </div>
        
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
          <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="resources/work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Boxed Water</h3>
                <span>Web</span>
              </div>
              <img class="img-fluid" src="resources/img/img_1.jpg">
            </a>
           
          </div>
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="resources/work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Build Indoo</h3>
                <span>Photography</span>
              </div>
              <img class="img-fluid" src="resources/img/img_2.jpg">
            </a>
          </div>
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="resources/work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Cocooil</h3>
                <span>Branding</span>
              </div>
              <img class="img-fluid" src="resources/img/img_3.jpg">
            </a>
          </div>
          <div class="item design col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="resources/work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Nike Shoe</h3>
                <span>Design</span>
              </div>
              <img class="img-fluid" src="resources/img/img_4.jpg">
            </a>
          </div>
          <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="resources/work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Kitchen Sink</h3>
                <span>Photography</span>
              </div>
              <img class="img-fluid" src="resources/img/img_5.jpg">
            </a>
          </div>
          <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
            <a href="resources/work-single.html" class="item-wrap fancybox">
              <div class="work-info">
                <h3>Amazon</h3>
                <span>brandingn</span>
              </div>
              
              <img class="img-fluid" src="resources/img/img_6.jpg">
            </a>
          </div>
        </div>
      </div>
    </div>
	
    


    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">My Services</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
          </div>
        </div>
        <div class="row">

          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-cube la-3x mb-4"></span>
            <h4 class="h4 mb-2">Web Design</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-mobile la-3x mb-4"></span>
            <h4 class="h4 mb-2">Mobile Applications</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-image la-3x mb-4"></span>
            <h4 class="h4 mb-2">Graphic Design</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-search la-3x mb-4"></span>
            <h4 class="h4 mb-2">SEO</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
<!-- 게시글 작성 -->
    
 	<!-- Modal -->
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
								</svg> <input type="text" id="id" name="id" value="${session_id }">
						      <div>
						      <textarea rows="6" cols="50" name="content" placeholder="문구입력"></textarea>
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
<!-- 					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
				</div>
			</div>
		</div>
	</div>
  </main>
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright MyPortfolio. All Rights Reserved</p>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-twitter"></span></a>
          <a href="#"><span class="icofont-facebook"></span></a>
          <a href="#"><span class="icofont-dribbble"></span></a>
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Vendor JS Files -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/jquery/jquery-migrate.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="resources/vendor/easing/easing.min.js"></script>
  <script src="resources/vendor/php-email-form/validate.js"></script>
  <script src="resources/vendor/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/vendor/aos/aos.js"></script>
  <script src="resources/vendor/owlcarousel/owl.carousel.min.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/js/main.js"></script>

</body>

</html>
