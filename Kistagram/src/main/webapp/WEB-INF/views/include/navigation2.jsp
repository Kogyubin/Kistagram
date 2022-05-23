
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
	rel="stylesheet">
<nav class="navbar-light custom-navbar">
	<div class="margin-b-30 container">
		<a class="navbar-brand" href="${path }/main">Kistagram.</a>

		<div style="float: right;">
			<span class='green_window'> <input id=text type="text"
				class='input_text green_window' name="search"
				onkeydown="enterSearch()" />
			</span> <input type="button" class='sch_smit' value="검색"
				onclick="myFunction()" />
		</div>
		<div id="filters" class="filters">
			<a href="${path }/profile">Profile</a> <a id="writeBtn"
				data-toggle="modal" class="write">Write</a> <a href="#"
				data-filter=".branding">Follow</a> <a href="${path }/sign-out"
				class="logout">Logout</a>
		</div>
	</div>
</nav>