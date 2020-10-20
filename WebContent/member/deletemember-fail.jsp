<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert("비밀번호정보가 일치하지 않습니다 다시 입력해 주세요");
location.href="${pageContext.request.contextPath}/front?command=deletememberform";
</script>
</body>
</html>