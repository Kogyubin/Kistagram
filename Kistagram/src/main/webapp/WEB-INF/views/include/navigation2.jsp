
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<!-- Bootstrap CSS File -->
<link href="${path }/resources/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${path }/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="${path }/resources/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
<link href="${path }/resources/vendor/aos/aos.css" rel="stylesheet">
<link href="${path }/resources/vendor/owlcarousel/assets/owl.carousel.min.css"	rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap" rel="stylesheet">
<nav class="navbar-light custom-navbar">
	<div class="margin-b-15 container navibar">
		<a class="navbar-brand" href="${path }/main/${session_id}">Kistagram.</a>
		

		<form action="" class="searchform" name="myForm">
			<div>
				<img class="search-icon" src="${path }/resources/img/search-icon.png">
				<input id="userKeyword" type="search" autocomplete="off" placeholder="검색" class='input_text green_window' name="userKeyword" onkeyup="sendKeyword();" />
			</div>
			<div id="suggest1">
				<div id="suggestDiv" class="suggest">
				<div id="test12"></div>
					<div id="suggestListDiv"></div>
				</div>
			</div>		

		</form>
		<div id="filters" class="filters">
			<a href="${path }/main/${session_id }">Home</a>
			<a href="${path }/profile">Profile</a> 
			<a href="#" id="writeBtn" data-toggle="modal" class="write">Write</a> 
			<a href="${path }/sign-out"	class="logout">Logout</a>
		</div>
	</div>
</nav>
			