<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
   alert("사용자 정보가 없습니다 다시입력해주세요");
   location.href="${pageContext.request.contextPath}/front?command=findpasswordform";
</script>