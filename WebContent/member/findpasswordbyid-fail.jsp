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
	alert("사용자 정보가 없습니다 다시입력해주세요");
	location.href="${pageContext.request.contextPath}/front?command=findpasswordbyid";
</script>
</body>
</html>