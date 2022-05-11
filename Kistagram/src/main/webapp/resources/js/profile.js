$(function() {
	$(".btn").click(function() {
	    $(".form-profile").toggleClass("form-profile-left");

		});
});


$(function() {
	$(".btn-profile").click(function(e) {
	 e.preventDefault();
	 id = $("#id").val();
	 name = $("input[name='name']").val();
	 Phone = $("input[name='Phone']").val();

	 $(".form-profile").attr("action","profile-up").submit();
		
	
	 
	});
});