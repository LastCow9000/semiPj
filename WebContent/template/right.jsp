
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
img {
	width: 200px;
	height:300px;
}
</style>
	<!--  로그인 오른쪽에 고정되는 화면 -->
	<c:choose>
	<c:when test="${sessionScope.memberVO==null }">
	<form action="${pageContext.request.contextPath}/front" method="POST">
	<p>
		<input type="hidden" name="command" value="login">
		<input type="text" name="id" placeholder="ID" required="required"> 
		<input type="password" name="Password" placeholder="Password" required="required"> 
		<input type="submit" value="로그인">
	</p>	
	</form>
	<p>
		<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
	</p>	
	
	
	</c:when>
	
	<c:otherwise>
	<p align="center">
		${sessionScope.memberVO.ageName } <br>
		${sessionScope.memberVO.nickName }님 <br>
		로그인 중
	</p>
	
	<p>
		<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br><br>
	</p>
	
	<p>
		<a href="${pageContext.request.contextPath}/front?command=getdetailmember">내 정보</a>
	</p>
	
	<p>
		<a href="#">비밀번호 찾기</a>
	</p>
	
	<p>
		<a href="${pageContext.request.contextPath}/front?command=myScrapList">마이 스크랩</a>
	</p>
	<p>
		<a href="${pageContext.request.contextPath}/front?command=myList">마이 스크랩</a>
	</p>
	</c:otherwise>
	</c:choose>
	<br>
	
	<!-- 랭킹 기능구현 -->
	<!-- 시대별 게시판에 들어가게 되면 HomeComtroller에서 받아온 rankList가 null이 된다. -->
<c:choose>
	
	<c:when test="${requestScope.rankList==null }">
		 <c:if test="${requestScope.ageName =='조선시대'}">
			<img src="조선시대.jpg"> 
		 </c:if>
		<c:if test="${requestScope.ageName =='고조선시대'}">
			<img src="고조선시대.jpg"> 
		 </c:if>
		 <c:if test="${requestScope.ageName =='고려시대'}">
			<img src="고려시대1.jpg"> 
		 </c:if>
		 <c:if test="${requestScope.ageName =='삼국시대'}">
			<img src="삼국시대.jpg"> 
		 </c:if>
		
	</c:when>
	<c:otherwise>
		<!-- HomeController에서 받아온 rankList로 랭킹 포인트많은 순으로 정렬.  -->
		<div class="container">
		<div class="row">
		<div class="col-sm-3">
			<div class="panel panel-primary">
				<div class="panel-heading">핳랭킹 </div>
			<table class="table hoh">
				<thead>
					<tr>
						<th>   닉네임</th>
						<th>포인트</th>
					</tr>
					<c:forEach items="${requestScope.rankList}" var="list"
						varStatus="status" begin="0" end="4" step="1">
						<tr>
							 <th><span class="badge badge-danger-light">${status.index+1 }</span>${list.nickName}</th>
							<th>${list.point}</th>
						</tr>
					</c:forEach>
				</thead>
			</table></div>
		</div></div></div>
	</c:otherwise>
	
</c:choose>
