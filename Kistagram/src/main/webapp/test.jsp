<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	
	  <script>
	    $(document).ready(function(){
	      $('.slider').bxSlider({
	    	  infiniteLoop: false,
	    	  pager: false
	      });
	    });
	  </script>
</head>
<body>
	<ul class="slider">
	    <li><img src="resources/uploadfolder/user/diane_20220510232936753.jpg"></li>
<!-- 	    <li><img src="resources/uploadfolder/user/IU_20220513094457011.jpg"></li> -->
	</ul>
</body>
</html>