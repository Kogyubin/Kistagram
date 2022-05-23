

$(function() {
	$(".btn").click(function() {
	    $(".form-signup").toggleClass("form-signup-left");
		alert("되나");
		});
});


$(function() {
	$(".btn-signup").click(function(e) {
	 e.preventDefault();
	 idcheck = $("#idcheck").val();
	 id = $("#id").val();
	 pw = $("#pw").val();
	 name = $("input[name='name']").val();
	 Phone = $("input[name='Phone']").val();

	 
	 if(idcheck=="true"){
		if(id=="") {
			alert("ID를 입력하세요.");
			return;
		}
		
		if(name==""){
			alert("Name을 입력하세요.");
			return;
		}
		if(Phone==""){
			alert("Phone number을 입력하세요.");
			return;
		}
		if(pw==""){
			alert("password을 입력하세요.");
			return;
		}
		
		$(".form-signup").attr("action","sign-up-ok").submit();
		
	}else{
		alert("ID Check 부탁드립니다.");
	}
	 
	});
});


$(function() {
	$(".btn-idcheck").click(function(e) {
		//id check 버튼 클릭시 동작

		let id = $("#id").val();
		console.log(id);
		e.preventDefault();
		const httpRequest = new XMLHttpRequest();
		
		httpRequest.onreadystatechange = function() { //httpRequeset의 값이 변경될때마다 호출
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){

				let flag = httpRequest.responseText
				if(flag=="true") { //id가 존재하지않을때
					$("#idcheck-text").text("사용가능한 ID 입니다.");
					$("#idcheck").val(flag);
				}else { //id가 존재할때
					$("#idcheck-text").text("사용불가능한 ID 입니다.");
					$("#idcheck").val(flag);
				}
			}
		}
		
		httpRequest.open("POST", "id-check", true);
		httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		httpRequest.send("id="+id);
		
	});

});
	