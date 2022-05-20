<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../include/header.jsp" %>  
     <%@include file="../include/write-modal.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Overpass+Mono" rel="stylesheet">
<script type="text/javascript" src="resources/js/profile.js"></script>

<script> 


function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
	}; 
		reader.readAsDataURL(event.target.files[0]); 
	} 
</script>



</head>
<body>
<%@include file="../include/navigation.jsp"%>
<div class="center-pro">
<div id="wrapper1">
  <div class="main-content-pro">
    <div class="header">

    </div>
    <div class="l-part">
    	<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
			<input type="file" name="file" id="file" />
	    	<div class="profile0">
		    	<div class="profile1">
			    	<button class="btn-profile" onclick="document.all.file.click()" title="프로필 사진 추가">
			    		<img alt="프로필 사진 추가" class= "profile2" 
			    		src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
			    	</button>
				</div>	 
			</div>
					<button type="button" class="btn-photo" onclick="ocument.all.file.click()" >프로필 사진 바꾸기</button>
					
		</form>
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