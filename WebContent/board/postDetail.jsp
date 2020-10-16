<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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
			<div class="row">
				<div class="col-sm-10">
<table class="table">
	
	<%-- 버튼 부분
		: 본인의 아이디와 일치할 경우 '수정' '삭제' 버튼 보임 --%>
	
	<c:if test="${requestScope.postVO.memberVO.id == sessionScope.memberVO.id}">
      <tr align="right">
         <td colspan="3" class="btnArea">
            <form name="deleteForm" action="${pageContext.request.contextPath}/front" method="post">
               <input type="hidden" name="command" value="deletepost"> 
               <input type="hidden" name="no" value="${requestScope.postVO.postNo}">
	            <input type="submit" class="btn" value="삭제">
            </form>            
            <form name="updateForm" action="${pageContext.request.contextPath}/front" method="post">
               <input type="hidden" name="command" value="updateform"> 
               <input type="hidden" name="no" value="${requestScope.postVO.postNo}">
	            <input type="submit" class="btn" value="수정">
            </form>
         </td>
      </tr>
	</c:if>
  
  
   <tr align="left">
      <td colspan="3">글번호 ${requestScope.rnum}</td>
   </tr>
   
   <tr>
      <td colspan="1">제목 ${requestScope.postVO.title}</td>
      <td colspan="1" align="right">작성일 ${requestScope.postVO.regDate }</td>
   </tr>
   
   <tr>
      <td colspan="1" align="left">작성자 ${requestScope.postVO.memberVO.nickName }</td>
      <td colspan="1" align="right">조회수 ${requestScope.postVO.viewCount }</td>
      <td colspan="1" align="right">좋아요수 ${requestScope.postVO.likeCount }</td>
     
   </tr>
   
   <tr>
   		<td colspan="3">본문 내용</td>
   </tr>
   
   <tr>
      <td colspan="3"><pre> ${requestScope.postVO.content}</pre></td>
   </tr>
   
   	<%-- 좋아요 / 스크랩 버튼 부분 --%>
   <tr align="center">
      <td colspan="3" class="btnArea">
         <form name="deleteForm"
            action="${pageContext.request.contextPath}/front" method="post">
            <input type="hidden" name="command" value="조하조하요~"> <input
               type="hidden" name="no" value="${requestScope.postVO.postNo}">
         </form>            
         <form name="updateForm"
            action="${pageContext.request.contextPath}/front" method="post">
            <input type="hidden" name="command" value="스크랩해버릴테얌!"> <input
               type="hidden" name="no" value="${requestScope.postVO.postNo}">
         </form>
         <button type="button" class="btn" onclick="위에 폼 히든주고 왜 서브밋이없쪄?">좋아요</button>
         <button type="button" class="btn" onclick="히히히 똥이다">스크랩</button>
      </td>
   </tr>
   
   <tr>
      <td colspan="3">댓글 폼 부분</td>
   </tr>
   
</table>

</div>
</div>
</div>
</body>
</html>