

$(function() {
	$(".btn").click(function() {
		$(".form-signin").toggleClass("form-signin-left");
	    $(".form-signup").toggleClass("form-signup-left");

		});
});


$(function() {
	$(".btn-signin").click(function(e) {

	  
	  e.preventDefault();
	 let id =  $("input[name='username']");
	 let pw =  $("input[name='password']");
	  
	  if(id.val()==""){
		alert("ID를 입력하세요.");
		id.focus();
		return;
	}
	  if(pw.val()==""){
		alert("PW를 입력하세요.");
		pw.focus();
		return;
	}
		$(".form-signin").attr("action", "sign-in").submit();
	});
});



	