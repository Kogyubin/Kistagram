<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Overpass+Mono" rel="stylesheet">
<link href="resources/css/sign-up.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/sign-up.js"></script>

</head>
<body>

<div class="center">
<div id="wrapper1">
  <div class="main-content">
    <div class="header">
      <img src="resources/img/kistagram.PNG" />
    </div>
    <div class="l-part">
    	<form class="form-signup" action="" method="post" name="form-signup">
    	<input type="hidden" name="idcheck" id="idcheck">
	      <input type="text" id="id" name="id" placeholder="Username" class="input-1" /> 
	       <button class="btn-idcheck">Check</button>	      
	      <div class="overlap-text">	    
	      <span id="idcheck-text" class="idcheck"></span>	      
	        <input type="password"  id="pw" name="pw" placeholder="Password" class="input-2" />
	      </div>
	      <input type="text" id="name" name="name" placeholder="Name" class="input-1" />
	      <div class="overlap-text">
	        <input type="text" id="phone" name="phone" placeholder="Phone" class="input-2" />
	      </div>
	      <button type="button" class="btn-signup">Sign up</button>
	     </form>
    </div>
  </div>
  <div class="sub-content1">
    <div class="s-part">
		계정이 있으신가요? <a href="/kr">  로그인</a>
    </div>
  </div>

</div>
</div>
</body>
</html>