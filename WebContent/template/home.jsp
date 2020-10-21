<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('530341c9989a3cca0a363ca323fe31d0');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
<%-- 핳게시물 --%>
<%-- 고조선 시대 --%>
<div class="container">
	<div class="row">
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">고조선 시대 HoH 게시물~!</div>
				<form id="gojosun">
					<table class="table hoh">
						<thead>
							<tr>
								<td>순위</td>
								<td colspan='1'>제목</td>
								<td colspan='20'>작성자</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.gojosunList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr>
									<td>${status.count}</td>
									<td width=300px><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">${list.title} <span class="label label-danger">${list.replyCount}</span></a></td>
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
				<div class="panel-heading">삼국 시대 HoH 게시물~!</div>
				<form id="threeKingdom">
					<table class="table hoh">
						<thead>
							<tr>
								<td>순위</td>
								<td colspan='1'>제목</td>
								<td colspan='20'>작성자</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.threeKingdomList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr>
									<td>${status.count}</td>
									<td width=200px><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">${list.title} <span class="label label-danger">${list.replyCount}</span></a></td>
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
</div>
<br>

<!-- 홈화면에서 아래에 있는 두개의 핫게시물 공간 -->
<div class="container">
	<div class="row">
		<div class="col-sm-5">
			<div class="panel panel-primary">
				<div class="panel-heading">고려 시대 HoH 게시물~!</div>
				<div class="panel-body">
					<form id="goryeo">
						<table class="table hoh">
							<thead>
								<tr>
									<td>순위</td>
									<td colspan='1'>제목</td>
									<td colspan='20'>작성자</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.goryeoList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr>
									<td>${status.count}</td>
									<td width=200px><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">${list.title} <span class="label label-danger">${list.replyCount}</span></a></td>
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
				<div class="panel-heading">조선 시대 HoH 게시물~!</div>
				<div class="panel-body">
					<form id="josun-list.jsp">
						<table class="table hoh">
							<thead>
								<tr>
									<td>순위</td>
									<td colspan='1'>제목</td>
									<td colspan='20'>작성자</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.josunList}" var="list"
								varStatus="status" begin="0" end="4" step="1">
								<tr>
									<td>${status.count}</td>
									<td width=300px><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">${list.title} <span class="label label-danger">${list.replyCount}</span></a></td>
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