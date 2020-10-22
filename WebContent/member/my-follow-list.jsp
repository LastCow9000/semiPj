<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-sm-9">

			<div class="panel panel-primary">
				<div class="panel-heading">${sessionScope.memberVO.nickName}님의
					팔로우 목록</div>
				<table class="table hoh">
					<thead>
						<tr align="center">
							<th>번호</th>
							<th>시대이름</th>
							<th>제목</th>
							<th>작성자</th>
							<th>좋아요</th>
							<th>조회수</th>
							<th>작성 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.listvo.list}" var="list"
							varStatus="status">
							<tr>
								<td>${list.postNo}</td>
								<td>${list.memberVO.ageName}</td>
								<td><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}">
									${list.title}<span class="label label-info">${list.replyCount}</span>
									</a></td>

								<td>${list.memberVO.nickName}</td>
								<td>${list.likeCount}</td>
								<td>${list.viewCount}</td>
								<td>${list.regDate}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<%-- 페이징 처리 --%>
			<c:set var="pb" value="${requestScope.listvo.pagingBean}" />
			<div class="pagingArea">
				<div class="pagination">
	
							<%-- 왼쪽 페이지 이동 --%>
							<c:if test="${pb.previousPageGroup}">
								<a
									href="front?command=myFollowList&id=${sessionScope.memberVO.id}&pageNo=${pb.startOfPageGroup-1}">&laquo;</a>
							</c:if>
					
					<c:forEach var="i" begin="${pb.startOfPageGroup}"
						end="${pb.endOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=i}">
										<a
											href="front?command=myFollowList&id=${sessionScope.memberVO.id}&pageNo=${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="#" class="active">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
							<%-- 오른쪽 페이지 이동 --%>
							<c:if test="${pb.nextPageGroup}">
								<a
									href="front?command=myFollowList&id=${sessionScope.memberVO.id}&pageNo=${pb.endOfPageGroup+1}">&raquo;</a>
							</c:if>
					
				</div>
			</div>
		</div>
	</div>
</div>
