<%@page import="java.util.HashMap"%>
<%@page import="vo.Cpu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/form.css">
<title>ram 리스트</title>

</head>
<body>
<jsp:include page="template.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<section>
<c:if test="${ramList != null}">
<h2>ram 정보</h2>	
 
<table>
	<tr>
		<c:forEach var = "ram" items="${ramList }" varStatus="status">
		<td>
			<a href="ramView.do?id=${ram.id}">
			<img src="images/${ram.image}" id="productImage"/>
			</a><br>
			상품명:${ram.name}<br>
			가격:${ram.price}<br>
			조회수:${ram.readcount }<br>
		</td>
		<c:if test="${((status.index+1) mod 4)==0 }">
			</tr>
			<tr>
		</c:if>
		</c:forEach>
	</tr>
</table>
</c:if>
<c:if test="${ramList==null }">
	<div class="div_empty">
	<h3>램리스트에 담긴 정보가 없습니다.</h3>
	</div>
</c:if>
<c:if test="${todayImageList !=null }">



<div id ="todayImageList">
	<h2>오늘 본 상품 목록</h2>
<table>
	<tr>
		<c:forEach var="todayImage" items="${todayImageList}" varStatus="status">
		<td>
			<img src="images/${todayImage}" id="todayImage"/>
		</td>
			<c:if test="${((status.index+1) mod 4)==0 }">
			</tr>
			<tr>
		</c:if>
		</c:forEach>
	</tr>
</table>
</div>
</c:if>
</section>
<!-- 관리자만 보이는 페이지 -->
<section>
	<ul>	
		<li><a href="cpuRegistForm.do" class="adPage">CPU등록</a></li>
		<li><a href="ramRegistForm.do" class="adPage">램 등록</a></li>
 		<li><a href="mainboardRegistForm.do" class="adPage">메인보드 등록</a></li>
 		<li><a href="gpuRegistForm.do" class="adPage">그래픽카드 등록</a></li>
 	</ul>
 	<ul>
		<li><a href="cpuList.do" class="light_com">cpu리스트 보러가기</a></li>
		<li><a href="ramList.do" class="light_com">ram리스트 보러가기</a></li>
		<li><a href="gpuList.do" class="light_com">그래픽카드 보러가기</a></li>
		<li><a href="mainboardList.do" class="light_com">메인보드 보러가기</a></li>
	</ul>
</section> 

</body>
</html>