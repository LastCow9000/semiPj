<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set value="${pageContext.request.contextPath}" var="path" />




<nav class="navbar">

	<div class="container-fluid">
		<!-- header - 홈 부분 -->
		  <div class="navbar-header navbar-left">
     		 <a class="navbar-brand" href="${path}/front?command=home">
      			<img class="logo" alt="Logo" src="${path}/header_image/HOH_logo_idu.png"></a>
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










