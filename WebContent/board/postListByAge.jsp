<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="container">
		<div class="container">
			<div class="row">
				<div class="col-sm-10">
					<div class="panel panel-primary">
						<div class="panel-heading">${requestScope.ageName}게시물~!</div>
						<table class="table hoh">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>좋아요</th>
									<th>조회수</th>
									<th>게시일</th>
									<th>
							</th>
								</tr>
							</thead>
							<tbody>

				<c:set var="pb" value="${requestScope.listvo.pagingBean}" />
							<c:forEach items="${requestScope.listvo.list }" var="list" varStatus="status">
							<tr>
								<td>
									${requestScope.totalPostCount-((pb.nowPage-1)*pb.postCountPerPage+status.index)}
								</td>
								<td><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}&rnum=${requestScope.totalPostCount-((pb.nowPage-1)*8+status.index)}">
								${list.title} <span class="badge">${list.replyCount}</span>
								</a></td>
										<td>${list.memberVO.nickName}</td>
										<td>${list.likeCount}</td>
										<td>${list.viewCount}</td>
										<td>${list.regDate}</td>
							</tr>
							</c:forEach>
					
								<%-- <c:forEach var="list" items="${requestScope.listvo.list}">

									<tr>
										<td>${list.rnum}</td>
										<td><a 
													href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}&rnum=${list.rnum}">${list.title}</a></td>
										<td>${list.memberVO.nickName}</td>
										<td>${list.likeCount}</td>
										<td>${list.viewCount}</td>
										<td>${list.regDate}</td>
									</tr>
						

								</c:forEach> --%>
							</tbody>
						</table>
					</div>
					<c:if test="${sessionScope.memberVO.ageName == requestScope.ageName}">
					<div align="right">
						<button type="submit" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/front?command=writepostform'">글쓰기</button>
					</div>
					</c:if>
					<%-- 페이징 처리 --%>
					<c:set var="pb" value="${requestScope.listvo.pagingBean}" />
					<div class="pagingArea">
						<div class="pagination">
							<c:if test="${pb.previousPageGroup}">
								<a
									href="front?command=agelist&agename=${requestScope.ageName}&pageNo=${pb.startOfPageGroup-1}">&laquo;</a>
							</c:if>
							<c:forEach var="i" begin="${pb.startOfPageGroup}"
								end="${pb.endOfPageGroup}">
								<c:choose>
									<c:when test="${pb.nowPage!=i}">
									<c:choose>
										<c:when test="${requestScope.flag&&requestScope.ageName!=null}">
											<a href="front?command=ageSearch&agename=${requestScope.ageName}&option=${requestScope.option}&word=${requestScope.word}&pageNo=${i}">${i}</a>
										</c:when>
										<c:when test="${requestScope.flag }">
										<a href="front?command=searchall&option=${requestScope.option}&word=${requestScope.word}&pageNo=${i}">${i}</a>
										</c:when>
										<c:otherwise>
										<a href="front?command=agelist&agename=${requestScope.ageName}&pageNo=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
									</c:when>
									<c:otherwise>
										<a href="#" class="active">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pb.nextPageGroup}">
								<a
									href="front?command=agelist&agename=${requestScope.ageName}&pageNo=${pb.endOfPageGroup+1}">&raquo;</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>