<%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>
<%@page import="vo.Cart"%>
<%@page import="vo.Cpu"%>
<%@page import="dao.CpuDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<link rel="stylesheet" href="css/form.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		//올체크 하는 것
		$('#allCheck').click(function () {
		
		 if($("input:checkbox[name='allCheck']:checked").length>0){
			 $('.remove').prop("checked",true);
			 
			 }else{
				 $('.remove').prop("checked",false);
			 }
		 });
		//자동 체크박스 체크
		
		//ram
		$("input[name='remove2']").click(function () {
			var name2= $(this).attr('class');
			$(this).val(name2);
		});
		
		//cpu remove
		$("input[name='remove3']").click(function () {
			var name2= $(this).attr('class');
			$(this).val(name2);
		});
		//mainboard
		$("input[name='remove4']").click(function () {
			var name2= $(this).attr('class');
			$(this).val(name2);
		});
		//GPU
		$("input[name='remove5']").click(function () {
			var name2= $(this).attr('class');
			$(this).val(name2);
		});
		//com_case
		$("input[name='remove6']").click(function () {
			var name2= $(this).attr('class');
			$(this).val(name2);
		});
		
		$("input[type=submit]").css({'background-color':'white',
			'color':'black','border':'1px solid gray','font-size':'0.8em'
		});
		

	});

	// 	function testIndex(o){
	// 		var index=Array.prototype.indexOf.call(o.form.submitChk,o);
	// 		o.form.remove[index].checked=true;
	// }	

	function checkQty(name, qty) {
		if (qty != 1) {
			location.href = "cpuCartQtyDown.do?name="
					+ encodeURIComponent(name);
		}
	}
	function checkQtyRam(name, qty) {
		if (qty != 1) {
			location.href = "ramCartQtyDown.do?name="
					+ encodeURIComponent(name);
		}
	}
	function checkQtyMainboard(name, qty) {
		if (qty != 1) {
			location.href = "mainboardCartQtyDown.do?name="
					+ encodeURIComponent(name);
		}
	}
	function checkQtyGpu(name, qty) {
		if (qty != 1) {
			location.href = "gpuCartQtyDown.do?name="
					+ encodeURIComponent(name);
		}
	}
	function checkQtyCom_case(name, qty) {
		if (qty != 1) {
			location.href = "com_caseCartQtyDown.do?name="
					+ encodeURIComponent(name);
		}
	}
</script>


                                                                                  

</head>
<body>

<jsp:include page="template.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<!-- 토탈 변수 -->
<c:set var="total" value="0"/>



<section>

   <h2>장바구니 목록</h2>
	<form action="#" >
      <table id="tb1">
    	
        <tr class = "tr_top">
        	<td><input type="checkbox" id = "allCheck" name="allCheck" onclick="checkAll(this.form)" /> </td>
             <td>번호</td>
             <td>상품 이미지</td>
             <td>상품명</td>
             <td>가격</td>
             <td>수량</td>
             
         </tr>
        
<!-- 여기서 부터 값 들어가는 부분 -->
<!-- CPU 값 들어가는 폼 -->

<c:if test="${cartList ne null && cartList.size()>0 }">
		<tr>
			<td colspan="7"><h2>CPU</h2></td>
			
		</tr>
		
        <c:forEach var="cart" items="${cartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove3" value="${cart.name }"/></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${cart.image }" id ="cartImage"/>
            </td>
             <td>
             ${cart.name }
            </td>
             <td>
    		${cart.price *cart.qty}  	
	  		<c:set var="total" value="${total+ (cart.price * cart.qty) }"/>
		
            </td>
             <td>
             <a href="cpuCartQtyUp.do?name=${cart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${cart.qty }<br>
            <a href="javascript:checkQty('${cart.name}',${cart.qty})" >
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
           
             <td style="text-align:center;">
         	<input type="submit" class="${cart.name }"  name="remove3"  value="삭제"  formaction="cpuCartRemove.do" />
         	
         </td>
         </tr>
        </c:forEach>
        </c:if>
        
<!--  RAM 폼 들어가는 부분 -->

<c:if test="${ramcartList ne null && ramcartList.size()> 0 }">
       	<tr>
        	<td colspan="7"><h2>RAM</h2></td>
        </tr>
         <c:forEach var="ramcart" items="${ramcartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove2" value="${ramcart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${ramcart.image }" id ="cartImage"/>
            </td>
             <td>
             ${ramcart.name }
            </td>
             <td>
            ${ramcart.price *ramcart.qty}  	
	  		<c:set var="total" value="${total+ (ramcart.price * ramcart.qty) }"/>
            </td>
             <td>
             <a href="ramCartQtyUp.do?name=${ramcart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${ramcart.qty }<br>
            <a href="javascript:checkQtyRam('${ramcart.name}',${ramcart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="${ramcart.name }" name="remove2"   value="삭제" formaction="ramCartRemove.do" />

         </td>
         </tr>
        </c:forEach>
        </c:if>
<!-- 메인보드 들어가는 폼 부분         -->

<c:if test="${mainboardcartList ne null && mainboardcartList.size()>0 }">
         <tr>
        	<td colspan="7"><h2>MainBoard</h2></td>
        </tr>
         <c:forEach var="mainboardcart" items="${mainboardcartList }" varStatus="status">
        <tr>
        		 
        	 <td><input type="checkbox" class="remove" name="remove4" value="${mainboardcart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${mainboardcart.image }" id ="cartImage"/>
            </td>	
             <td>
             ${mainboardcart.name }
            </td>
             <td>
             ${mainboardcart.price *mainboardcart.qty}  	
	  		<c:set var="total" value="${total+ (mainboardcart.price * mainboardcart.qty) }"/>
            </td>
             <td>
             <a href="mainboardCartQtyUp.do?name=${mainboardcart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${mainboardcart.qty }<br>
            <a href="javascript:checkQtyMainboard('${mainboardcart.name}',${mainboardcart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="${mainboardcart.name }" name="remove4"  onclick="testIndex(this)" value="삭제" formaction="mainboardCartRemove.do" />
         </td>
         </tr>
        </c:forEach>
        </c:if>
<!-- 그래픽카드 입력 폼         -->
<c:if test="${gpucartList ne null && gpucartList.size()>0 }">
         <tr>
        	<td colspan="7"><h2>그래픽카드</h2></td>
        </tr>
         <c:forEach var="gpucart" items="${gpucartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove5" value="${gpucart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${gpucart.image }" id ="cartImage"/>
            </td>
             <td>
             ${gpucart.name }
            </td>
             <td>
              ${gpucart.price *gpucart.qty}  	
	  		<c:set var="total" value="${total+ (gpucart.price * gpucart.qty) }"/>
            </td>
             <td>
             <a href="gpuCartQtyUp.do?name=${gpucart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${gpucart.qty }<br>
            <a href="javascript:checkQtyGpu('${gpucart.name}',${gpucart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="${gpucart.name }" name="remove5" value="삭제" formaction="gpuCartRemove.do" />
         </td>
         </tr>
        </c:forEach>
        </c:if>
<!-- //TODO         -->
<!-- 하드디스크값 들어가는 부분         -->
<c:if test="${hddcartList ne null && hddcartList.size()>0 }">
 <tr>
        	<td colspan="7"><h2>HDD</h2></td>
        </tr>
         <c:forEach var="hddcart" items="${hddcartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove" value="${hddcart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${hddcart.image }" id ="cartImage"/>
            </td>
             <td>
             ${hddcart.name }
            </td>
             <td>
              ${hddcart.price *hddcart.qty}  	
	  		<c:set var="total" value="${total+ (hddcart.price * hddcart.qty) }"/>
            </td>
             <td>
             <a href="hddCartQtyUp.do?name=${hddcart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${hddcart.qty }<br>
            <a href="javascript:checkQtyMainboard('${hddcart.name}',${hddcart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="submitChk" name="submitChk"  onclick="testIndex(this)" value="삭제" formaction="hddCartRemove.do" />
         </td>
         </tr>
        </c:forEach>
     </c:if>
      
<!-- power값 들어가는 부분         -->
<c:if test="${powercartList ne null && powercartList.size()>0 }">
 		<tr>
        	<td colspan="7"><h2>Power</h2></td>
        </tr>
         <c:forEach var="powercart" items="${powercartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove" value="${powercart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${powercart.image }" id ="cartImage"/>
            </td>
             <td>
             ${powercart.name }
            </td>
             <td>
             ${powercart.price *powercart.qty}  	
	  		<c:set var="total" value="${total+ (powercart.price * powercart.qty) }"/>
            </td>
             <td>
             <a href="powerCartQtyUp.do?name=${powercart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${powercart.qty }<br>
            <a href="javascript:checkQtyMainboard('${powercart.name}',${powercart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="submitChk" name="submitChk"  onclick="testIndex(this)" value="삭제" formaction="powerCartRemove.do" />
         </td>
         </tr>
        </c:forEach>
        </c:if>
        
<!-- SSD 값 들어가는 부분         -->
<c:if test="${ssdcartList ne null && ssdcartList.size()>0 }">
 		<tr>
        	<td colspan="7"><h2>SSD</h2></td>
        </tr>
         <c:forEach var="ssdcart" items="${ssdcartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove" value="${ssdcart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${ssdcart.image }" id ="cartImage"/>
            </td>
             <td>
             ${ssdcart.name }
            </td>
             <td>
           ${ssdcart.price *ssdcart.qty}  	
	  		<c:set var="total" value="${total+ (ssdcart.price * ssdcart.qty) }"/>
            </td>
             <td>
             <a href="ssdCartQtyUp.do?name=${ssdcart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${ssdcart.qty }<br>
            <a href="javascript:checkQtyMainboard('${ssdcart.name}',${ssdcart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="submitChk" name="submitChk"  onclick="testIndex(this)" value="삭제" formaction="ssdCartRemove.do" />
         </td>
         </tr>
        </c:forEach>       
        </c:if> 
        
 <!-- com_case 값 들어가는 부분         -->
 
 <c:if test="${com_casecartList ne null && com_casecartList.size()>0 }">
 		<tr>
        	<td colspan="7"><h2>케이스</h2></td>
        </tr>
         <c:forEach var="com_casecart" items="${com_casecartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove6" value="${com_casecart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${com_casecart.image }" id ="cartImage"/>
            </td>
             <td>
             ${com_casecart.name }
            </td>
             <td>
             ${com_casecart.price *com_casecart.qty}  	
	  		<c:set var="total" value="${total+ (com_casecart.price * com_casecart.qty) }"/>
            </td>
             <td>
             <a href="com_caseCartQtyUp.do?name=${com_casecart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${com_casecart.qty }<br>
            <a href="javascript:checkQtyCom_case('${com_casecart.name}',${com_casecart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="${com_casecart.name }"  name="remove6"  onclick="testIndex(this)" value="삭제" formaction="com_caseCartRemove.do" />
         </td>
         </tr>
        </c:forEach> 
        </c:if>    
                  
<!-- other_product 값 들어가는 부분         -->
<c:if test="${other_productcartList ne null && other_productcartList.size()>0 }">
 		<tr>
        	<td colspan="7"><h2>SSD</h2></td>
        </tr>
         <c:forEach var="other_productcart" items="${other_productcartList }" varStatus="status">
        <tr>
        		
        	 <td><input type="checkbox" class="remove" name="remove" value="${other_productcart.name }" /></td>
             <td>
             ${status.index+1}<!-- 번호값계산 -->
            </td>
             <td>
             <img src = "images/${other_productcart.image }" id ="cartImage"/>
            </td>
             <td>
             ${other_productcart.name }
            </td>
             <td>
            ${other_productcart.price *other_productcart.qty}  	
	  		<c:set var="total" value="${total+ (other_productcart.price * other_productcart.qty) }"/>
            </td>
             <td>
             <a href="other_productCartQtyUp.do?name=${other_productcart.name }">
             <img src="images/up.jpg" id = "upImage"/>
             </a><br>
             ${other_productcart.qty }<br>
            <a href="javascript:checkQtyMainboard('${other_productcart.name}',${other_productcart.qty})">
            <img src="images/down.jpg" id = "downImage" />
             </a>
            </td>
             <td style="text-align:center;">
         	<input type="submit" class="submitChk" name="submitChk"  onclick="testIndex(this)" value="삭제" formaction="other_productCartRemove.do" />
         </td>
         </tr>
        </c:forEach>      
        </c:if>                 
        
   
       
        
<!--  토탈 금액 수정 바람        -->
 
      <tr>
         <td colspan="6" style="text-align:center;">
		
	  	총 금액 : ${total }원
	  
         </td>
         
         
         <td style="text-align:center;">
       	<input type="submit" id="buttonChk" value="장바구니 비우기" formaction="allCheck.me" >
      	<input type="submit" value="구매하기">
       	
      </tr>
      
      </table>
</form>
	 
	 

   		<a href="ad_AddListSuccess.do">쇼핑 계속하기</a>
   		<a href="javascript:;" class="ready">오늘 본 상품 목록</a>
   		
 		 
   
</section>
<br><br><br><br><br><hr>
<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html> 