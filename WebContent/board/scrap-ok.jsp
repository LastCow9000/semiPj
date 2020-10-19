<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(confirm("${requestScope.postNo} 스크랩 완료!\n마이 스크랩 페이지로 이동하시겠습니까?"))
		location.href = "";
	else
		return;
</script>
</head>
<body>
</body>
</html>