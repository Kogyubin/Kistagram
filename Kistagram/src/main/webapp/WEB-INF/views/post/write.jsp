<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Kistagram</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicons -->
		  <link href="resources/img/favicon.png" rel="icon">
		  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">
		
		  <!-- Google Fonts -->
		  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
		    rel="stylesheet">
				<link rel="stylesheet" href="resources/css/write.css">
				<link rel="stylesheet" href="resources/js/write.js">
	</head>
	<script type="text/javascript">
		$(function(){
				
				$("#writeBtn").click(function(e){
					
					e.preventDefault();
					let content = $("input[name='content']");
					let img = $("input[name='img']");
					
					if(content.val()==""||img.val()=""){
						alert("사진 또는 글을 등록해주세요.");
						return;
					}
					
					$("#write-form").submit();
				});
				
				
			});
			

</script>
<body>
	<form action="wrtie-action" id="write-form" method="post" enctype="multipart/form-data">
	  <div id= "back">
	    <h3>WRITE A POST</h3>
	    <div id="post">
	
	      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
		  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
		  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
		</svg>
	      <input type="text" id="id" name="id">
	
	      
	      <textarea rows="10" cols="140">
	
		</textarea>
		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-images" viewBox="0 0 16 16">
		  <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
		  <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z"/>
		</svg>
		<div>
		<input type="file" name="uploadfile" multiple="multiple">
		</div>
	      <label>
	    	<input type="submit" id="writeBtn" value="공유하기">
	    </label>
	    
	    </div>
	  </div>
	</form>
</body>
</html>