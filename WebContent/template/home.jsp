<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 핳게시물 --%>
<%-- 고조선 시대 --%>
<div class="container">
	<div class="row">
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">고조선시대 핳 게시물</div>
				<form id="gojosun">
					<table class="table hoh">
						<thead>
							<tr align="center">
								<td align="center">순위</td>
								<td colspan='1'>제목</td>
								<td colspan='20'>작성자</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.gojosunList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr align="center">
									<td>${status.count}</td>
									<!-- 제목 -->
									<td width=300px>
									<a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">
									<c:choose>
									<c:when test="${fn:length(list.title) gt 10}">
									<c:out value="${fn:substring(list.title, 0, 9) }..."></c:out>
									</c:when>
									<c:otherwise>
									${list.title}
									</c:otherwise>
									</c:choose>
									<span class="label label-danger">${list.replyCount}</span></a>
									</td>
									<%-- 23자리까지 --%>
									<td>${list.memberVO.nickName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">삼국시대 핳 게시물</div>
				<form id="threeKingdom">
					<table class="table hoh">
						<thead>
							<tr align="center">
								<td>순위</td>
								<td colspan='1'>제목</td>
								<td colspan='20'>작성자</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.threeKingdomList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr align="center" 	>
									<!-- 순위 -->
									<td>${status.count}</td>
									<!-- 제목 -->
									<td width=300px>
									<a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">
									<c:choose>
									<c:when test="${fn:length(list.title) gt 10}">
									<c:out value="${fn:substring(list.title, 0, 9) }..."></c:out>
									</c:when>
									<c:otherwise>
									${list.title}
									</c:otherwise>
									</c:choose>
									<span class="label label-danger">${list.replyCount}</span></a>
									</td>
									<%--작성자(닉네임) --%>
									<td>${list.memberVO.nickName}</td>
								</tr>
								
								
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>

	</div>
</div>
<br>

<!-- 홈화면에서 아래에 있는 두개의 핫게시물 공간 -->
<div class="container">
	<div class="row">
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">고려시대 핳 게시물</div>
				<div class="panel-body">
					<form id="goryeo">
						<table class="table hoh">
							<thead>
								<tr align="center">
									<td>순위</td>
									<td colspan='1'>제목</td>
									<td colspan='20'>작성자</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.goryeoList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr align="center">
									<td>${status.count}</td>
										<!-- 제목 -->
									<td width=300px>
									<a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">
									<c:choose>
									<c:when test="${fn:length(list.title) gt 10}">
									<c:out value="${fn:substring(list.title, 0, 9) }..."></c:out>
									</c:when>
									<c:otherwise>
									${list.title}
									</c:otherwise>
									</c:choose>
									<span class="label label-danger">${list.replyCount}</span></a>
									</td>
									<%--23자리까지 --%>
									<td>${list.memberVO.nickName}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">조선시대 핳 게시물</div>
				<div class="panel-body">
					<form id="josun-list.jsp">
						<table class="table hoh">
							<thead>
								<tr align="center">
									<td>순위</td>
									<td colspan='1'>제목</td>
									<td colspan='20'>작성자</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.josunList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr align="center">
									<td>${status.count}</td>
										<!-- 제목 -->
									<td width=300px>
									<a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">
									<c:choose>
									<c:when test="${fn:length(list.title) gt 10}">
									<c:out value="${fn:substring(list.title, 0, 9) }..."></c:out>
									</c:when>
									<c:otherwise>
									${list.title}
									</c:otherwise>
									</c:choose>
									<span class="label label-danger">${list.replyCount}</span></a>
									</td>
									<%--23자리까지--%>
									<td>${list.memberVO.nickName}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				<!-- <div class="panel-footer">현재 가장 좋아요수가 가장 높은 게시물들 입니다</div>  -->
			</div>
		</div>

	</div>
</div>
<br>
<br>