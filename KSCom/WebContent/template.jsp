<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

function inputNameChk() {
	document.writeForm.resultNameDB.value="notChk";
}



$(function (){
	$(document).ready(function(){
	    $(".onlyNum").keyup( function(){
	    	$(this).val( $(this).val().replace(/[^0-9]/gi,"") ); 
	    	});
	    
	   
	
	   
	});
	
	$('.buttonCss').css({'background-color':'lightpink',
		'color':'white','border':'none','font-size':'1em'
	});
	$('.buttonCss').mouseover(function () {
		$(this).css('color','red');
	});
	$('.buttonCss').mouseleave(function () {
		$(this).css('color','white');
	});
	
	$('#memberDel').click(function () {
		var conf=confirm('정말 삭제하시겠습니까?');
		if(conf){
			del_var=$('#memberDel_val').val();
			var confRs=prompt('해당 삭제 아이디를 입력해 주세요:');
			
			if(confRs==del_var){
				return true;
			}else {
				alert('아이디가 틀렸습니다');
				return false;
			}
		}else{
			return false;
		}
	});
		
	//regist 등록폼에 form action 값 전달하기
	$('.writeSubCpu').click(function () {
		
		var chk2=$.trim($('input[type=text]').val());
		var trueRs= $("input[name='resultNameDB']").val();
		
		 if(trueRs == 'notRs'){
			alert('제품 명이 중복 됩니다.');
			return false;
		}else if(trueRs == 'notChk'){
			alert('중복 체크 해주십시오');
			return false;
		}else{
			var conf=confirm('등록 하시겠습니까?');
			 
			if(conf){
				$('[name=writeForm]').attr('action','cpuRegist.do');
			}else{
				return false;
			}
		}
		
		
		
	});
	$('.writeSubGpu').click(function () {
		
		var trueRs= $("input[name='resultNameDB']").val();
		
		if(trueRs == 'notRs'){
			alert('제품 명이 중복 됩니다.');
			return false;
		}else if(trueRs == 'notChk'){
			alert('중복 체크 해주십시오');
			return false;
		}else{
			var conf=confirm('등록 하시겠습니까?');
			 
			if(conf){
				$('[name=writeForm]').attr('action','gpuRegist.do');
			}else{
				return false;
			}
		}
		
		
		
		
	});
	$('.writeSubCom_case').click(function () {
		
		var trueRs= $("input[name='resultNameDB']").val();
		
		if(trueRs == 'notRs'){
			alert('제품 명이 중복 됩니다.');
			return false;
		}else if(trueRs == 'notChk'){
			alert('중복 체크 해주십시오');
			return false;
		}else{
			var conf=confirm('등록 하시겠습니까?');
			 
			if(conf){
				$('[name=writeForm]').attr('action','com_caseRegist.do');
			}else{
				return false;
			}
		}
		
	});
	$('.writeSubRam').click(function () {
		
		var trueRs= $("input[name='resultNameDB']").val();
		
		if(trueRs == 'notRs'){
			alert('제품 명이 중복 됩니다.');
			return false;
		}else if(trueRs == 'notChk'){
			alert('중복 체크 해주십시오');
			return false;
		}else{
			var conf=confirm('등록 하시겠습니까?');
			 
			if(conf){
				$('[name=writeForm]').attr('action','ramRegist.do');
			}else{
				return false;
			}
		}
		
	});
	$('.writeSubMain').click(function () {
		
		var trueRs= $("input[name='resultNameDB']").val();
		
		if(trueRs == 'notRs'){
			alert('제품 명이 중복 됩니다.');
			return false;
		}else if(trueRs == 'notChk'){
			alert('중복 체크 해주십시오');
			return false;
		}else{
			var conf=confirm('등록 하시겠습니까?');
			 
			if(conf){
				$('[name=writeForm]').attr('action','mainboardRegist.do');
			}else{
				return false;
			}
		}
		
	});
	
	//움직이는 배너
	$('.slide_gallery').bxSlider({
		auto: true,
		speed:500,
		autoHover:true,
		pause:500,
		autoControls: true,
		stopAutoOnClick: true,
		pager: true
	});
	
	$('buttonCss').click(function () {
		('#.userSearch').val();
	});
	
	
	
	
	
});

function itemsCheck(){
	var nameStr=document.getElementById("name").value;

    $.ajax({
        url : "items.do?name="+nameStr,
        type : 'POST',
        success : function(data){
        	var trimPlz=$("input[name='name']").val(); //만약 빈값이면 처리하는 변수
        	if(data =="suc" && trimPlz==''){
        	 $('#resultName').css('color' , '#d11507');
           	 $('#resultName').text("빈 값 넣지 마시오.");
           	 $("input[name='resultNameDB']").val('notRs');
           	 $('#name').focus();
        	}
        	else if(data =="suc"){
            	 $('#resultName').css('color' , 'green');
            	 $('#resultName').text("사용 가능한 제품명");
            	 $("input[name='resultNameDB']").val('trueRs'); //hidden 값
            	
             }else{
            	 $('#resultName').css('color' , '#d11507');
            	 $('#resultName').text("사용 불가 제품 명");
            	 $("input[name='resultNameDB']").val('notRs');
            	 $('#name').focus();
            	 
             }
        }
    });
    
}


// function popTest() {
// 	document.getElementByName('popSearch').value;
// }

// $(function () {
// 	$("input[name='popButton']").click(function () {
// 		var realName=$("input[name='popSearch']").val();
// 		 $.ajax({
// 		        url : "popularSearchAction.do?name="+realName,
// 		        type : 'POST',
// 		        success : function(data){
// 		        		if(data =="suc2"){
// 		        		alert('아아');
// 		        	}else{
// 		        		alert('가가');
// 		        	}
// 		        }
// 		    });
		
// 	});
// });
</script>
<title>템플릿</title>
<link rel="stylesheet" href="css/form.css">

</head>
<body>

<header>
	
	
	<ul>
		<li><a href="ad_AddListSuccess.do"><span style="color: yellow; font-size: 1.2em;">콩순이 컴퓨터 </span><br>
		 <span style="color: #964b00; font-size: 0.8em; font-weight: bold;">추석도 콩순이!<br>함께 놀아요!</span></a></li>
		<li><a href="ad_AddListSuccess.do"><img src="images/logo.jpg" style="width: 80px; height: 80px;"></a></li>
		
		<c:choose>
		<c:when test="${id eq 'admin' && id ne null }">
		<div class="rightLi">
		<li><a href="AdminPage.jsp">관리자 페이지 가기</a></li>
		<li><a href="ad_AddListSuccess.do">제품보러가기</a></li>
		<li><a href ="memberLogoutAction.me">로그아웃</a></li>
		<li><div class="white_h4" >[${id }]님 환영합니다</div></li>
		<li><input type="text" class="right_text" value="" placeholder="검색 창">
			<a href="javascript:;"><img src="images/search.jpg" class="img20"></a></li>
		</div>
		</c:when>
		
		<c:when test="${id eq null || empty id }">
		<div class="rightLi">
		<li><a href ="loginForm.jsp">로그인</a></li>
		<li><a href="cpuCartList.do">장바구니</a></li>
		<li><a href="ad_AddListSuccess.do">제품보러가기</a></li>
		<li><input type="text" class="right_text" value="" name="popSearch" placeholder="검색 창">
			<input type="button" name="popButton" value="버튼">
		</li>
		
		</div>
		</c:when>
		
		<c:otherwise>
		<div class="rightLi">
		<li><a href ="memberLogoutAction.me">로그아웃</a></li>
		<li><a href="cpuCartList.do">장바구니</a></li>
		<li><a href="ad_AddListSuccess.do">제품보러가기</a></li>
		<li><div class="white_h4"><a href="memberModifyFormAction.me?id=${id }">[${ id }]</a> 님환영합니다</div></li>
		<li><input type="text" class="right_text" value="" placeholder="검색 창">
			<a href="javascript:;"><img src="images/search.jpg" class="img20"></a></li>
		
		</div>
		</c:otherwise>
		</c:choose>
		
		
		
	</ul>
	

</header>



</body>
</html>