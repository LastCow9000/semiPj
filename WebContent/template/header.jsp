<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" />



<nav class="navbar bg-warning">

	<div class="container-fluid">
		<!-- header - 홈 부분 -->
		  <div class="navbar-header navbar-left">
     		 <a class="navbar-brand" href="${path}/front?command=home">
      			<img class="logo" alt="Logo" src="${path}/header_image/temp_logo.png"></a>
		 </div>

		<!-- header - 메뉴 부분 -->
		<div class="navbar-menu">
			<ul class="nav navbar-nav navbar-center">
				<li class="nav-item"><a href="${path}/front?command=noticeList&agename=공지사항"><font color="orange">공지사항</font></a></li>
				<li class="nav-item"><a href="${path}/front?command=agelist&agename=고조선시대">고조선</a></li>
				<li class="nav-item"><a href="${path}/front?command=agelist&agename=삼국시대">삼국</a></li>
				<li class="nav-item"><a href="${path}/front?command=agelist&agename=고려시대">고려</a></li>
				<li class="nav-item"><a href="${path}/front?command=agelist&agename=조선시대">조선</a></li>
			</ul>
		</div>

	</div>
</nav>

<!-- 
<div class="jumbotron">
  <div class="text-center">
    <a href=#><span><font size="10px">고조선 시대</font></span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
    <a href=#><font size="10px">삼국 시대 </font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=#><font size="10px">고려 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=#><font size="10px">조선 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</div> -->

<%-- 
	예울 1차 시도 -> 실패!
	
	<header class="header">
	<div class="range">
		<!-- 사이트 제목 -->
		<h1 class="header-title">
			<a href="#"><img class="logo" src="${path}/header_image/temp_logo.png"></a>
		</h1>
		
		<!-- 사이트 카테고리 -->
		<div class="header-menu">
			<ul>
				<li class="gojoseon_link"></li>
				<li class="samgook_link"></li>
				<li class="goryeo_link"></li>
				<li class="joseon_link"></li>
			</ul>
		</div>
	
	</div>
</header> --%>

 
	<%--  예울 2차 시도 -> 실패! 
	
	<nav class="navbar bg-warning">
  <div class="container-fluid">
  
  	<!-- header - 로고 부분 -->
    <div class="navbar-header navbar-left">
      <a class="navbar-brand" href="${path}/front?command=home">
      	<img class="logo" alt="Logo" src="${path}/header_image/temp_logo.png"></a>
    </div>
    
    <!-- header - 메뉴 부분 -->
    <div class="navbar-menu">
    <ul class="nav navbar-nav navbar-center">
      <li class="nav-item"><a href="${path}/front?command=agelist&agename=고조선시대" class="img_pad">
		<img class="header_menu_img" alt="고조선" 
			src="${path}/header_image/gojoseon_head_img.jpg">고조선</a></li>
      <li class="nav-item"><a href="${path}/front?command=agelist&agename=삼국시대">삼국</a></li>
      <li class="nav-item"><a href="${path}/front?command=agelist&agename=고려시대">고려</a></li>
      <li class="nav-item"><a href="${path}/front?command=agelist&agename=조선시대">조선</a></li>
    </ul>
    </div>
    
    <!-- header - 공지사항 부분 -->
    <ul class="nav navbar-nav navbar-right">
      <li><a href=#><font color="orange"><strong>공지사항 작성</strong></font></a></li>
    </ul>
    
   </div>
</nav>
 --%>












