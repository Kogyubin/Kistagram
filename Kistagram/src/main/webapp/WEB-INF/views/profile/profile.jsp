<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../include/header.jsp" %>  
     <%@include file="../include/write-modal.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Overpass+Mono" rel="stylesheet">
<script type="text/javascript" src="${path }/resources/js/profile.js"></script>

<script> 

// const reader = new FileReader();

// reader.onload = (readerEvent) => {
//     document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
//     //파일을 읽는 이벤트가 발생하면 img_section의 src 속성을 readerEvent의 결과물로 대체함
// };

// document.querySelector("#image").addEventListener("change", (changeEvent) => {
//     //upload_file 에 이벤트리스너를 장착

//     const imgFile = changeEvent.target.files[0];
//     reader.readAsDataURL(imgFile);
//     //업로드한 이미지의 URL을 reader에 등록
// })


	$(function() {
    $("#myFile").on('change', function(){
    readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#View').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}



// function handleFiles() {
//   const fileList = this.files[0]; 
  
//   console.log(fileList);

// }	

// var onFilePicked = function(event) {
// 	  var input = event.target;

// 	  var file = input.files[0];
// 	  console.log(file.size);
	  
	  
// 	  var test = document.getElementById("test");
// 	  console.log(test.value);
	  
	  
	  

// 	};
	
	
	$(function() {
		$(".btn-profileimg").click(function() {
			
		
			var form = $('.form-profileimg')[0];
			var formData = new FormData(form);
			
			
			$.ajax({
				type: "POST",
				enctype: 'multipart/form-data',
				url: '${path}/profileimg-up',
				processData: false,
				contentType: false,
				data: formData,
				
				success:function(data){
			
					console.log("success")
					alert("프로필 사진이 변경되었습니다.");
				}
// 			success:function(rs){
// 				if(rs.result==1) {
// 					alert('프로필 사진이 변경 되었습니다.');
// 				}else{
// 					alert('프로필사진을 선택해주세요.');
// 				}
// 			},
// 			error: function(jqXHR, textStatus, errorThrown) {
// 	            alert("프로필 사진을 선택해주세요.");
// 	        }
			});
		});
	});	


	
</script>



</head>
<body>
<%@include file="../include/navigation2.jsp"%>
<div class="center-pro">
<div id="wrapper1">
  <div class="main-content-pro">
    <div class="header">

    </div>
    <div class="l-part">
    	
			<form class="form-profileimg" id="uploadForm" method="post" enctype="multipart/form-data">
	    	<div class="profile0">
		    	<div class="profile1">
			    		<img alt="프로필 사진 추가" id="View"  class= "profile2" 
			    		src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
			    	
				</div>	 
			</div> 
					<input type="file" id="myFile" name="imgup" >
					<div id="label-filebtn">
					<label id="label-btn" for="myFile">프로필 사진 바꾸기</label>
					</div>
<!-- 					<button type="button" id="profile-photo" class="btn-photo" onclick="document.all.file.click()" >프로필 사진 바꾸기</button> -->
			</form>
					<button class="btn-profileimg">사진 변경</button>
		
		<form class="form-profile" action="" method="post" name="form-profile">
	      	<input type="text" id="id" name="id" placeholder="Username" class="input-1" value="${id }" readonly/>       
	      <div class="overlap-text">	    
	    

	    
	      	<input type="text" id="name" name="name" placeholder="Name" class="input-1" value="${name }"/>
	      </div>
	      <div class="overlap-text">
	        <input type="text" id="phone" name="Phone" placeholder="Phone" class="input-2" value="${phone }"/>
	      </div>
	      <div class="intr">
	      	<div class="introduce0">소개</div>
		      	 <textarea type="text" id="introduce" name="introduce"  class="input-2" >${introduce }</textarea>
	      	<button type="button" class="btn-profile1">제출</button>
	      </div>
	    </form>
    </div>
  </div>
  
</div>
</div>
</body>
</html>