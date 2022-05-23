<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <title>Kistagram</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
<!--   <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  

  <!-- Favicons -->
  <link href="resources/img/kistagram favicon.PNG" rel="icon">
  

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
		$("#id").val("${session_id}");
		$("#id").attr("readonly",true);
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
	
//게시글 상세 보기

function fn_Detail(post_no) {
	
	console.log(post_no);
	$.ajax({
		url : "${path}/detail",
		type : "post",
		data : {
			post_no : post_no
		},
		success : function(result) {
			console.log(result);
			$("#post_no").val(result.post_no);
			$("#id").val(result.id);
			$("#id").attr("readonly", true);
			$("#content").text(result.content);
			$("#content").attr("readonly", true);
			

			$("#myLargeModal2").modal();
// 			action = "modify";
		}
	});
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
      <a class="navbar-brand" href="${path }/main">Kistagram.</a>

	<span class='green_window'>
		<input id=text type="text" class='input_text' name="search" onkeydown="enterSearch()"/></span>
		<input type="button" class='sch_smit' value="검색" onclick="myFunction()"/>

    </div>
  </nav>

 <main id="main">




		<div class="navimenu">
          <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
            <div id="filters" class="filters">
              <a href="${path }/profile" >Profile</a>
               <a id="writeBtn" data-toggle="modal" class="write">Write</a>
              <a href="#" data-filter=".branding">Follow</a>
              <a href="${path }/sign-out" class="logout">Logout</a>
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