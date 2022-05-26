<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                         <!-- http://localhost:8989/kitri/ -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/img/kistagram favicon.PNG" rel="icon">
<link href="${path }/resources/css/custom.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${path }/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${path }/resources/js/httpRequest.js" charset="UTF-8"></script>

<script> 
function sendKeyword(){			
	  var userKeyword = document.myForm.userKeyword.value;
	  if(userKeyword==""){
	   hide();//검색창이 비워져있으면 숨김
	   return;
	  }
	  var params = "userKeyword="+userKeyword;
	  console.log("params : "+params)
	  sendRequest('${path}/search', params, displaySuggest, "POST");
}


	 function displaySuggest(){
	  if(httpRequest.readyState==4){
	   if(httpRequest.status==200){//서버응답 정상처리인 경우
	    var resultText = httpRequest.responseText;//resposne로 넘어온 텍스트 할당
	    var text = JSON.parse(resultText);
	    
	    console.log(text);
	    
//	   	var arr = resultText.split(",");
	    
	    
//	    var keywordList = arr;
	 
//	    if(arr.length>0){
	     var html = "";
	     for(var i=0;i<text.length;i++){		
	      		
	    	  html += "<div id='search-box'>";
	      if(text[i].profile_name==null){
	    	  html += "<img src='${path}/resources/img/profile.png' id='search-img'>";
	      } else {
	    	  html += "<img id='search-img' src='${path}/resources/profileimg-uploadfolder/" +text[i].id +"/" + text[i].profile_name + "'>"
	      }
	    	  html += "<div id='search-id-name'>";
	      html += "<a id='search-id' href=\"javascript:select('" +
	      text[i].id + "');\">" +
	      text[i].id + "</a>"
	      html += "<div id='search-name'>"+text[i].name+"</div>";
	      html += "</div>";
	      html += "</div>";
		    	  
		    	  
	     		 console.log(text[i].profile_name);
	      //"<img src='/resources/profileimg-uploadfolder/" +text[i].id +"/" + text[i].profile_name + "'><br/>"
	      //<a href="javascript:select('ajax');">ajax</a><br/>
	     }
	     var suggestListDiv = document.getElementById("suggestListDiv");
  	 suggestListDiv.innerHTML = html;
	     show(); 
//	    }else{
//	     //count==0
//	     hide();
//	    } 
	   }else{
	    //status!=200
	    hide();
	   }
	  }else{
	   //readyState!=4
	   hide();
	  }
	 }//function..end


	 //사용자가 제시어중에서 클릭한 키워드
	 function select(selectKeyword){
	  //클릭한 제시어를 inputbox에 넣어줌
	  document.myForm.userKeyword.value = selectKeyword;
	  location.href = '${path}/main/'+selectKeyword;
	  
	  hide();//다른 제시어 감춤
	 }
	 function show(){
	  var suggestDiv = document.getElementById("suggestDiv");
	  suggestDiv.style.display = "block";
	 }
	 function hide(){
	  var suggestDiv = document.getElementById("suggestDiv");
	  suggestDiv.style.display = "none";
	 }
	 //처음 DOM이 로드되었을때 보이지 않도록
	 window.onload = function(){
	  hide();
	 }
</script>


 
 