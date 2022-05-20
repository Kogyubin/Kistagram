<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Overpass+Mono" rel="stylesheet">
<link href="resources/css/sign-in.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/sign-in.js"></script>

</head>
<body>

<div class="center">
<div id="wrapper">
  <div class="main-content">
    <div class="header">
      <img src="resources/img/kistagram.PNG" />
    </div>
    <div class="l-part">
    	<form class="form-signin" action="${path }/sign-in" method="post" name="form-signin">
	      <input type="text" name="username" placeholder="Username" class="input-1" />
	      <div class="overlap-text">
	        <input type="password"  name="password" placeholder="Password" class="input-2" />
	      </div>
	      <button type="button" value="Log in" class="btn-signin" >Log in</button>
	     </form>
    </div>
  </div>
  <div class="sub-content">
    <div class="s-part">
      Don't have an account?<a href="sign-up">Sign up</a>
    </div>
  </div>
</div>
</div>
</body>
</html>