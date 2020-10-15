<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!--  로그인 오른쪽에 고정되는 화면 -->
	<c:choose>
	<c:when test="${sessionScope.memberVO==null }">
	<form action="${pageContext.request.contextPath}/front" method="POST">
	<p>
		<input type="hidden" name="command" value="login">
		<input type="text" name="id" placeholder="ID" required="required"> 
		<input type="password" name="Password" placeholder="Password" required="required"> 
		<input type="submit" value="로그인">
	</p>	
	</form>
	<p>
		<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
	</p>	
	
	
	</c:when>
	
	<c:otherwise>
	<p align="center">
	${sessionScope.memberVO.ageName } <br>
	${sessionScope.memberVO.nickName }님 로그인 중<br>
	</p>
	
	<p>
		<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br><br>
	</p>
	
	<p>
		<a href="${pageContext.request.contextPath}/front?command=getdetailmember">내 정보</a>
	</p>
	
	<p>
		<a href="#">비밀번호 찾기</a>
	</p>
	
	<p>
		<a href="#">스크랩</a>
	</p>
	
	
	</c:otherwise>
	</c:choose>
	
	
	