<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	alert("${requestScope.vo.nickName}님의 비밀번호는 ${requestScope.pw}입니다");
	location.href="${pageContext.request.contextPath}/front?command=home";
</script>
