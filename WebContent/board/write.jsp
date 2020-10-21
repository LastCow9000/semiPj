<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<form action="${pageContext.request.contextPath}/front" method="post">
	<input type="hidden" name="command" value="writepost">
	<c:choose>
		<c:when test="${sessionScope.memberVO.id=='adminmts' }">
			<h3>공지사항 작성</h3>
		</c:when>
		<c:otherwise>
			<h3>글쓰기</h3>
		</c:otherwise>
	</c:choose>
	<input type="text" name="title" placeholder="제목을 입력하세요"><br><br>
	<textarea rows="20" cols="30" placeholder="내용을 입력하세요" name="content"></textarea><br>
			<input type="submit" value="작성하기"  class="btn btn-primary">
</form>
</div>
</body>
</html>