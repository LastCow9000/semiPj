<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<form action="front" method="post">
<input type="hidden" name="command" value="updatemember">
아이디 <input type="text" name="id" value="${sessionScope.memberVO.id}" readonly="readonly"><br>
패스워드 <input type="text" name="password" value="${sessionScope.memberVO.password}" required="required"><br>
이름 <input type="text" name="name" value="${sessionScope.memberVO.nickName}" required="required"><br>
<input type="submit" value="수정하기">
</form>
</div>
</body>
</html>