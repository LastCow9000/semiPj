<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>비밀번호찾기</h3>
<form action="${pageContext.request.contextPath }/front" method="Post" id="findpasswordForm">
<input type="hidden" name="command" value="findpasswordbyid">
아이디<input type="text" class="idform" name="id" id="id" required="required">
<span id="idCheckResult"></span><br>

닉네임<input type="text" class="passform" name="nickname" id="nickname" required="required">
<span id="nickCheckResult"></span><br>
<br>
<input type="submit" value="비밀번호찾기">

</form>
</body>
</html>