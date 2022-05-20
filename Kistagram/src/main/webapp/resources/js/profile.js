$(function() {
	$(".btn").click(function() {
	    $(".form-profile").toggleClass("form-profile-left");
	    $(".form-profileimg").toggleClass("form-profileimg-left");
		});
});
		

$(function() {
	$(".btn-profile1").click(function(e) {
	 e.preventDefault();
	 id = $("#id").val();
	 name = $("input[name='name']").val();
	 Phone = $("input[name='Phone']").val();
	 introduce = $("textarea[name='introduce']").val();

	 $(".form-profile").attr("action","profile-up").submit();
		
	
	 
	});
});





//var formData = new FormData(document.getElementById('myForm')); 
//
//$.ajax({ 
//	type:"POST", 
//	enctype: 'multipart/form-data', 
//	processData:false, 
//	contentType:false, 
//	url:'${path}/profileimg-up', 
//	data:formData, 
//	success:function(data){ 
//	
//	
//	
//	console.log("success") 
//		
//	} 
//});
//
//var profilephoto = document.getElementById('#profile-photo').files[0];
//$(function() {
//	$("#test").onchange(function(e) {
//	 e.preventDefault();
//	 
//	 
//	 
//	 console.log("dd" + profilephoto)
//
//	
//
//
//	 
//		
//	
//	 
//	});
//});




//$(function() {
//	$(".btn-profileimg").click(function(e) {
//	 e.preventDefault();
//	 
//
//	
//
//	 $(".form-profileimg").attr("action","profileimg-up").submit();
//		
//	
//	 
//	});
//});



//$(".btn-profileimg").click(function() {
//		
//		var form = $('.form-profileimg')[0];
//		var formData = new FormData(form);
//		
//		var inputFile = $("input[name='imgup']");
//		var files = inputFile[0].files;
//		
//		
//		console.log(files);
//		
//		//파일 formData에 추가
//	
//		for(var i=0; i< files.length; i++){
//			formData.append('uploadfiles', files[i]);
//			
//			}
//		
//		$.ajax({
//			type: "POST",
//			enctype: 'multipart/form-data',
//			url: '${path}/profileimg-up',
//			processData: false,
//			contentType: false,
//			data: formData,
//			
//			success: function(result){
//		
//				
//			
//			}
//			
//		});
		