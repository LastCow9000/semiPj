<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	alert("${requestScope.nickName}님 회원가입 완료되었습니다!");
	location.href="${pageContext.request.contextPath}/front?command=home";
</script>
